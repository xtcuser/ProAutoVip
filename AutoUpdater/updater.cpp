#include "updater.h"
#include <QDir>
#include <QFileInfo>


QString Updater::findSettings()
{
    qDebug()<<QDir::currentPath()<<endl;
    QString setfile = QString("%1/%2").arg(QDir::currentPath()).arg("settings.ini");
    if(!QFileInfo::exists(setfile)) return "";
    return setfile;
}

bool Updater::loadSettings(QString loc_settings)
{
    m_settings = new QSettings(loc_settings,QSettings::IniFormat);
    return true;
}

bool Updater::loadValues()
{
   Q_ASSERT(m_settings != nullptr);
   QString update_server = m_settings->value("update/update_server","").toString();
   QString password = m_settings->value("update/password","").toString();
   QString username = m_settings->value("update/username","").toString();
   QString version = m_settings->value("update/version","").toString();
   if(!update_server.isEmpty())
   {
       m_update_server = update_server;
   }
   if(!password.isEmpty())
   {
       m_password = password;
   }
   if(!username.isEmpty())
   {
       m_username = username;
   }
   if(!version.isEmpty())
   {
       m_version = version;
   }
   return true;
}

QString Updater::findNextVersion()
{
   QStringList parts = m_version.split(".");
   if(parts.size() != 2) return "";
   bool ok;
   m_umajor = parts[0].toInt(&ok);
   if(!ok) return "";
   int minor = parts[1].toInt(&ok);
   if(!ok) return "";
   m_uminor = minor +1;


   return QString("%1.%2").arg(m_umajor).arg(m_uminor);
}

void Updater::updateVersionInfo()
{
    if(!m_settings->contains("update/update_server"))
    {
       m_settings->beginGroup("update");
       m_settings->setValue("update_server",m_update_server);
       m_settings->setValue("username",m_username);
       m_settings->setValue("password",m_password);
       m_settings->setValue("version",m_next_version);
       m_settings->endGroup();
    }else{
       m_settings->setValue("update/version",m_next_version);
    }

    m_settings->sync();
}

Updater::Updater(QObject *parent) : QObject(parent)
{
    m_cnt_ftp = new FTPController(this);
    QObject::connect(m_cnt_ftp,&FTPController::error,this,&Updater::errorHandler);
    QObject::connect(m_cnt_ftp,&FTPController::closed,this,&Updater::finised);
    QObject::connect(m_cnt_ftp,&FTPController::noupdate,this,&Updater::updateNotFound);
    QObject::connect(m_cnt_ftp,&FTPController::newupdate,this,&Updater::update);
}

bool Updater::init(QString loc_settings)
{
    if(loc_settings.isEmpty())
    {
        QString loc = findSettings();
        if(loc.isEmpty()) return false;
        if(!loadSettings(loc)) return false;
    }else{
        if(!loadSettings(loc_settings)) return false;
    }

    return loadValues();
}

bool Updater::checkUpdate()
{
    m_next_version = findNextVersion();
    m_cnt_ftp->setUserName(m_username);
    m_cnt_ftp->setPassword(m_password);
    m_cnt_ftp->setUrl(m_update_server);

    m_cnt_ftp->checkVersion(m_next_version);


    return true;
}

bool Updater::stopService()
{
    QProcess stop;
    QStringList args;
    args<<"service"<<"dizaynvip"<<"stop";
    qDebug()<<"ending v3";
    stop.start("sudo",args);
    stop.waitForFinished(3000);
    stop.kill();
    return true;
}

bool Updater::startService()
{
    QProcess start;
    QStringList args;
    args<<"service"<<"dizaynvip"<<"start";
    qDebug()<<"starting v3";
    start.start("sudo",args);
    start.waitForFinished(3000);
    start.kill();
    return true;
}

