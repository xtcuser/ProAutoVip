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
    connect(m_rpro, QOverload<int, QProcess::ExitStatus>::of(&QProcess::finished),this,&UpdateCheck::updateFinished);
    return true;
}

UpdateCheck::UpdateCheck(QObject *parent) : QObject(parent)
{
    m_timer.setInterval(m_timeout);
    QObject::connect(&m_timer,&QTimer::timeout,this,&UpdateCheck::run);
    m_timer.start();

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
            m_rpro->execute("sudo ./AutoUpdater2");
            m_rpro->waitForFinished(10000);
        }else
        {
            test_timer.setInterval(7000);
            test_timer.setSingleShot(true);
            QObject::connect(&test_timer,&QTimer::timeout,this,&UpdateCheck::testFunction);
            test_timer.start();
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
    m_rpro->waitForFinished(1000);
    qDebug()<<("makeUpdate() runned");
}

void UpdateCheck::testFunction()
{
    emit doUpdateOverlay();
}
