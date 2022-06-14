import 'package:cnab/screens/splashScreen.dart';
import 'package:cnab/translations.dart';
import 'package:cnab/utils/design.util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor: Colors.white
    // ));
    return MaterialApp(
      title: 'Cnab',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: primaryColor, textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
      localizationsDelegates: [
        const TranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [const Locale('en', ''), const Locale('fr', '')],
      home: SplashScreen(),
    );
  }
}
