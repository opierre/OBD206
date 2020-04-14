#ifndef WIFICONNECT_H
#define WIFICONNECT_H

#include <QList>
#include <QNetworkConfiguration>
#include <QNetworkConfigurationManager>
#include <QNetworkSession>

class WifiConnect : public QObject
{
    Q_OBJECT

public:
    explicit WifiConnect(QObject *parent = nullptr);
    ~WifiConnect();

    int found;
    QNetworkConfiguration netcfg;
    QStringList WifisList;
    QList<QNetworkConfiguration> netcfgList;

    Q_INVOKABLE void findActiveWireless();
    Q_INVOKABLE bool runningWifi;
};



#endif // WIFICONNECT_H
