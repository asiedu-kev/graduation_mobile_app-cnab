import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gestion_des_membres/screens/dashBoard.dart';
import 'package:gestion_des_membres/services/storage_service.dart';

import '../components/QuoteButtonComponent.dart';
import '../services/storage_service.dart';
import '../utils/design.util.dart';
import 'inscription.dart';

class Connexion extends StatefulWidget {
  const Connexion({Key? key}) : super(key: key);

  @override
  _ConnexionState createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  String? credentials = StorageService().getUserCredentials();
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  List cred = [];
  bool? error = false;

  @override
  void initState() {
    super.initState();
    cred = credentials!.split('-');
  }

  login() {
    if (emailController.text.trim() == cred[0] &&
        passwordController.text.trim() == cred[1]) {
      Fluttertoast.showToast(msg: "Connexion réussie");
      setState(() {
        error = false;
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DashBoard()));
    } else {
      Fluttertoast.showToast(
          msg: "Connexion échouée", backgroundColor: Colors.red);
      setState(() {
        error = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, bottom: 20, right: 20, top: 100),
        // width: double.infinity,
        // height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset(
                    'assets/png/logo.png',
                    height: 75,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Text(
                      'Connexion',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 27,
                  ),
                  Container(
                    child: Text(
                      'Veuillez remplir les champs ci-dessous pour continuer.',
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 27,
                  ),
                  error!
                      ? Text(
                          "Informations invalides",
                          style: TextStyle(color: Colors.red),
                        )
                      : Container(),
                  Container(
                    height: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Ce champ est requis";
                        } else {
                          if (!value.contains('@')) {
                            return "Entrez un mail valide";
                          }
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          hintText: "Adresse mail",
                          filled: true,
                          fillColor: inactiveColor,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: inactiveColor,
                          )),
                          border: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: inactiveColor,
                          )),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: inactiveColor,
                          ))),
                    ),
                  ),
                  SizedBox(
                    height: 27,
                  ),
                  Container(
                    height: 50,
                    child: TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Ce champ est requis";
                        } else {
                          if (value.length < 6) {
                            return "Entrez un mot de passe de 6 caractères au moins";
                          }
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          hintText: "Mot de passe",
                          filled: true,
                          fillColor: inactiveColor,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: inactiveColor,
                          )),
                          border: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: inactiveColor,
                          )),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: inactiveColor,
                          ))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                    child: Center(
                      child: bouton(
                        onClick: () async {
                          if (_formKey.currentState!.validate()) {
                            login();
                          }
                        },
                        btnText: "Me connecter",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 30),
                        child: Text('Pas encore inscrit ?'),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Inscription()));
                          },
                          child: Container(
                            child: Text(
                              'Creer un compte',
                              style: TextStyle(color: primaryColor),
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
