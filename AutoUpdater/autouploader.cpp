#include "autouploader.h"

AutoUploader::AutoUploader(QObject *parent) : QObject(parent)
{
    this->mang  = new QNetworkAccessManager(this);
}

void AutoUploader::setUserName(QString p_username)
{
   this->username = p_username;
}

void AutoUploader::setPassword(QString p_password)
{

   this->password = p_password;
}

void AutoUploader::setPort(int p_port)
{
    this->port = p_port;
}

void AutoUploader::setFileName(QString p_filename)
{
    this->filename = p_filename;
}

void AutoUploader::setUrl(QUrl p_url)
{
   this->url = p_url;
}

void AutoUploader::upload(QString p_filename)
{
   this->setFileName(p_filename);
   if(this->req != nullptr)
   {
       qDebug()<<"not ended request!"<<endl;
       return;
   }

   if(this->url.isEmpty())
   {
       qDebug()<<"no url"<<endl;
       return;
   }
   /*
   if(!this->password.isEmpty())
   {
       this->url.setPassword(this->password);
   }
   if(!this->username.isEmpty())
   {
       this->url.setUserName(this->username);
   }
   this->url.setPort(this->port);

   this->req = new QNetworkRequest(this->url);
   this->upFile =  new QFile(this->filename,this);
   if(!this->upFile->open(QIODevice::ReadOnly))
   {
       qDebug()<<"file could not be opened"<<endl;
       return;
   }
   rep = this->mang->put(*req,upFile);
   QObject::connect(rep,SIGNAL(finished()),this,SLOT(uploadDone()));
   QObject::connect(rep,SIGNAL(error(QNetworkReply::NetworkError)),this,SLOT(error(QNetworkReply::NetworkError)));
   */
   int cp = this->ftpcon.connectToHost("proje.tc");
   this->commandIdList.insert("con",cp);
   cp = this->ftpcon.login(this->username.toLatin1(),this->password.toLatin1());
   this->commandIdList.insert("login",cp);
   QObject::connect(&ftpcon,SIGNAL(stateChanged(int)),this,SLOT(stateChanged(int)));
   QObject::connect(&ftpcon,SIGNAL(commandStarted(int)),this,SLOT(commandStarted(int)));
   QObject::connect(&ftpcon,SIGNAL(commandFinished(int,bool)),this,SLOT(commandFinished(int,bool)));
   QObject::connect(&ftpcon,SIGNAL(dataTransferProgress(qint64,qint64)),this,SLOT(dataTransferProgress(qint64,qint64)));
   QObject::connect(&ftpcon,SIGNAL(rawCommandReply(int, const QString&)),this,SLOT(rawCommandReply(int,const QString&)));
   QObject::connect(&ftpcon,SIGNAL(listInfo(const QUrlInfo&)),this,SLOT(listInfo(const QUrlInfo&)));


}

void AutoUploader::uploadDone()
{
    qDebug()<<"upload finished"<<endl;
}

void AutoUploader::error(QNetworkReply::NetworkError code)
{

    qDebug()<<"error occured"<<endl;
}

void AutoUploader::stateChanged(int p_st)
{
   qDebug()<<"state : "<<p_st<<endl;
}

void AutoUploader::readyRead()
{

   qDebug()<<"Ready Read"<<endl;
}

void AutoUploader::dataTransferProgress(qint64 p1, qint64 p2)
{

   //qDebug()<<"Progress : "<<p1<<" "<<p2<<endl;
}

void AutoUploader::rawCommandReply(int p, const QString& result)
{

   qDebug()<<"reply : "<<p<<" Result: "<<result<<endl;
}

void AutoUploader::commandStarted(int p)
{

   qDebug()<<"command started : "<<p<<endl;
}

void AutoUploader::commandFinished(int p,bool r)
{

   qDebug()<<"command finished : "<<p<<" success : "<<r<<endl;
   int cm;
   if(this->ftpcon.state() == 4 && p == this->commandIdList.value("login"))
   {
    cm = this->ftpcon.list(".");
    this->commandIdList.insert("list",cm);
   }
   if(this->commandIdList.contains("cd") && this->commandIdList.value("cd") == p )
   {
       if(this->upFile != nullptr)
       {
           this->upFile->deleteLater();
       }
      this->upFile = new QFile(this->filename);
      if(upFile->open(QIODevice::ReadOnly))
      {
        start.start();
        cm = this->ftpcon.put(upFile,"video.mp4");
        this->commandIdList.insert("upload",cm);
      }

   }
   if(this->commandIdList.contains("upload") && this->commandIdList.value("upload") == p)
   {
        qDebug()<<"Elapsed : "<<start.elapsed();
   }
   /*
   if(p == 1 && r )
   {
    this->ftpcon.login(this->username,this->password);
   }
   if(p == 2 && r )
   {
    this->ftpcon.list(".");
   }
   */
}

void AutoUploader::listInfo(const QUrlInfo & pfile)
{
   qDebug()<<" item : " << pfile.name()<<endl;
   if(pfile.name().compare("videouploads") == 0)
   {
       int cm = this->ftpcon.cd("./videouploads");
       this->commandIdList.insert("cd",cm);
   }
}

void AutoUploader::done(bool bstate)
{

   qDebug()<<"done : "<<bstate<<endl;
}
