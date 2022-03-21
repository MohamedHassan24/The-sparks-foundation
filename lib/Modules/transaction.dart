import 'package:basic_bank_app/Layout/bank_layout.dart';
import 'package:basic_bank_app/Shared/Components/components.dart';
import 'package:flutter/material.dart';

class transaction_screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.supervised_user_circle)
        , title: Text(
          'All Transaction'
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
            for(int i=0;i<1;i++)
              Card(
                color: Colors.grey[300],
                child: ListTile(
                  title: Row(
                    children: [
                      Text(
                        //Transfer[i]['TSname'],
                        'Hassan',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                      Icon(Icons.arrow_forward),
                      Text(
                        //Transfer[i]['TRname'],
                        'Moaz',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                    ],
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                       // '-Rs: ${Transfer[i]['TRs'].toString()}',
                        '-Rs : 500',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15

                        ),
                      ),
                      Text(
                        'Success',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                            fontSize: 16

                        ),
                      )
                    ],
                  ),
                  onTap: () {
                    //navigateTo(context, UserProfileScreen(i));
                  },
                ),
              ),


          ],
        ),
      ),
    );
  }

}

