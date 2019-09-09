#include "updater.h"

#include <QDir>
#include <QFileInfo>
#include <QSettings>
#include <QTimer>

Updater::Updater(QObject *parent) : QObject(parent)
{
    QString setfileLocation = QString("%1/%2").arg(QDir::currentPath()).arg("settings.ini");
    assert(QFileInfo::exists(setfileLocation));
    QSettings *setting_ini = new QSettings(setfileLocation,QSettings::IniFormat);
    update_server = setting_ini->value("update/update_server","").toString();
    password = setting_ini->value("update/password","").toString();
    username = setting_ini->value("update/username","").toString();
    version = setting_ini->value("update/version","").toString();

    QFile downloadFile;
    downloadFile.setFileName(QString("%1/downloadFile").arg(QDir::currentPath()));
    if(!downloadFile.open(QIODevice::ReadWrite))
    {
      qDebug() << "empty file file couldnt be opened";
      return;
    }
    qftpController.connectToHost(update_server);
    qftpController.login(username,password);
    qftpController.list();
    qftpController.get("update_1_2.zip",&downloadFile);

    QEventLoop loop;
    connect(this, SIGNAL(finished()), &loop, SLOT(quit()));
    loop.exec();

    qftpController.close();
    downloadFile.close();



//    qftpController.close();


    //    void QFtp::commandFinished(int id, bool error)
    //    connect(this->serial_mng, &SerialMng::acdegChanged, [this](int acdeg){
    //        this->stateObject["acdeg"] = acdeg; });
}
