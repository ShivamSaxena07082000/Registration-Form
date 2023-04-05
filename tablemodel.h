#ifndef TABLEMODEL_H
#define TABLEMODEL_H

#include <QObject>
#include <vector>
#include<QDebug>
#include <QAbstractTableModel>
class TableModel : public QAbstractTableModel
{
    Q_OBJECT
    enum TableRoles{
        TableDataRole = Qt::UserRole + 1,
        HeadingRole

    };

public:
    explicit TableModel(QObject *parent = nullptr);
   int rowCount(const QModelIndex & = QModelIndex()) const override;

   int columnCount(const QModelIndex & = QModelIndex()) const override;

        QVariant data(const QModelIndex &index, int role) const override;

        QHash<int, QByteArray> roleNames() const override;

signals:
public slots:
     void addtablevalues(QString userid,QString password,QString name,QString address,QString country,QString zipcode,QString email,QString sex,QString language,QString about);

public:
QVector<QVector<QString>> table;


};

#endif // TABLEMODEL_H
