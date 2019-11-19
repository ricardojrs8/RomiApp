import 'package:flutter/material.dart';
import 'package:romi/src/pages/home_page.dart';
import 'package:romi/src/pages/login_page.dart';
import 'package:romi/src/pages/registratio_page.dart';
import 'package:romi/src/pages/welcome_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: WelcomePage.routeName,

      routes: <String, WidgetBuilder> {

        
        //'welcome': ( BuildContext context ) => WelcomePage(),
        WelcomePage.routeName: (BuildContext context) => WelcomePage(),
        LoginPage.routeName:   (BuildContext context) => LoginPage(),
        RegisterPage.routeName:(BuildContext context) => RegisterPage(),
         
        'home' : ( BuildContext context ) => HomePage(),

      },
    );
  }
}