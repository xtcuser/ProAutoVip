#ifndef NVIDIACONNMANAGER_H
#define NVIDIACONNMANAGER_H

#include <QtCore/QObject>
#include <QtCore/QList>
#include <QtWebSockets>
#include <QtCore>
#include <QObject>
#include <iostream>
#include <memory>
#include "serialmng.h"

class NvidiaConnManager;


class NvidiaConnManager: public QObject
{
    Q_OBJECT

    QWebSocketServer *webSocketServer;
    QList<QWebSocket *> clients;
    SerialMng* serial_mng;
    QJsonObject stateObject {};

private:
    void initializeStateObject();
public:
    NvidiaConnManager(quint16 port, SerialMng *serial_mng , QObject * parent = nullptr);
    //virtual ~NvidiaConnManager();

signals:
    void closed();
    void stateJsonUpdatedSignal(QString ID, QString value);
    //void sendSuggestion(QString suggestion);        //suggestion based on emotional analysis performed by AI

private slots:
    void onNewConnection();
    void processMessage(const QString &message);
    void socketDisconnected();

public slots:
    void stateJsonUpdated(QString ID, QString value);

};

#endif // NVIDIACONNMANAGER_H
