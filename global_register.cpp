#include "global_register.h"
#include <QDebug>
#include<QtSql>
global_register::global_register(QObject *parent) : QObject(parent)
{
    // perform custom initialization steps here
}

void global_register::addvalues(QString userid,QString password,QString name,QString address,QString country,QString zipcode,QString email,QString sex,QString language,QString about)
{
    QSqlQuery query;
    query.prepare(
                "INSERT INTO register(User_id,Password,Name,Address,Country,ZIP_Code,Email,Sex,Language,About)"
                "VALUES(?,?,?,?,?,?,?,?,?,?);");
    query.addBindValue(userid);
    query.addBindValue(password);
    query.addBindValue(name);
    query.addBindValue(address);
    query.addBindValue(country);
    query.addBindValue(zipcode);
    query.addBindValue(email);
    query.addBindValue(sex);
    query.addBindValue(language);
    query.addBindValue(about);


    if (!query.exec()) {
        qCritical() << "SQL Error" << query.lastError();
    } else {
        qInfo() << "New Student details save successfully";

    }
}
void global_register::showvalues()
{

   QSqlQueryModel *modal = new QSqlQueryModel();
   QSqlQuery query;
   query.prepare("Select * from register");
   query.exec();
   modal->setQuery(query);

   if(query.exec())
   {
       qDebug()<<"Number of rows in a database is : "<<modal->rowCount();

   }
   while(query.next())
   {
       int fieldNo = query.record().indexOf("User_id");
       int fieldNo1 = query.record().indexOf("Password");
       int fieldNo2 = query.record().indexOf("Name");
       int fieldNo3 = query.record().indexOf("Address");
       int fieldNo4 = query.record().indexOf("Country");
       int fieldNo5 = query.record().indexOf("ZIP_Code");
       int fieldNo6 = query.record().indexOf("Email");
       int fieldNo7 = query.record().indexOf("Sex");
       int fieldNo8 = query.record().indexOf("Language");
       int fieldNo9 = query.record().indexOf("About");
       QString user_id = query.value(fieldNo).toString();
       QString password = query.value(fieldNo1).toString();
       QString name = query.value(fieldNo2).toString();
       QString addr = query.value(fieldNo3).toString();
       QString coun = query.value(fieldNo4).toString();
       QString Zip = query.value(fieldNo5).toString();
       QString email = query.value(fieldNo6).toString();
       QString sex = query.value(fieldNo7).toString();
       QString lang = query.value(fieldNo8).toString();
       QString about = query.value(fieldNo9).toString();
       qDebug()<<user_id<<","<<password<<","<<name<<","<<addr<<","<<coun<<","<<Zip<<","<<email<<","<<sex<<","<<lang<<","<<about;

   }

}
