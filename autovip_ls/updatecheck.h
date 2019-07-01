#ifndef UPDATECHECK_H
#define UPDATECHECK_H

#include <QObject>
#include <QProcess>
#include <QDir>
#include <QDebug>
#include <QTimer>

class UpdateCheck : public QObject
{
    Q_OBJECT
    int m_timeout = 5000;
    QProcess *m_rpro = nullptr;
    QTimer m_timer;
    QString m_programPath = QString("%1/AutoUpdater").arg(QDir::currentPath());
private:
    bool checkExecutable();
    bool createProcess();
public:
    explicit UpdateCheck(QObject *parent = nullptr);
    int getTimeout();
    void run();

signals:

public slots:
    void updateFinished(int state, QProcess::ExitStatus e_state);
};

#endif // UPDATECHECK_H
