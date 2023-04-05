#ifndef GLOBAL_REGISTER_H
#define GLOBAL_REGISTER_H


#include<QObject>
class global_register: public QObject
{
    Q_OBJECT

public:
    explicit global_register(QObject *parent = nullptr);

signals:

public slots:
    void addvalues(QString userid,QString password,QString name,QString address,QString country,QString zipcode,QString email,QString sex,QString language,QString about);
    void showvalues();

};

#endif

