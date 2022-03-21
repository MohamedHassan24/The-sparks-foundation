
import 'package:basic_bank_app/Layout/bank_layout.dart';
import 'package:basic_bank_app/Shared/Components/components.dart';
import 'package:basic_bank_app/Shared/constants.dart';
import 'package:flutter/material.dart';

class transfer_user_screen extends StatelessWidget {

  double money;
  transfer_user_screen(@required this.money);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text(
          'Make sure you select the right person',
           style: TextStyle(
             fontSize: 16,
             fontWeight: FontWeight.bold
           ),
      ),
        actions: [
          IconButton(onPressed: (){
            navigateTo(context, BankLayout());
          },
            icon:  Icon(Icons.home_outlined),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView(
          children:
          [
            for(int i=0;i<10;i++)
              Card(
                color: Colors.blueGrey,
                child: ListTile(
                  title: Text(
                    users[i]['name'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  trailing: Text(
                    'Rs: ${users[i]['Rs'].toString()}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  onTap: () {
                    insertTransactionToDatabase( T_name_receiver: users[i]['name']);
                    updateData(name:users[i]['name'], rs: users[i]['Rs']+this.money);
                    //print(users[i]['Rs']+this.money);
                   // print(users[i]['name']);

                    navigateAndFinish(context, BankLayout());
                    showToast(text: 'transfer Successfully',state: ToastStates.SUCCESS);
                  },
                ),
              ),


          ],
        ),
      ),
    );
  }

}