#ifndef UPDATER_H
#define UPDATER_H

#include "qftpcontroller.h"

#include <QFile>
#include <QObject>
#include <QProcess>
#include <QTimer>

class Updater : public QObject
{
    Q_OBJECT
    QFtpController qftpController;
    QString update_server;
    QString password;
    QString username;
    int minor_version;
    int major_version;
    QFile *downloadFile;
    QString downloadFileName= "";
    QString current_action_name = "";
    bool TEST_MODE = false;                  // is intended to be used during debugging only
    QProcess *unzipProcess;
    QTimer *listingDoneTimer;

public:
    QCoreApplication* app;
    explicit Updater(QObject *parent = nullptr);

signals:
//    void signalCheckForUpdate();
//    void signalDownload();
//    void signalApplyUpdate();
//    void quitSignal();

public slots:
    void loginDone();
    void doListing(const QUrlInfo& inf);
    void download();
    void downloadDone();
    void unzipFinished(int state,QProcess::ExitStatus e_state);
};

#endif // UPDATER_H
