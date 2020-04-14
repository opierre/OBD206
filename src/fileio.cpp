#include "fileio.h"
#include <QFile>
#include <QTextStream>
#include <QString>
#include <QDebug>
#include <QQuickView>
#include <QQmlContext>

FileIO::FileIO(QObject *parent) :
    QObject(parent)
{}

QStringList FileIO::read()
{
    mNetworks.clear();
    if (mSource.isEmpty()){
        emit error("source is empty");
        return QStringList();
    }

    QFile file(mSource);
    if (file.open(QIODevice::ReadOnly)) {
        QString line;
        QTextStream t(&file);
        do {
            line = t.readLine();
            line.replace("                    ESSID:\"", "");
            line.replace("\"", "");
            if(line != "")
                mNetworks.append(line);
         } while (!line.isNull());
        file.close();
    } else {
        emit error("Unable to open the file");
        return QStringList();
    }
    return mNetworks;
}

bool FileIO::write(QString data)
{
    if (mSource.isEmpty())
        return false;

    QFile file(mSource);
    if (!file.open(QFile::WriteOnly | QFile::Truncate))
        return false;

    QTextStream out(&file);
    QString dataToWrite = data.replace(",", "");
    out << dataToWrite;

    file.close();

    return true;
}

void FileIO::clearNets()
{
    mNetworks.clear();
}
