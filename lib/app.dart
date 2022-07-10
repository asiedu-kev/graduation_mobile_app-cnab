import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:gestion_des_membres/screens/splashScreen.dart';
import 'package:gestion_des_membres/translations.dart';
import 'package:gestion_des_membres/utils/design.util.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLock = true;

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor: Colors.white
    // ));
    return MaterialApp(
      title: 'Cnab',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: primaryColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
      localizationsDelegates: [
        const TranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [const Locale('en', ''), const Locale('fr', '')],
      home: isLock
          ? ScreenLock(
              screenLockConfig: ScreenLockConfig(
                backgroundColor: primaryColor,
              ),
              secretsConfig: SecretsConfig(
                spacing: 15, // or spacingRatio
                padding: const EdgeInsets.all(40),
                secretConfig: SecretConfig(
                  borderColor: Colors.white,
                  enabledColor: Colors.white,
                  height: 15,
                  width: 15,
                ),
              ),
              correctString: '62471176',
              // didCancelled: Navigator.of(context).pop,
              digits: 8,
              title: Text(
                'Veuillez saisir le code pour continuer',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              didUnlocked: () {
                setState(() {
                  isLock = false;
                });
              },
            )
          : SplashScreen(),
    );
  }
}
