#ifndef FILEIO_H
#define FILEIO_H

#include <QObject>
#include <QStringListModel>

class FileIO : public QObject
{
    Q_OBJECT

public:
    Q_PROPERTY(QString source
               READ source
               WRITE setSource
               NOTIFY sourceChanged)

    Q_PROPERTY(QStringList networks
               MEMBER mNetworks)

    explicit FileIO(QObject *parent = nullptr);

    Q_INVOKABLE QStringList read();
    Q_INVOKABLE bool write(QString data);
    Q_INVOKABLE void clearNets();

    QString source() { return mSource; }

public slots:
    void setSource(const QString& source) { mSource = source; }

signals:
    void sourceChanged(const QString& source);
    void error(const QString& msg);

private:
    QString mSource;
    QStringList mNetworks;
};

#endif // FILEIO_H
