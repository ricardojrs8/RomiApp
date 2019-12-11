import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:romi/src/model/plant_model.dart';
import 'package:romi/src/pages/plant_screen.dart';


//

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:romi/src/services/Authentication.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:romi/src/widgets/brandSelector.dart';

class ShopScreen extends StatefulWidget {

  static const String routeName = '/shopscreen';

  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  int _selectedPage = 0;

  final auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
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



  _plantSelector(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 500.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PlantScreen(plant: plants[index]),
            ),
          );
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF616161),
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 30.0),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Hero(
                      tag: plants[index].imageUrl,
                      child: Image(
                        height: 280.0,
                        width: 280.0,
                        image: AssetImage(
                          'images/plant$index.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30.0,
                    right: 30.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // Text(
                        //   'FROM',
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     fontSize: 15.0,
                        //   ),
                        // ),
                        // Text(
                        //   '\$${plants[index].price}',
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     fontSize: 25.0,
                        //     fontWeight: FontWeight.w600,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 30.0,
                    bottom: 40.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          plants[index].category.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          plants[index].name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 4.0,
              child: RawMaterialButton(
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
                elevation: 2.0,
                fillColor: Colors.black,
                child: Icon(
                  Icons.call_missed_outgoing,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () => print('Add to cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }



  Drawer getDrawer(BuildContext context){
    
    var header = DrawerHeader(
      
      child: Container(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/imgf.jpg'),
            fit: BoxFit.cover
          )
        )

      );
      
      
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
      padding: EdgeInsets.zero,
      children: <Widget>[
        header,
        getItem(Icon(Icons.settings),'Inicio','/shopscreen'),
        getItem(Icon(Icons.home),'Registros','/galeria1'),
       //getItem(Icon(Icons.battery_charging_full),'Proyectos', '/video'),
    
        info
      ],
    );
    }
    return Drawer( child: getList());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
          backgroundColor: Colors.grey[700],
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
      backgroundColor: Colors.grey[300],
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        //Image(image: AssetImage('images/romi1.png')),
        
        value: SystemUiOverlayStyle.dark,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 60.0),
          
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
              ),
            ),
            //SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(left: 100.0),
              child: Text(
                'ROMI',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey[800].withOpacity(0.6),
              labelPadding: EdgeInsets.symmetric(horizontal: 35.0),
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    'Rocas',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: 
                    FlatButton(
                     child: Text("Minas",  textAlign: TextAlign.end,
                     style: TextStyle(
                       fontSize: 16, 
                       color: Colors.black,
                       
                       ),
                     ), 
                     
                     onPressed: (){
                                   Navigator.pushNamed(context, '/minas');
                     }                    
                   ,)
                ),
             
              ],
            ),
            SizedBox(height: 20.0),
            Container(
              height: 500.0,
              width: double.infinity,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    _selectedPage = index;
                  });
                },
                itemCount: plants.length,
                itemBuilder: (BuildContext context, int index) {
                  return _plantSelector(index);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    plants[_selectedPage].description,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}
