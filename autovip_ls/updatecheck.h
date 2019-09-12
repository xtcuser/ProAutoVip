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
    QString m_programPath = QString("%1/AutoUpdater2").arg(QDir::currentPath());
    QTimer overlaytimer;
private:
    bool checkExecutable();
    bool createProcess();
public:
    explicit UpdateCheck(QObject *parent = nullptr);
    Q_INVOKABLE void makeUpdate();
    void run();

signals:
    void doUpdateOverlay();

public slots:
    void updateFinished();
    void overlayFunction();
};

#endif // UPDATECHECK_H
