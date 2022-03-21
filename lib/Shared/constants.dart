import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

Database database;
List<Map> users=[];

List<Map> Transfer=[];

Future<void> updateData({@required String name,@required double rs}) async {
  int count = await database.rawUpdate(
      'UPDATE User SET Rs = ? WHERE name = ?',
      ['${rs}', '${name}']);
  print('updated: $count');
}
void getDataFromDataBaseTransaction() async{
  Transfer = await database.rawQuery('SELECT * FROM Transfer');
  //print(users[0]['name']);
}
Future insertTransactionToDatabase({@required String T_name_sender,@required String T_name_receiver, @required double T_Rs}) async
{
  return await database.transaction((txn) {
    txn.rawInsert(
        'INSERT INTO Transfer(TSname , TRname ,TRs) VALUES("${T_name_sender}","${T_name_receiver}", $T_Rs)')
        .then((value) {
      print('$value inserted Successfully');
    })
        .catchError((onError) {
      print('Error when Inserting new record at Transfer${onError.toString()}');
    });
    return null;
  });
}