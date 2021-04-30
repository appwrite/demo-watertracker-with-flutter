import 'package:flappwrite_water_tracker/data/model/user.dart';
import 'package:flappwrite_water_tracker/data/service/api_service.dart';
import 'package:flappwrite_water_tracker/pages/home.dart';
import 'package:flappwrite_water_tracker/pages/login.dart';
import 'package:flappwrite_water_tracker/pages/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //“There are only two kinds of programming languages out there. The ones people complain about and the ones no one uses.”
    return MaterialApp(
      title: 'FlAppwirte Water Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.blue),
          actionsIconTheme: IconThemeData(color: Colors.blue),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
      future: ApiService.instance.getUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return SplashPage();
        if (snapshot.hasData)
          return HomePage(
            user: snapshot.data!,
          );
        return LoginPage();
      },
    );
  }
}
