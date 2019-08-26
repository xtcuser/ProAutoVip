#include "nvidiaconnmanager.h"


NvidiaConnManager::NvidiaConnManager(quint16 port, SerialMng *serial_mng, QObject *parent):
    QObject(parent),
    webSocketServer(new QWebSocketServer(
                           QStringLiteral("nvidia_websocket_server"),
                           QWebSocketServer::NonSecureMode,
                           this))
{
    this->serial_mng = serial_mng;

    if (webSocketServer->listen(QHostAddress::Any, port))
    {
        QTextStream(stdout) << "Web socket server listening on port " << port << '\n';
        connect(webSocketServer,
                &QWebSocketServer::newConnection,
                this,
                &NvidiaConnManager::onNewConnection);
    }

}

void NvidiaConnManager::onNewConnection()
{
    QTextStream(stdout)  << "InspectionServer::onNewConnection";

    auto socket_ptr = webSocketServer->nextPendingConnection();
    socket_ptr->setParent(this);

    connect(socket_ptr, &QWebSocket::textMessageReceived,
            this, &NvidiaConnManager::processMessage);
    connect(socket_ptr, &QWebSocket::disconnected,
            this, &NvidiaConnManager::socketDisconnected);

    clients << socket_ptr;
}


void NvidiaConnManager::processMessage(const QString &message)
{
    qDebug()<<"msg : "<<message<<endl;
    if (message == "blue")
    {
        QColor color(Qt::blue);
        if (color != this->lastUserColor)
            lastUserColor = this->serial_mng->ceilingcolor();
        this->serial_mng->setCeilingcolor(color);
    }
    else if (message == "red")
    {
        QColor color(Qt::red);
        if (color != this->lastUserColor)
            lastUserColor = this->serial_mng->ceilingcolor();
        this->serial_mng->setCeilingcolor(color);
    }
    else if (message == "green")
    {
        QColor color(Qt::green);
        if (color != this->lastUserColor)
            lastUserColor = this->serial_mng->ceilingcolor();
        this->serial_mng->setCeilingcolor(color);
    }
    else if (message == "yellow")
    {
        QColor color(Qt::yellow);
        if (color != this->lastUserColor)
            lastUserColor = this->serial_mng->ceilingcolor();
        this->serial_mng->setCeilingcolor(color);
    }
    else if (message =="reset_color")
    {
        this->serial_mng->setCeilingcolor(lastUserColor);
    }
    qDebug() << clients.size();
}

void NvidiaConnManager::socketDisconnected()
{
    QWebSocket *client_ptr = qobject_cast<QWebSocket *>(sender());
    //QTextStream(stdout) << /*getIdentifier(pClient) <<*/ " disconnected!\n";
    if (client_ptr)
    {
        clients.removeAll(client_ptr);
        client_ptr->deleteLater();
    }

}
