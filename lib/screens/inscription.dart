import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../components/QuoteButtonComponent.dart';
import '../services/storage_service.dart';
import '../utils/design.util.dart';
import 'connexion.dart';
import 'dashBoard.dart';

class Inscription extends StatefulWidget {
  //const Inscription({Key? key}) : super(key: key);

  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();

  void register() {
    Fluttertoast.showToast(
        msg: "Inscription Réussie",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: clearGreen,
        textColor: Colors.white,
        fontSize: 16.0);
    String? credentials = emailController.text.trim() +
        '-' +
        passwordController.text.trim() +
        '-' +
        nameController.text.trim();
    print(credentials);
    StorageService().setUserCredentials(credentials);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DashBoard()));
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
                      'Inscription',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 27,
                  ),
                  Container(
                    child: Text(
                      'Veuillez saisir les informations demandées pour vous inscire.',
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 27,
                  ),
                  Container(
                    height: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Nom et prénoms";
                        } else {
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          hintText: "Nom et prénom",
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
                      obscureText: true,
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
                    height: 27,
                  ),
                  Container(
                    child: Text(
                      'En vous inscrivant, vous acceptez les Conditions Générales d’Utilisation de Lorem Ipsum',
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Center(
                      child: bouton(
                        onClick: () async {
                          if (_formKey.currentState!.validate()) {
                            register();
                          } else {
                            Fluttertoast.showToast(
                                msg: "Des erreurs dans votre soumission");
                          }
                        },
                        btnText: "M'inscrire",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 70),
                        child: Text('Déjà inscrit ?'),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Connexion()));
                          },
                          child: Container(
                            child: Text(
                              'Se connecter',
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
