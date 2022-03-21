
import 'package:basic_bank_app/Layout/bank_layout.dart';
import 'package:basic_bank_app/Modules/transferUser.dart';
import 'package:basic_bank_app/Shared/Components/components.dart';
import 'package:basic_bank_app/Shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {

  var moneyController= TextEditingController();
  var scaffoldKey=GlobalKey<ScaffoldState>();
  var formKey=GlobalKey<FormState>();


  int i;
  UserProfileScreen(@required this.i);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        key:scaffoldKey,
        appBar: AppBar(
            actions: [
            IconButton(onPressed: (){
      navigateTo(context, BankLayout());
      },
        icon:  Icon(Icons.home_outlined),
      )
  ] ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Icon(
                  Icons.person,
                size: 200,
              ),
              SizedBox(height: 25),
              Row(
                children: [
                Text(
                'Name :',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 25
                ),
              ),
                  Spacer(),
                  Text(
                    users[i]['name'],
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20
                    ),
                  ),

                ],
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  Text(
                    'Account no:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 25
                    ),
                  ),
                  Spacer(),
                  Text(
                    'xxxxxxxxx${users[i]['id']}',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20
                    ),
                  ),

                ],
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  Text(
                    'Mobile no :',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 25
                    ),
                  ),
                  Spacer(),
                  Text(
                    users[i]['phone'],
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20
                    ),
                  ),

                ],
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  Text(
                    'Current Balance :',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 25
                    ),
                  ),
                  Spacer(),
                  Text(
                    users[i]['Rs'].toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20
                    ),
                  ),

                ],
              ),
              SizedBox(height: 30),
              defaultButton(
                text: 'Transfer Money',
                function: (){
                  scaffoldKey.currentState.showBottomSheet((context) =>
                      Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Enter Amount',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),

                      ),
                      SizedBox(height: 15,),
                      defaultFormField(
                          controller: moneyController,
                          type: TextInputType.number,
                          validate: (String value){
                            if(value.isEmpty)
                              {
                                return "You can't transfer null";
                              }
                          },
                          prefix: Icons.monetization_on_outlined,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: (){
                                if(formKey.currentState.validate())
                                  {
                                    //print(moneyController.text);
                                    //print(users[i]['Rs']);
                                    //print(users[i]['name']);
                                    if(users[i]['Rs']>double.parse(moneyController.text))
                                      {
                                        insertTransactionToDatabase(T_name_sender: users[i]['name'],T_Rs:double.parse(moneyController.text) );
                                        //print(users[i]['Rs']-double.parse(moneyController.text));
                                        updateData(name:users[i]['name'], rs: users[i]['Rs']-double.parse(moneyController.text));
                                       navigateTo(context, transfer_user_screen(double.parse(moneyController.text)));
                                        showToast(text: 'Select User You want transfer to',state: ToastStates.SUCCESS );
                                      }
                                    else{
                                      showToast(text: 'THERE IS NO ENOUGH MONEY!',state: ToastStates.ERROR);
                                    }

                                  }
                              }
                              , child: Text(
                            'SEND',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            ),
                          )),
                          TextButton(
                              onPressed: (){
                                Navigator.pop(context);
                              }
                              , child: Text(
                            'CANCEL',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            ),
                          )),
                        ],
                      )

                    ],
                  )
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
