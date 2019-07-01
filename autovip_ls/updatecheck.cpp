#include "updatecheck.h"
#include <QFileInfo>
#include <QDir>

bool UpdateCheck::checkExecutable()
{

    m_programPath = QString("%1/AutoUpdater").arg(QDir::currentPath());
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

int UpdateCheck::getTimeout()
{
    return m_timeout;
}

void UpdateCheck::run()
{
    if(!checkExecutable()) return;
    if(m_rpro == nullptr)
    {
        createProcess();
        m_rpro->startDetached(m_programPath);
    }
}

void UpdateCheck::updateFinished(int state,QProcess::ExitStatus e_state)
{
    m_rpro = nullptr;
}
