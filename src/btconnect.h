#ifndef BTCONNECT_H
#define BTCONNECT_H

#include <QtCore/qobject.h>

#include <QtBluetooth/qbluetoothserviceinfo.h>
#include <QtBluetooth/qbluetoothsocket.h>

QT_FORWARD_DECLARE_CLASS(QBluetoothSocket)

QT_USE_NAMESPACE

class BtConnect : public QObject
{
    Q_OBJECT

public:
    explicit BtConnect(QObject *parent = nullptr);
    ~BtConnect();

    Q_INVOKABLE void startClient(const QBluetoothServiceInfo &remoteService);
    Q_INVOKABLE void stopClient();

public slots:
    Q_INVOKABLE void sendMessage(const QString &message);

signals:
    Q_INVOKABLE void messageReceived(const QString &sender, const QString &message);
    Q_INVOKABLE void connected(const QString &name);
    Q_INVOKABLE void disconnected();
    Q_INVOKABLE void socketErrorOccurred(const QString &errorString);

private slots:
    Q_INVOKABLE void readSocket();
    Q_INVOKABLE void connected();
    Q_INVOKABLE void onSocketErrorOccurred(QBluetoothSocket::SocketError);

private:
    QBluetoothSocket *socket = nullptr;
};

#endif // BTCONNECT_H
