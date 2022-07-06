import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gestion_des_membres/screens/connexion.dart';
import 'package:gestion_des_membres/services/storage_service.dart';

import '../utils/design.util.dart';
import 'dashBoard.dart';

class Parametre extends StatefulWidget {
  //const Parametre({Key? key}) : super(key: key);

  @override
  _ParametreState createState() => _ParametreState();
}

class _ParametreState extends State<Parametre> {
  var selectedMember;

  final List<String> menuList = [
    'Ajouter un membre',
    'Liste des membres',
    'Synchroniser les membres'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Container(
        color: inactiveColor,
        child: ListView(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 2)),
            DrawerHeader(
                decoration: BoxDecoration(),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                          //borderRadius: BorderRadius.all(Radius.circular(55.0)),
                          child: Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        margin: EdgeInsets.only(top: 12),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: inactiveColor,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 6.0,
                                spreadRadius: -5.0,
                                offset: Offset(0, 0),
                              )
                            ],
                          ),
                          padding: EdgeInsets.all(15),
                          height: MediaQuery.of(context).size.height * 0.12,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/png/profil.png',
                                  height: 55,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(right: 60),
                                      child: Text(
                                        'Jane Doe',
                                        style: TextStyle(
                                            color: greyColor, fontSize: 20),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 15),
                                      child: Text(
                                        'janedoe@gmail.com',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                    ],
                  ),
                )),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: DropdownButton<String>(
                        hint: Text("Membres"),
                        value: selectedMember,
                        icon: const Icon(Icons.keyboard_arrow_down_outlined),
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        underline: Container(
                          height: 2,
                          color: green,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedMember = newValue!;
                          });
                        },
                        items: menuList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: inactiveColor,
                    ),
                    //padding: EdgeInsets.all(12),
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: (MediaQuery.of(context).size.width * 0.70),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 15, left: 40),
                          child: Image.asset(
                            'assets/png/parametre.png',
                            height: 20,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Parametre()));
                          },
                          child: Container(
                            child: Text(
                              'Paramètres',
                              style: TextStyle(fontSize: 18, color: greyColor),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: inactiveColor,
                    ),
                    //padding: EdgeInsets.all(12),
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: (MediaQuery.of(context).size.width * 0.70),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 15, left: 40),
                          child: Image.asset(
                            'assets/png/dashBlack.png',
                            height: 20,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DashBoard()));
                          },
                          child: Container(
                            child: Text(
                              'Dashboard',
                              style: TextStyle(fontSize: 18, color: greyColor),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: inactiveColor,
                    ),
                    //padding: EdgeInsets.all(12),
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: (MediaQuery.of(context).size.width * 0.70),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 15, left: 40),
                          child: Image.asset(
                            'assets/png/deconnection.png',
                            height: 20,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                            onTap: () {
                              StorageService().setUserCredentials("");
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Connexion()),
                                  (route) => false);
                            },
                            child: Container(
                              child: Text(
                                'Se déconnecter',
                                style:
                                    TextStyle(fontSize: 18, color: greyColor),
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: SvgPicture.asset("assets/svg/drawer.svg"),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        elevation: 0,
        titleSpacing: 40,
        backgroundColor: primaryColor,
        title: Text("Parametres"),
      ),
      body: Container(
          child: Center(
              child: Text("Aucun parametre n'est disponible pour le moment"))),
    );
  }
}
