#ifndef NETWORKMODEL_H
#define NETWORKMODEL_H

#include <QAbstractListModel>
#include <QStringList>

class NetworkModel: public QAbstractListModel
{
    Q_OBJECT

    enum NetworkRoles {
        NameRole = Qt::UserRole + 1,
    };

public:
    explicit NetworkModel(QObject *parent = nullptr);

    Q_INVOKABLE void addNetworks(const QStringList &net);

    Q_INVOKABLE void clearNetworks();

    int rowCount(const QModelIndex & parent = QModelIndex()) const;

    QHash<int, QByteArray> roleNames() const;

    QVariant data(const QModelIndex &index, int role=Qt::DisplayRole) const;

private:
    QStringList m_model;
};

#endif // NETWORKMODEL_H
