#include <QCoreApplication>
#include <QtDebug>
#include <autouploader.h>
#include <updater.h>
#include <stdlib.h>
#include <functional>
#include <QDir>

bool changeCD()
{
    QString realpath = "/home/linaro/autovip";
    if(QFileInfo::exists("/home/linaro/autovip")){
       return QDir::setCurrent(realpath);
    }
    return false;
}

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
    if(changeCD())
    {
        qDebug()<<"Current Dir :"<<"/home/linaro/autovip"<<endl;
    }

    Updater updater;
    if(!updater.init())
    {
        exit(EXIT_FAILURE);
    }

    QMetaObject::invokeMethod(&updater,&Updater::checkUpdate);
    QObject::connect(&updater,&Updater::finised,[=](){
      QCoreApplication::quit();
    });

    return a.exec();
}
