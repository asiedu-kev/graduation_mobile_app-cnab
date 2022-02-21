import 'package:flutter/material.dart';
import '../utils/design.util.dart';
import 'connexion.dart';
import '../components/QuoteButtonComponent.dart';
import 'dashBoard.dart';

class Inscription extends StatefulWidget {
  //const Inscription({Key? key}) : super(key: key);

  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
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
            Column(
              children: [
                Image.asset('assets/png/logo.png', height: 75,),
                SizedBox(height: 30,),
                Container(child: Text('Inscription', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),),
                SizedBox(height: 27,),
                Container(child: Text('Veuillez saisir les informations demandées pour vous inscire.', style: TextStyle(fontSize: 15), textAlign: TextAlign.center,),),
                SizedBox(height: 27,),
                Container(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Adresse mail",
                      filled: true,
                      fillColor: inactiveColor,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: inactiveColor,
                          )),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 27,),
                Container(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Mot de passe",
                      filled: true,
                      fillColor: inactiveColor,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: inactiveColor,
                          )),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 27,),
                Container(
                  child: Text('En vous inscrivant, vous acceptez les Conditions Générales d’Utilisation de Lorem Ipsum', style: TextStyle(color: Colors.black), textAlign: TextAlign.center,),
                ),
                SizedBox(height: 30,),
                Container(
                  child: Center(
                    child: bouton(
                      onClick: () async{
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoard()));
                      },
                      btnText: "M'inscrire",
                    ),
                  ),
                ),
                SizedBox(height: 70,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 70),
                      child: Text('Déjà inscrit ?'),
                    ),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Connexion()));
                        },
                        child :Container(
                          child: Text('Se connecter', style: TextStyle(color: primaryColor),),
                        )
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
