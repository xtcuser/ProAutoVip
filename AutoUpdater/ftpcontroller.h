#ifndef FTPCONTROLLER_H
#define FTPCONTROLLER_H

#include <QObject>
#include <QFtp/qftp.h>
#include <QDebug>
#include <QUrl>
#include <QDir>
#include <QNetworkReply>
#include <QFile>
#include <QBuffer>
#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QTimer>
#include <QProcess>

class FTPController : public QObject
{
    Q_OBJECT
    QUrl url;
    QString password;
    QString username;
    int port=21;
    QString filename;
    QString updateDir;
    QFtp ftpcon;
    QMap<QString,int> commandIdList;
    QTime start;
    QBuffer buff;
    QFile infoFile;
    QStringList files;
    QMap<QString,QFile *> dowfiles;
    bool updateFound = false;
    QTimer timer_timeout;
private:
    void close();
    void emitError(QString error);
    QString getCommandKey(int id);
public:
    explicit FTPController(QObject *parent = nullptr);
    void checkVersion(QString version);
    void setUserName(QString p_username);
    void setPassword(QString p_password);
    void setPort(int p_port);
    void setUrl(QUrl p_url);


signals:
    void noupdate();
    void newupdate();
    void error(QString);
    void closed();

public slots:
    void stateChanged(int p_st);
    void dataTransferProgress(qint64 p1,qint64 p2);
    void rawCommandReply(int, const QString&);
    void commandStarted(int p);
    void commandFinished(int p,bool r);
    void listInfo(const QUrlInfo&);
    void timeout();
};

#endif // FTPCONTROLLER_H
