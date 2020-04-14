#include "process.h"

Process::Process(QObject *parent) :
    QProcess(parent)
{
}

void Process::start(const QString &program, const QVariantList &arguments)
{
    QStringList args;
    QProcess exec;

    for (int i = 0; i < arguments.length(); i++)
        args << arguments[i].toString();

    exec.startDetached(program, args);
    exec.waitForFinished(-1);
    exec.terminate();

}

QByteArray Process::readAll() {
    return QProcess::readAll();
}
