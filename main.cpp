#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <QQuickView>
#include "./src/process.h"
#include "./src/btconnect.h"
#include "./src/wificonnect.h"
#include "./src/fileio.h"
#include "./src/networkmodel.h"
//#include <QtWebView/QtWebView>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
//    QtWebView::initialize();

    qmlRegisterType<Process>("Process", 1, 0, "Process");
    qmlRegisterType<BtConnect>("BtConnect", 1, 0, "BtConnect");
    qmlRegisterType<WifiConnect>("WifiConnect", 1, 0, "WifiConnect");
    qmlRegisterType<FileIO>("FileIO", 1, 0, "FileIO");
    qmlRegisterType<NetworkModel>("NetworkModel", 1, 0, "NetworkModel");

    QQmlApplicationEngine engine;

    NetworkModel model;

    QQmlContext *ctxt = engine.rootContext();
    ctxt->setContextProperty("myModel", &model);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
