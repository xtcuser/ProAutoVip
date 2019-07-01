#ifndef AUTOUPLOADER_H
#define AUTOUPLOADER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QFileSystemWatcher>
#include <QFile>
#include <QDebug>
#include <QFtp/qftp.h>


class AutoUploader : public QObject
{
    Q_OBJECT
    QNetworkAccessManager *mang;
    QNetworkRequest *req = nullptr;
    QNetworkReply *rep = nullptr;
    QUrl url;
    QString password;
    QString username;
    int port=21;
    QString filename;
    QFile *upFile = nullptr;
    QFtp ftpcon;
    QMap<QString,int> commandIdList;
    QTime start;
public:
    explicit AutoUploader(QObject *parent = nullptr);
    void setUserName(QString p_username);
    void setPassword(QString p_password);
    void setPort(int p_port);
    void setFileName(QString p_filename);
    void setUrl(QUrl p_url);
    void upload(QString p_filename);

signals:

public slots:
    void uploadDone();
    void error( QNetworkReply::NetworkError code);
    void stateChanged(int p_st);
    void readyRead();
    void dataTransferProgress(qint64 p1,qint64 p2);
    void rawCommandReply(int, const QString&);
    void commandStarted(int p);
    void commandFinished(int p,bool r);
    void listInfo(const QUrlInfo&);
    void done(bool bstate);
};

#endif // AUTOUPLOADER_H
