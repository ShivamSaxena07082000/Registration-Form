#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include<QDebug>
#include <QtSql>
#include "global_register.h"
#include <QQmlContext>
#include <QCoreApplication>
#include<QJSEngine>
#include "tablemodel.h"
#include "tablemodel.cpp"
int main(int argc, char *argv[])
{
    TableModel obj;
    //Create Database
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("Registration_form");
    db.setUserName("admin");
    db.setPassword("pass@123");
    db.open();
    if (!db.open())
        qDebug()<<db.lastError();
    // additional config
    db.exec("PRAGMA synchronous = OFF");
    db.exec("PRAGMA journal_mode = MEMORY");
    db.exec("PRAGMA foreign_keys=ON");

    //Create Table
    QSqlQuery query;
    bool res = query.exec(
                "CREATE TABLE IF NOT EXISTS register"

                "(User_id varchar(30) primary key,"
                "Password varchar(30) NOT NULL,"
                "Name varchar(30) NOT NULL,"
                "Address varchar(30)NOT NULL,"
                "Country varchar(30)NOT NULL,"
                "ZIP_Code varchar(30) NOT NULL,"
                "Email varchar(30) NOT NULL,"
                "Sex varchar(5) NOT NULL,"
                "Language varchar(5)NOT NULL,"
                "About varchar(30) NOT NULL)");

    if (res)
        qDebug() << "Registration table created successfully !!!";
    else
        qCritical() << "Failed to create Registration Table !!! Error: " << query.lastError();



    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    global_register globally;
    TableModel global;
    qmlRegisterType<TableModel>("TableModel",0,1,"TableModel");
    QQmlApplicationEngine engine;

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    QQmlContext * rootContext = engine.rootContext();
    rootContext->setContextProperty("classA",&globally);


   QQmlContext * abc =engine.rootContext();
   abc->setContextProperty("classB",&global);

    return app.exec();
}
