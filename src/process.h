#ifndef PROCESS_H
#define PROCESS_H

#include <QObject>
#include <QProcess>
#include <QVariant>

class Process : public QProcess {
    Q_OBJECT
    Q_PROPERTY(bool running MEMBER m_running NOTIFY runningChanged)

public:
    explicit Process(QObject *parent = nullptr);

    Q_INVOKABLE void start(const QString &program, const QVariantList &arguments);

    Q_INVOKABLE QByteArray readAll();

    bool m_running;

signals:
    void runningChanged();
};

#endif // PROCESS_H
