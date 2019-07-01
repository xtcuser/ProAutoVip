#ifndef CRONJOBS_H
#define CRONJOBS_H

#include <QObject>
#include <QProcess>
#include <QTimer>
#include <QDebug>

class CronJobs : public QObject
{
    Q_OBJECT
    QTimer * timer = nullptr;
    //int timeout = 300000;
    int timeout = 3000;
    QProcess *enable_dpms=nullptr;
    QProcess *disable_dpms=nullptr;
public:
    explicit CronJobs(QObject *parent = nullptr);

signals:

public slots:
    void run_jobs();
};

#endif // CRONJOBS_H
