
import 'package:basic_bank_app/Modules/transaction.dart';
import 'package:basic_bank_app/Modules/users.dart';
import 'package:basic_bank_app/Shared/Components/components.dart';
import 'package:basic_bank_app/Shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class BankLayout extends StatefulWidget {

  @override
  State<BankLayout> createState() => _BankLayoutState();
}

class _BankLayoutState extends State<BankLayout> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createDataBase();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'Banking System App',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.blue
                  ),
                ),
                SizedBox(height: 20,),
                Image(
                    image: AssetImage('assets/images/bank.jpg')
                ),
                SizedBox(height: 20,),
                defaultButton(
                  function: (){
                    navigateTo(context,
                        users_screen()
                    );
                    getDataFromDataBase();
                  },
                  text: 'all Users',
                  isUpperCase: true,
                  radius: 3,
                  width: double.infinity,
                  background: Colors.blue
                ),
                SizedBox(height: 20,),
                defaultButton(
                    function: (){
                      navigateTo(context,
                          transaction_screen()

                      );
                    //  print(Transfer[0]['TRname']);
                    },
                    text: 'all transaction',
                    isUpperCase: true,
                    radius: 3,
                    width: double.infinity,
                    background: Colors.blue
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

 Future<void> createDataBase() async
 {
   database = await openDatabase('bank.db', version: 1,
       onCreate: (Database database, int version) async {
         // When creating the db, create the table
         print('data base created');
         await database.execute(
             'CREATE TABLE User (id INTEGER PRIMARY KEY, name TEXT, phone TEXT, Rs REAL)'
         ).then((value){
           print('table user created');
         }).catchError((Error){
           print('Error when table user created ${Error.toString()}');
         });
         await database.execute(
             'CREATE TABLE Transfer (Tid INTEGER PRIMARY KEY, TSname TEXT, TRname TEXT, TRs REAL)'
         ).then((value){
           print('table transaction created');
         }).catchError((Error){
           print('Error when table transaction created ${Error.toString()}');
         });
       },
       onOpen: (database) {
           print('data base opened');},
       );
 }

 void insertToDatabase() async {
    await database.transaction((txn) async{
      int id1 = await txn.rawInsert(
          'INSERT INTO User(name, phone, Rs) VALUES("Hassan", "0102079228", 5000)');
      print('inserted1: $id1');
      int id2 = await txn.rawInsert(
          'INSERT INTO User(name, phone, Rs) VALUES("Nourhan", "0102079228", 9000)');
      print('inserted2: $id2');
      int id3 = await txn.rawInsert(
          'INSERT INTO User(name, phone, Rs) VALUES("Moaz", "01092930059", 4000)');
      print('inserted3: $id3');
      int id4 = await txn.rawInsert(
          'INSERT INTO User(name, phone, Rs) VALUES("Mansour", "0102669228", 7000)');
      print('inserted4: $id4');
      int id5 = await txn.rawInsert(
          'INSERT INTO User(name, phone, Rs) VALUES("nour", "01092888559", 4000)');
      print('inserted5: $id5');
      int id6 = await txn.rawInsert(
          'INSERT INTO User(name, phone, Rs) VALUES(" Mahrous", "0112559228", 7000)');
      print('inserted6: $id6');
      int id7 = await txn.rawInsert(
          'INSERT INTO User(name, phone, Rs) VALUES(" yassmin", "01444293059", 3000)');
      print('inserted7: $id7');
      int id8 = await txn.rawInsert(
          'INSERT INTO User(name, phone, Rs) VALUES("Ali ", "0102779228", 8000)');
      print('inserted8: $id8');
      int id9 = await txn.rawInsert(
          'INSERT INTO User(name, phone, Rs) VALUES("Mohamed", "01044430059", 4000)');
      print('inserted9: $id9');
      int id10 = await txn.rawInsert(
          'INSERT INTO User(name, phone, Rs) VALUES("Shehab ", "01148622228", 7000)');
      print('inserted10: $id10');
    }
    );
 }

 void getDataFromDataBase() async{
    users = await database.rawQuery('SELECT * FROM User');
    //print(users[0]['name']);
 }



}