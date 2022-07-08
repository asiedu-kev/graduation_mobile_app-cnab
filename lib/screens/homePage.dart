import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:gestion_des_membres/screens/inscription.dart';
import 'package:gestion_des_membres/services/storage_service.dart';

import '../components/QuoteButtonComponent.dart';
import '../components/secondButton.dart';
import '../utils/design.util.dart';
import 'connexion.dart';

class HomePage extends StatefulWidget {
  //const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLock = true;

  @override
  void initState() {
    super.initState();
    StorageService().setHasBeenOnBoarded(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLock
          ? ScreenLock(
              screenLockConfig: ScreenLockConfig(
                backgroundColor: green,
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
          : Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: [
                      Image.asset(
                        'assets/png/logo.png',
                        height: 75,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        child: Text(
                          'Bonjour !',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        child: Text(
                          'Bienvenue sur l\’application qui vous permet de collecter les informations de vos membres sans connexion internet.',
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        child: Center(
                          child: bouton(
                            onClick: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Inscription()));
                            },
                            btnText: "Commencer",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 6.0,
                              spreadRadius: -6.0,
                              offset: Offset(
                                  0, 0), // shadow direction: bottom right
                            )
                          ],
                        ),
                        child: Center(
                          child: secondBouton(
                            onClick: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Connexion()));
                            },
                            btnText: "J'ai deja un compte",
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
