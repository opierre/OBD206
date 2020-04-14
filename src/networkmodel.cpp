#include "networkmodel.h"

#include <QDebug>

NetworkModel::NetworkModel(QObject *parent) :
    QAbstractListModel(parent)
{
}

void NetworkModel::addNetworks(const QStringList &net)
{
    for(int i =0; i < net.size(); i++)
    {
        beginInsertRows(QModelIndex(), rowCount(), rowCount());
        m_model << net.at(i);
        endInsertRows();
    }
}

void NetworkModel::clearNetworks()
{
    beginResetModel();
    m_model.clear();
    endResetModel();
}

int NetworkModel::rowCount(const QModelIndex & parent ) const
{
    Q_UNUSED(parent);
    return m_model.count();
}

QHash<int, QByteArray> NetworkModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    return roles;
}

QVariant NetworkModel::data(const QModelIndex &index, int role) const {
    if(!index.isValid()) {
        return QVariant();
    }
    if(role == NameRole) {
        return QVariant(m_model[index.row()]);
    }
    return QVariant();
}
