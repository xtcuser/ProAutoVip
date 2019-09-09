#ifndef UPDATER_H
#define UPDATER_H

#include "qftpcontroller.h"

#include <QObject>

class Updater : public QObject
{
    Q_OBJECT
    QFtpController qftpController;
    QString update_server;
    QString password;
    QString username;
    QString version;
public:
    explicit Updater(QObject *parent = nullptr);

signals:

public slots:
    void foo(){
        qDebug()<<"i think it worked";
    }
};

#endif // UPDATER_H
