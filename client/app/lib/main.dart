import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oyo/features/auth/service/auth_service.dart';
import 'package:oyo/features/booking/provider/bookingProvider.dart';
import 'package:oyo/features/detailScreen/screen/detailScreen.dart';
import 'package:oyo/features/home/screen/home_screen.dart';
import 'package:oyo/features/detailScreen/provider/user.dart';
import 'package:oyo/features/search/screen/searchScreen.dart';
import 'package:oyo/comman/bottom_bar.dart';
import 'package:oyo/providers/user_provider.dart';


import 'package:oyo/router.dart';
import 'package:oyo/test.dart';
 import 'package:provider/provider.dart';

void main() async {
  // await checkAvailability( );

 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        
        ChangeNotifierProvider<UserJourDate>(create: (_) => UserJourDate()),
                ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),

                ChangeNotifierProvider<BookingProvider>(create: (_) => BookingProvider())

        ],
  
        child:  MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'My Flutter App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home:   SafeArea(child: m()),
          onGenerateRoute: generateRoute,
     
    
    ),
    );
  }
}


 class m extends StatefulWidget {
  const m({super.key});

  @override
  State<m> createState() => _mState();
}

class _mState extends State<m> {

  AuthService authService = AuthService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authService.getUserData(  context);

  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Provider.of<UserProvider>(context).user.name.isNotEmpty
           ? const BottomBar():  AuthScreen()
      
    );
  }
}


// AuthScreen
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("You did not have signed in, so prroced to sign in"),
    );
  }
}