bool Updater::moveFiles()
{
    QProcess mv;
    QStringList args;
    QDir dir(m_updatepath);
    QDir dest_dir;
    dir.setFilter(QDir::Files | QDir::Hidden | QDir::NoSymLinks | QDir::Dirs);
    dest_dir.setFilter(QDir::Files | QDir::Hidden | QDir::NoSymLinks | QDir::Dirs);
    QFileInfoList dest_info = dest_dir.entryInfoList();
    QFileInfoList update_info = dir.entryInfoList();
    for(int i= 0; i<update_info.size();i++)
    {
       QFileInfo fileInfo = update_info.at(i);

       if(fileInfo.isFile() && fileInfo.fileName().compare("AutoUpdater") != 0)
       {
           moveFile(fileInfo.fileName());
       }
    }

    return true;

}

bool Updater::uncompress()
{

    try{
        QProcess mv;
        QStringList args;
        QString cf = QString("%3/update_%1_%2.zip").arg(m_umajor).arg(m_uminor).arg(m_updatepath);

        if(QFileInfo::exists(cf))
        {
            args<<"unzip"<<cf<<"-d"<<m_updatepath;
            //args<<cf;
            mv.start("sudo",args);
            //@todo : extract işlemi devam ederken sonlandırma işlemi yapılamıyor
            mv.waitForFinished(50000);
            mv.kill();
            return true;
        }else{
            return false;
        }
    }catch(...)
    {
        return false;
    }
}

bool Updater::chown()
{
       QProcess p_chown;
       QStringList args;

        args<<"chown"<<"-R"<<"linaro"<<"*";
        qDebug()<<"chown v3";
        p_chown.start("sudo",args);
        p_chown.waitForFinished(10000);
        args.clear();

        args<<"chgrp"<<"-R"<<"linaro"<<"*";
        qDebug()<<"chgrp v3";
        p_chown.start("sudo",args);
        p_chown.waitForFinished(10000);
        return true;
}

bool Updater::moveFile(QString p_filename)
{

    QProcess mv;
    QStringList args;
    QDir dir(m_updatepath);
    QString program_path = QString("%1/%2") .arg(m_updatepath).arg(p_filename);
    QString dest_path = QString("%1/%2") .arg(m_targetpath).arg(p_filename);

    if(QFileInfo::exists(dest_path))
    {
        args<<"rm"<<"-f"<<p_filename;
        qDebug()<<"rm v3";
        mv.start("sudo",args);
        mv.waitForFinished(1000);
        args.clear();
    }
        args<<"mv"<<program_path<<".";
        qDebug()<<"mv v3";
        mv.start("sudo",args);
        mv.waitForFinished(1000);
        args.clear();

        if(!p_filename.contains('.'))
        {
            args<<"chmod"<<"+x"<<p_filename;
            qDebug()<<"chmod v3";
            mv.start("sudo",args);
            mv.waitForFinished(1000);
            args.clear();
        }

        args<<"chown"<<"linaro"<<p_filename;
        qDebug()<<"chown v3";
        mv.start("sudo",args);
        mv.waitForFinished(1000);
        args.clear();

        args<<"chgrp"<<"linaro"<<p_filename;
        qDebug()<<"chgrp v3";
        mv.start("sudo",args);
        mv.waitForFinished(1000);

        return true;
}

void Updater::update()
{
    m_updatedir = QString("update_%1_%2").arg(m_umajor).arg(m_uminor);
    m_updatepath = QString("%1/%2").arg(QDir::currentPath()).arg(m_updatedir);
    m_program_path = QString("%1/autovip_ls") .arg(m_updatepath);
    m_targetpath = QDir::currentPath();
    QDir dir(m_updatepath);
    QString before =QString("%1/before").arg(m_updatepath);
    QString after =QString("%1/after").arg(m_updatepath);
    uncompress();
    stopService();
    if(QFileInfo::exists(before))
    {
        QProcess pro;
        pro.start(before);
        pro.waitForFinished(13000);
    }
    moveFiles();
    chown();
    startService();
    if(QFileInfo::exists(after))
    {
        QProcess pro;
        pro.start(after);
        pro.waitForFinished(13000);
    }
    dir.removeRecursively();
    updateVersionInfo();
}

void Updater::updateNotFound()
{
   qDebug()<<"update not found"<<endl ;
   emit finised();
}


void Updater::errorHandler(QString err)
{
    qDebug()<<"error : "<<err<<endl;
    emit finised();
}


