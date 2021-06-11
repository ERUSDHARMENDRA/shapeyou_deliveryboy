import 'package:delivery_boy/providers/auth_providers.dart';
import 'package:delivery_boy/screens/home_screen.dart';
import 'package:delivery_boy/screens/login_screen.dart';
import 'package:delivery_boy/screens/reset_password.dart';
import 'package:delivery_boy/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'screens/register_screen.dart';

void main()async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(MultiProvider(
    providers: [
      Provider (create: (_) => AuthProvider()),
    ],
    child: MyApp(),
  ),);


}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery Store Delivery App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      builder: EasyLoading.init(),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id :(context)=>SplashScreen(),
        LoginScreen.id :(context)=>LoginScreen(),
        HomeScreen.id :(context)=>HomeScreen(),
        ResetPassword.id :(context)=>ResetPassword(),
        RegisterScreen.id :(context)=>RegisterScreen(),
      },
    );
  }
}



