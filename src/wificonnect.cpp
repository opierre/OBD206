#include "wificonnect.h"

WifiConnect::WifiConnect(QObject *parent) :
    QObject(parent)
{
    found = 0;
}

WifiConnect::~WifiConnect()
{
    WifisList.clear();
    netcfgList.clear();
    runningWifi = false;
}

void WifiConnect::findActiveWireless()
{
    QNetworkConfigurationManager ncm;
    netcfgList = ncm.allConfigurations();
    ncm.updateConfigurations();
    WifisList.clear();
    for (auto &x : netcfgList)
    {
        ncm.updateConfigurations();
        qDebug() << x.bearerTypeName();
        qDebug() << x.bearerTypeFamily();
        if (x.bearerTypeFamily() == QNetworkConfiguration::BearerWLAN)
        {
            found++;
            qDebug() << found;
            if(x.name() == "")
                WifisList << "Unknown";
            else {
                WifisList << x.name();
            }

            qDebug() << "found one";
            qDebug() << WifisList[found-1];
        }
    }
}
