#include "btconnect.h"

#include <QtCore/qmetaobject.h>

BtConnect::BtConnect(QObject *parent)
    :   QObject(parent)
{
}

BtConnect::~BtConnect()
{
    stopClient();
}

void BtConnect::startClient(const QBluetoothServiceInfo &remoteService)
{
    if (socket)
        return;

    // Connect to service
    socket = new QBluetoothSocket(QBluetoothServiceInfo::RfcommProtocol);
    qDebug() << "Create socket";
    socket->connectToService(remoteService);
    qDebug() << "ConnectToService done";

    connect(socket, &QBluetoothSocket::readyRead, this, &BtConnect::readSocket);
    connect(socket, &QBluetoothSocket::connected, this, QOverload<>::of(&BtConnect::connected));
    connect(socket, &QBluetoothSocket::disconnected, this, &BtConnect::disconnected);
    connect(socket, QOverload<QBluetoothSocket::SocketError>::of(&QBluetoothSocket::error),
            this, &BtConnect::onSocketErrorOccurred);

}

void BtConnect::stopClient()
{
    delete socket;
    socket = nullptr;
}

void BtConnect::readSocket()
{
    if (!socket)
        return;

    while (socket->canReadLine()) {
        QByteArray line = socket->readLine();
        emit messageReceived(socket->peerName(),
                             QString::fromUtf8(line.constData(), line.length()));
    }
}

void BtConnect::sendMessage(const QString &message)
{
    QByteArray text = message.toUtf8() + '\n';
    socket->write(text);
}

void BtConnect::onSocketErrorOccurred(QBluetoothSocket::SocketError error)
{
    if (error == QBluetoothSocket::NoSocketError)
        return;

    QMetaEnum metaEnum = QMetaEnum::fromType<QBluetoothSocket::SocketError>();
    QString errorString = socket->peerName() + QLatin1Char(' ')
            + metaEnum.valueToKey(error) + QLatin1String(" occurred");

    emit socketErrorOccurred(errorString);
}

void BtConnect::connected()
{
    emit connected(socket->peerName());
}
