#include "ftpcontroller.h"
#include <QTextCodec>

void FTPController::close()
{
     if(updateFound)
     {
         emit newupdate();
     }else{
         emit noupdate();
     }
     if(ftpcon.state() != QFtp::State::Unconnected)
     {
         if(!commandIdList.contains("close"))
         {
             int cm= ftpcon.close();
             commandIdList.insert("close",cm);
         }
     }else{
        emit closed();
     }

}

void FTPController::emitError(QString perror)
{
                updateFound = false;
                emit error(perror);
                close();
}

QString FTPController::getCommandKey(int id)
{
   QStringList keys = commandIdList.keys();

   foreach(QString key , keys)
   {
      if(commandIdList[key] == id)
      {
          return key;
      }
   }

   return "";
}

FTPController::FTPController(QObject *parent) : QObject(parent)
{
   QObject::connect(&ftpcon,SIGNAL(stateChanged(int)),this,SLOT(stateChanged(int)));
   QObject::connect(&ftpcon,SIGNAL(commandStarted(int)),this,SLOT(commandStarted(int)));
   QObject::connect(&ftpcon,SIGNAL(commandFinished(int,bool)),this,SLOT(commandFinished(int,bool)));
   QObject::connect(&ftpcon,SIGNAL(dataTransferProgress(qint64,qint64)),this,SLOT(dataTransferProgress(qint64,qint64)));
   QObject::connect(&ftpcon,SIGNAL(rawCommandReply(int, const QString&)),this,SLOT(rawCommandReply(int,const QString&)));
   QObject::connect(&ftpcon,SIGNAL(listInfo(const QUrlInfo&)),this,SLOT(listInfo(const QUrlInfo&)));

   //QObject::connect(&timer_timeout,&QTimer::timeout,this,&FTPController::timeout);


}

void FTPController::checkVersion(QString version)
{
    QString newversion = version.replace('.','_');
    updateDir = QString("update_%1").arg(newversion);
    QString server = url.toString();
    QDir dir;
    dir.mkdir(updateDir);
    QProcess pr;
    QStringList args;
    args<<"chown"<<"linaro"<<dir.path();
    pr.start("sudo",args);
    pr.waitForFinished(3000);
    args.clear();
    args<<"chgrp"<<"linaro"<<dir.path();
    pr.start("sudo",args);
    pr.waitForFinished(3000);
    infoFile.setFileName(QString("%1/%2/infoFile").arg(QDir::currentPath()).arg(updateDir));
    int cp = this->ftpcon.connectToHost(url.toString());
    this->commandIdList.insert("con",cp);
    cp = this->ftpcon.login(this->username.toLatin1(),this->password.toLatin1());
    this->commandIdList.insert("login",cp);
    //timer_timeout.singleShot(50000,this,&FTPController::timeout);
    /*
    timer_timeout.setInterval(5000);
    */
    timer_timeout.setSingleShot(true);
    timer_timeout.start(15000);
    connect(&timer_timeout,&QTimer::timeout,this,&FTPController::timeout);
}

void FTPController::setUserName(QString p_username)
{
   username = p_username;
}

void FTPController::setPassword(QString p_password)
{
   password = p_password;
}

void FTPController::setPort(int p_port)
{
   port = p_port;
}

void FTPController::setUrl(QUrl p_url)
{
    url = p_url;
}

void FTPController::stateChanged(int p_st)
{
   qDebug()<<"state : "<<p_st<<endl;
}

void FTPController::dataTransferProgress(qint64 p1, qint64 p2)
{
   //qDebug()<<"Progress : "<<p1<<" "<<p2<<endl;
}

void FTPController::rawCommandReply(int p, const QString & result)
{
   qDebug()<<"reply : "<<p<<" Result: "<<result<<endl;
}

void FTPController::commandStarted(int p)
{
   qDebug()<<"command started : "<<p<<endl;
}

