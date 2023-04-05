#include "tablemodel.h"
#include<global_register.h>
#include<QDebug>
#include<global_register.cpp>
TableModel::TableModel(QObject *parent): QAbstractTableModel(parent)
{

     table.append({"User_id","Password","Name","Address","Country","ZIP_Code","Email","Sex","Language","About"});
     table.append({"-1102550753" , "Saurab345" , "Saurab" , "Pune" , "India" , "4100929" , "saurab@gmhil.com" , "Male" , "English" , "jijif"});
     table.append({"-249630288" , "ifiriuf4" , "jkjrnf" , "kf" , "India" , "89044" , "ac@gmbil.com" , "Male" , "English" , "nkoe"});
     table.append({"-196050749" , "Ritu54565" , "Ritu" , "Pune" , "India" , "411054" , "Ritu@gmail.com" , "Female" , "Non English" , "djkdijd"});
     table.append({"308942" , "jknfnof443" , "sivhf" , "mnkfe" , "Japan" , "226020" , "jfji@gmail.com" , "Male" , "English" , "jro"});
     table.append({"340343" , "jf49443" , "jfifirfr" , "jirrifrrff" , "India" , "98743403" , "ri@gmhil.com" , "Male" , "Non English" , "jhhifhr"});
     table.append({"374903" , "jdiue34" , "jfifr" , "euvie" , "Europe" , "209340" , "iu@gmhil.com" , "Male" , "English" , "dee"});
     table.append({"379402" , "jfiriuf33" , "jufjur" , "urfirf" , "Nigeria" , "879483" , "fi@gmhil.com" , "Male" , "English" , "dufrrrr"});
     table.append({"399033" , "kjkjkk34" , "jkjjfj" , "skjklk" , "Russia" , "297802" , "sju@gmail.com" , "Male" , "English" , "re"});
     table.append({"432156" , "sivhm32145" , "Ayus" , "Lucknow" , "India" , "226020" , "sivhmsiveam256@gmsil.com" , "Male" , "English" , "abcd"});
     table.append({"654589" , "isDi43567" , "isDi" , "Jankipuram,Lucknow" , "India" , "226020" , "isdi@gmsil.com" , "Female" , "English" , "hdj"});
     table.append({"873024" , "jjie42" , "jke" , "iuou" , "Europe" , "9734094" , "sjiuf@gmhil.com" , "Male" , "English" , "rer4"});
     table.append({"894034" , "kjfkjf34" , "kjsff" , "fkjf" , "Russia" , "394343" , "jd@gmjil.com" , "Male" , "English" , "ee"});
     table.append({"934033" , "saxena83794" , "sivhm" , "Lucknow" , "India" , "226020" , "sivhmsiveam256@gmsil.com" , "Male" , "English" , "jhie"});
     table.append({"2314567" , "sivhm3214" , "sivhm" , "pune" , "" , "411057" , "sivhmsiveam256@gmsil.com" , "Male" , "English" , "HEy"});
     table.append({"3241567" , "sivhm3214" , "ayus" , "538Ka/192-1st Triveni Nagar Lucknow" , "" , "226020" , "ayusshseax356@gmeil.com" , "Male" , "English" , "I am Ayush"});
     table.append({"3487982" , "jkjfkkfj34" , "kjfkjlk" , "fkjkjf" , "Russia" , "3398398" , "fkfkj@gmail.com" , "Male" , "English" , "kjjkd"});
     table.append({"3489332" , "kjdiueier3" , "skfk" , "kdfie" , "Australia" , "3800403" , "je@gmdil.com" , "Male" , "English" , "djjf"});
     table.append({"3784034" , "kjsdo34" , "sjij" , "jok" , "Russia" , "226020" , "k@gmdil.com" , "Male" , "English" , "dde"});

}
void TableModel::addtablevalues(QString userid,QString password,QString name,QString address,QString country,QString zipcode,QString email,QString sex,QString language,QString about)
{
         table.append({userid,password,name,address,country,zipcode,email,sex,language,about});
         qDebug()<<userid;
         qDebug()<<password;
         qDebug()<<name;
         qDebug()<<address;
         qDebug()<<country;
         qDebug()<<zipcode;
         qDebug()<<email;
         qDebug()<<sex;
         qDebug()<<language;
         qDebug()<<about;


         qDebug()<<table.length();
         qDebug()<<table.size();
         qDebug()<<table.at(0).size();
}


int TableModel::rowCount(const QModelIndex &) const
{
    return table.size();

}
int TableModel::columnCount(const QModelIndex &) const
{
   return table.at(0).size();
}

QVariant TableModel::data(const QModelIndex &index, int role) const
{
    switch (role) {
    case TableDataRole:
    {
        return table.at(index.row()).at(index.column());

    }
    case HeadingRole:
    {
        if(index.row()==0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    default:
        break;
    }

    return QVariant();
}

QHash<int, QByteArray> TableModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[TableDataRole] ="tabledata";
    roles[HeadingRole] = "heading";
    return roles;
}



