#include "updatecheck.h"
#include <QFileInfo>
#include <QDir>
#include <settingsmanager.h>

bool UpdateCheck::checkExecutable()
{

    m_programPath = QString("%1/AutoUpdater2").arg(QDir::currentPath());
    return QFileInfo::exists(m_programPath);
}

bool UpdateCheck::createProcess()
{
    m_rpro = new QProcess(this);
    return true;
}

UpdateCheck::UpdateCheck(QObject *parent) : QObject(parent)
{
    run();
}

void UpdateCheck::run()
{
    SettingsManager *smng = new SettingsManager;
    if(!checkExecutable()) return;
    if(m_rpro == nullptr)
    {
        createProcess();
        QString version = smng->version();
        QString lastversion = smng->lastversion();
        if(version==lastversion)
        {
            m_rpro->startDetached(m_programPath);
        }else
        {
            overlaytimer.setInterval(7000);
            overlaytimer.setSingleShot(true);
            QObject::connect(&overlaytimer,&QTimer::timeout,this,&UpdateCheck::overlayFunction);
            overlaytimer.start();
        }
    }
}

void UpdateCheck::updateFinished()
{
    m_rpro = nullptr;
}

void UpdateCheck::makeUpdate()
{
    SettingsManager *smng = new SettingsManager;
    QString version = smng->version();
    QString lastversion = smng->lastversion();
    QStringList templast = lastversion.split(".");
    int major = templast[0].toInt();
    int minor = templast[1].toInt();
    QString foldername = QString("update_%1_%2").arg(major).arg(minor);
    QString filepath = ("sudo ./"+foldername+"/update.sh");
    m_rpro->startDetached(filepath);
}

void UpdateCheck::overlayFunction()
{
    emit doUpdateOverlay();
}
