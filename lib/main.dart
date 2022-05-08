import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: currentLocation(),
    );
  }
}
class currentLocation extends StatefulWidget {
  const currentLocation({Key? key}) : super(key: key);




  @override
  _currentLocationState createState() => _currentLocationState();
}

class _currentLocationState extends State<currentLocation> {
  var locationMessage="";
  void getCurrentLocation() async{
    LocationPermission permission = await Geolocator.requestPermission();
    LocationPermission permission1 = await Geolocator.checkPermission();
    if(permission1==LocationPermission.denied ||permission==LocationPermission.denied ){

    }
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      locationMessage="$position";

    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on_outlined,size: 55,color: Colors.grey.shade900,),
                  SizedBox(height: 10,),
                  Text("Get Current Location ",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),),
                  SizedBox(height: 10,),
                  Text("$locationMessage",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),),
                  SizedBox(height: 15,),
                  FlatButton(
                      color: Colors.blue,
                      onPressed: (){

                    getCurrentLocation();
                  }, child: Text("get Location",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),))

                ],
              ),

      ),
    ));
  }
}


