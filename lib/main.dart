import 'package:flutter/material.dart';
import 'package:romi/src/bloc/provider.dart';
import 'package:romi/src/pages/galeria_page.dart';
import 'package:romi/src/pages/home_page.dart';

import 'package:romi/src/pages/lisgaleria_page.dart';
import 'package:romi/src/pages/login_page.dart';
import 'package:romi/src/pages/mina.dart';
import 'package:romi/src/pages/preferencia_usuario.dart';
import 'package:romi/src/pages/principa_info_page.dart';
import 'package:romi/src/pages/registratio_page.dart';
import 'package:romi/src/pages/shop_screen.dart';
import 'package:romi/src/pages/video.dart';

import 'package:romi/src/pages/welcome_page.dart';



 
void main() async {
  

  final prefs = new PreferenciasUsuario();
    await prefs.initPrefs();

  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: WelcomePage.routeName,

      routes: <String, WidgetBuilder> {
        WelcomePage.routeName: (BuildContext context) => WelcomePage(),
        LoginPage.routeName:   (BuildContext context) => LoginPage(),
        RegisterPage.routeName:(BuildContext context) => RegisterPage(),
        PaginaInfo.routeName: (BuildContext context) => PaginaInfo(),
        GaleriaPage.routeName: (BuildContext context) => GaleriaPage(),
        ListGaleria.routeName: (BuildContext context) => ListGaleria(),
        ShopScreen.routeName : (BuildContext context) => ShopScreen(),
        MapsDemo.routeName: (BuildContext context) => MapsDemo(),
        VideoApp.routeName:(BuildContext context) => VideoApp(),
        MinaPage.routeName: (BuildContext context) => MinaPage(),
        


      },
    )
    );
  }
}