void FTPController::commandFinished(int p, bool r)
{
    //if(r) return;

   qDebug()<<"command finished : "<<p<<" success : "<<!r<<endl;
   int cm;
   QFtp::Error result;
   result = ftpcon.error();
   if(result != QFtp::NoError)
   {
       switch (result) {
       case QFtp::Error::HostNotFound:
           emitError("HostNotFound");
           return;
           break;
       case QFtp::Error::NotConnected:
           emitError("NotConnected");
           return;
           break;
       case QFtp::Error::UnknownError:
           emitError("UnknowError");
           return;
           break;
       case QFtp::Error::ConnectionRefused:
           emitError("ConnectionRefused");
           return;
           break;
       default:
           emitError("UnknownError");
           return;
       }
   }

    QString key = getCommandKey(p);

    if(key.isEmpty())
    {
          emitError(QString("Command id is not found. id : %1").arg(p));
          return;
    }

    qDebug()<<"Command Finished : "<<key<<", id: "<<p<<" ,success "<<!r<<endl;

   QStringList keys = commandIdList.keys();
   bool found = false;
   foreach(QString key , keys)
   {
      if(commandIdList[key] == p)
      {
          qDebug()<<"Command :"<<key<<endl;
          if(dowfiles.contains(key))
          {
              files.removeOne(key);
              QFile * file = dowfiles.value(key);
              file->flush();
              file->close();
              if(files.length() == 0)
              {
                close();
              }
          }
          found = true;
          break;
      }
   }
   if(!found)
   {
          qDebug()<<"Command id is not found. id : "<<p<<endl;
   }

   if(commandIdList.value("con") == p)
   {
        return;
   }else if(p == this->commandIdList.value("login"))
   {

        cm = this->ftpcon.list(".");
        this->commandIdList.insert("list",cm);

   }else if( commandIdList.value("list") == p)
   {
      return;
   }else if(this->commandIdList.contains("cd") && this->commandIdList.value("cd") == p )
   {
        //cm = this->ftpcon.put(upFile,"video.mp4");
       if(!infoFile.open(QIODevice::ReadWrite))
       {
         emitError("File cound not open");
         return;
       }
        cm = ftpcon.get("info.json",&infoFile);
        start.start();
        this->commandIdList.insert("getInfo",cm);
   }else if(this->commandIdList.contains("getInfo") && this->commandIdList.value("getInfo") == p)
   {
       infoFile.flush();
       infoFile.close();
       if(!infoFile.isOpen())
       {
           if(!infoFile.open(QIODevice::ReadOnly))
           {
                emitError("File cound not open");
                return;
           }
       }
       QTextStream str(&infoFile);
       str.setCodec(QTextCodec::codecForName("utf8"));
       QString cnt = str.readAll();
       infoFile.close();
       qDebug()<<"Elapsed : "<<start.elapsed();
       QJsonDocument doc = QJsonDocument::fromJson(cnt.toUtf8());

       QJsonObject obj = doc.object();
       if(obj.empty())
       {
                emitError("info file error");
                return;
       }
       QJsonArray ary = obj.value("files").toArray();

       files.empty();
       foreach(QJsonValue item, ary)
       {
          QString filename = item.toString();
          QFile *file = new QFile();
          file->setFileName(QString("%1/%2/%3").arg(QDir::currentPath()).arg(updateDir).arg(filename));
          if(!file->open(QIODevice::WriteOnly))
          {
              emitError("Can not create file");
              return;
          }
          cm = ftpcon.get(item.toString(),file);
          dowfiles.insert(filename,file);
          files.append(item.toString());
          commandIdList.insert(filename,cm);
       }


   }else if(commandIdList.contains("close") && commandIdList.value("close") == p)
   {
       emit closed();
   }else
   {
       if(!ftpcon.hasPendingCommands())
       {
           close();
        return;
       }
   }

}

void FTPController::listInfo(const QUrlInfo & pfile)
{
   qDebug()<<" item : " << pfile.name()<<endl;
   if(pfile.name().compare(updateDir) == 0)
   {
       int cm = this->ftpcon.cd(QString("./%1").arg(updateDir));
       this->commandIdList.insert("cd",cm);
       updateFound = true;
        if(timer_timeout.isActive())
        {
            timer_timeout.stop();
        }
   }
}

void FTPController::timeout()
{
    emitError("timeout");
}
