#include "nvidiaconnmanager.h"
#include <QColor>

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

    this->initializeStateObject();

}

void NvidiaConnManager::initializeStateObject(){
    stateObject["CeilColor"] = serial_mng->ceilingcolor().name();
    stateObject["InsideColor"] = serial_mng->insidecolor().name();
    stateObject["SideColor"] = serial_mng->sidecolor().name();

    connect(this->serial_mng, &SerialMng::ceilingcolorChanged, [this](QColor color){
        this->stateObject["CeilColor"] = color.name();  });

    connect(this->serial_mng, &SerialMng::insidecolorChanged, [this](QColor color){
        this->stateObject["insidecolorChanged"] = color.name(); });

    connect(this->serial_mng, &SerialMng::sidecolorChanged, [this](QColor color){
        this->stateObject["sidecolor"] = color.name(); });

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
        this->serial_mng->setCeilingcolor(color);
    }
    else if (message == "red")
    {
        QColor color(Qt::red);
        this->serial_mng->setCeilingcolor(color);
    }
    else if (message == "green")
    {
        QColor color(Qt::green);
        this->serial_mng->setCeilingcolor(color);
    }
    else if (message == "yellow")
    {
        QColor color(Qt::yellow);
        this->serial_mng->setCeilingcolor(color);
    }
    qDebug() << clients.size();
    qDebug()<<(this->stateObject);
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


void NvidiaConnManager::stateJsonUpdated(QString ID, QString value)
{
    stateObject[ID] = value;
//    qDebug() <<"state json updated " + ID +" " + value;
    qDebug() <<"stateJsonObject: " << stateObject;

}
