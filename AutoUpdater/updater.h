#ifndef UPDATER_H
#define UPDATER_H

#include <QObject>
#include <QSettings>
#include <QDir>
#include <ftpcontroller.h>
#include <QProcess>

class Updater : public QObject
{
    Q_OBJECT
    QString findSettings();
    QSettings *m_settings = nullptr;
    bool loadSettings(QString loc_settings);
    bool loadValues();
    QString m_version = "1.0"; //current version
    QString m_next_version;
    //QString m_proto_loc = QString("%1/proto.ini").arg(QDir::currentPath());
    QString m_update_server = "server.com"; //
    QString m_username = "username"; //
    QString m_password = "password"; //
    QString m_updatedir;
    QString m_targetpath;
    QString m_updatepath;
    QString m_program_path;
    int m_umajor = 0; //update major
    int m_uminor = 0; //update minor
    FTPController *m_cnt_ftp = nullptr;
private:
    QString findNextVersion();
    void updateVersionInfo();
public:
    explicit Updater(QObject *parent = nullptr);
    bool init(QString loc_settings="");
    bool checkUpdate();
    bool stopService();
    bool startService();
    bool moveFiles();
    bool uncompress();
    bool chown();
    bool moveFile(QString p_filename);

signals:
    void finised();

public slots:
    /*
    void parseInfoFile();
    */
    void updateNotFound();
    void update();
    void errorHandler(QString err);
};

#endif // UPDATER_H
