
import 'package:basic_bank_app/Layout/bank_layout.dart';
import 'package:basic_bank_app/Modules/userProfile.dart';
import 'package:basic_bank_app/Shared/Components/components.dart';
import 'package:basic_bank_app/Shared/constants.dart';
import 'package:flutter/material.dart';

class users_screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.supervised_user_circle)
        , title: Text(
          'All Users'
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
                 navigateTo(context, UserProfileScreen(i));
               },
             ),
           ),


          ],
        ),
      ),
    );
  }

}

