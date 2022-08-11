import 'package:flutter/material.dart';
import 'package:spaceappui/screens/launch_screen.dart';
import '/screens/bottom_nav_bar.dart';
import '/screens/home_page.dart';
import '/screens/profile_screen.dart';
import '/screens/explore_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Universe',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      initialRoute: '/launch_screen',
      routes: {
        '/launch_screen':(context)=>LaunchScreen(),
        '/explore_screen': (ctx) => ExploreScreen(),
        '/profile_screen': (ctx) => ProfileScreen(),
      '/bottom_bar_screen': (ctx) => BottomBar(),
        '/home_page': (ctx) => MyHomePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
