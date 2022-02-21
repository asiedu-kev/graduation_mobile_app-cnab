import 'package:flutter/material.dart';
import 'package:vians/screens/dashBoard.dart';
import '../components/QuoteButtonComponent.dart';
import '../utils/design.util.dart';
import 'inscription.dart';


class Connexion extends StatefulWidget {
  //const Connexion({Key? key}) : super(key: key);

  @override
  _ConnexionState createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
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
                Container(child: Text('Connexion', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),),
                SizedBox(height: 27,),
                Container(child: Text('Veuillez remplir les champs ci-dessous pour continuer.', style: TextStyle(fontSize: 15), textAlign: TextAlign.center,),),
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
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.only(left: 170),
                  child: Text('Mot de passe oublié ?', style: TextStyle(color: primaryColor), textAlign: TextAlign.right,),
                ),
                SizedBox(height: 80,),
                Container(
                  child: Center(
                    child: bouton(
                      onClick: () async{
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoard()));
                      },
                      btnText: "Me connecter",
                    ),
                  ),
                ),
                SizedBox(height: 60,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Text('Pas encore inscrit ?'),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Inscription()));
                      },
                        child :Container(
                          child: Text('Creer un compte', style: TextStyle(color: primaryColor),),
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
