import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:romi/src/services/Authentication.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:romi/src/widgets/brandSelector.dart';

class PaginaInfo extends StatefulWidget {
 static const String routeName = '/paginainfo';

  @override
  _PaginaInfoState createState() => _PaginaInfoState();
}

class _PaginaInfoState extends State<PaginaInfo> {
  final auth = FirebaseAuth.instance;
  

  @override


  void initState() { 
    super.initState();
    getCurrentUser();
    
  }

  // La variable que llega de firebase se llama currentUser
  FirebaseUser loggedInUser;
  void getCurrentUser() async{
    try{
    var user = await auth.currentUser();
    if(user != null){
          loggedInUser = user;
          print(loggedInUser);
    }
  }catch(e){
    print(e);
  }
  }



  Drawer getDrawer(BuildContext context){
    var header = DrawerHeader(child: Text(""));
    var info = AboutListTile(
      child: Text("Ajustes"),
      applicationIcon: Icon(Icons.favorite),
      applicationVersion: "v1.0.0",
      icon: Icon(Icons.info)

    );

  ListTile getItem(Icon icon, String description, String route){
    return ListTile(
      leading: icon,
      title: Text(description),
      onTap: (){
        Navigator.pushNamed(context, route);
      }


    );

  }
  
  ListView getList(){
    return ListView(
      children: <Widget>[
        header,
        getItem(Icon(Icons.settings),'Inicio','/shopscreen'),
        getItem(Icon(Icons.home),'Galeria','/galeria1'),
        getItem(Icon(Icons.battery_charging_full),'Proyectos', '/plantscreen'),
    
        info
      ],
    );
    }
    return Drawer( child: getList());
  }

  
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: 1125,
      height: 2436,
      allowFontScaling:  true


    )..init(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Pantalla Informativa"),
          backgroundColor: Colors.grey[800],
            actions: <Widget>[
         IconButton(
           icon: Icon(Icons.power_settings_new),
           onPressed: (){
             Authentication().singOut();
             Navigator.pop(context);
           },
         )
         
       ],
      ),
      drawer: getDrawer(context),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(40),
                left: ScreenUtil().setHeight(40),
                right: ScreenUtil().setHeight(40)

              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.alternate_email, color: Colors.black),
                    onPressed: () {},
                  )

                ],
              )

            ),
            Padding(

              padding: EdgeInsets.only(
                
                top: ScreenUtil().setHeight(60),
                left: ScreenUtil().setHeight(70),
                right: ScreenUtil().setHeight(105)

              ),
              child: Text(
                "ROMI"
                
              ),

            ),

              BrandSelector(
                brands: ["Rocas", "Minas"]
              ),
              SizedBox(
                height: ScreenUtil().setHeight(50),
              ),
           



          ],

        ),

      ),
      



    );
  }

















}