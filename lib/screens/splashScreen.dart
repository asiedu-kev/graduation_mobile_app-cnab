import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gestion_des_membres/screens/connexion.dart';
import 'package:gestion_des_membres/screens/homePage.dart';

import '../services/storage_service.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? hasBeenOnBoarded = StorageService().getHasBeenOnBoarded();

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    hasBeenOnBoarded! ? Connexion() : HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        //padding: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: [
                Image.asset(
                  'assets/png/logo.png',
                  height: 100,
                ),
              ],
            ),
            // CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
