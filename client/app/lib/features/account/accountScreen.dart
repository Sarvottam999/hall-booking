import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:oyo/comman/textField_border.dart';
import 'package:oyo/constant/constant.dart';
import 'package:oyo/features/auth/model/userModel.dart';
import 'package:oyo/features/auth/service/auth_service.dart';
import 'package:oyo/providers/user_provider.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {


  User? user;

  
  // get provider

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
user =  Provider.of<UserProvider>(context, listen: false).user;


 
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Text(
              'Profile',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            
            ),
          
            //name
            Text(
              'Name',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 20,
            
            ),
           CustomTextField( 
            controller: TextEditingController(text: "${user!.name}"),
            hintText: "Name",
            hasPrefixIcon: false,
              hasSuffixIcon: false,),

              SizedBox(
              height: 20,
            
            ),
            // number
            Text(
              'Number',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            
           CustomTextField( 
            controller: TextEditingController(text: "9503444265"),
            hintText: "Name",
            hasPrefixIcon: false,
              hasSuffixIcon: false,),

              SizedBox(
              height: 20,
            
            ),
      
            // email
            Text(
              'Email',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
              CustomTextField( 
            controller: TextEditingController(text: "${user!.email}"),
            hintText: "Email",
            hasPrefixIcon: false,
              hasSuffixIcon: false,),

               // Address
            Text(
              'Address',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
              CustomTextField( 
            controller: TextEditingController(text: "${user!.address}"),
            hintText: "Address",
            hasPrefixIcon: false,
              hasSuffixIcon: false,),


              





              // button for logout
              SizedBox(
              height: 20,

            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: pink,
                ),
                onPressed: () {},
                child: Text('Logout'),
              ),
            ),
          
          ],
          
        ),
      ),
    );
  }
}