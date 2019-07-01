#include "cronjobs.h"
#include <QStringList>
#include <QDebug>

CronJobs::CronJobs(QObject *parent) : QObject(parent)
{
    this->enable_dpms = new QProcess();
    this->disable_dpms = new QProcess();
    this->timer = new QTimer();
    this->timer->setInterval(timeout);
    connect(timer,&QTimer::timeout,this,&CronJobs::run_jobs);
    this->timer->start();
}

void CronJobs::run_jobs()
{
     #ifdef LIN_ARM64
      QStringList args; 
      args<<"-dpms";
      disable_dpms->start("xset",args,QIODevice::ReadWrite);
      args.clear();
      args<<"dpms"<<"4";
      enable_dpms->start("xset",args,QIODevice::ReadWrite);
      
     #endif
}
