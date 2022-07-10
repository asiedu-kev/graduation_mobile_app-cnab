import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gestion_des_membres/screens/addMemberPage.dart';
import 'package:gestion_des_membres/screens/dashBoard.dart';
import 'package:gestion_des_membres/screens/membersPage.dart';
import 'package:gestion_des_membres/screens/synchronisationPage.dart';

import '../screens/connexion.dart';
import '../screens/parametre.dart';
import '../services/storage_service.dart';
import '../utils/design.util.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  String? credentials = StorageService().getUserCredentials();
  List cred = [];

  @override
  void initState() {
    super.initState();
    cred = credentials!.split('-');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                        width: MediaQuery.of(context).size.width * 0.72,
                        //borderRadius: BorderRadius.all(Radius.circular(55.0)),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.72,
                          margin: EdgeInsets.only(top: 10),
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
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          '${cred[2]}',
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: greyColor, fontSize: 20),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          '${cred[0]}',
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 13),
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
                    child: PopupMenuButton(
                        child: Container(
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
                                    'assets/png/people.png',
                                    height: 20,
                                  )),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: Text(
                                  'Membres',
                                  style:
                                      TextStyle(fontSize: 18, color: greyColor),
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.only(right: 15, left: 40),
                                  child:
                                      Icon(Icons.keyboard_arrow_down_outlined)),
                            ],
                          ),
                        ),
                        itemBuilder: (context) {
                          return <PopupMenuEntry<Widget>>[
                            PopupMenuItem(
                                child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddMemberPage()));
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(
                                    "assets/svg/add_user.svg",
                                    color: Colors.black,
                                  ),
                                  Container(
                                    child: Center(
                                        child: Text('Ajouter un membre',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black))),
                                  ),
                                  SizedBox(width: 10),
                                ],
                              ),
                            )),
                            PopupMenuItem(
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MembersPage()));
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.list, color: Colors.black),
                                      Container(
                                        child: const Center(
                                            child: Text('Liste des membres',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                ))),
                                      ),
                                      SizedBox(width: 10),
                                    ],
                                  )),
                            ),
                            PopupMenuItem(
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SynchronisationPage()));
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.cloud_upload_outlined,
                                          color: Colors.black),
                                      SizedBox(width: 10),
                                      Container(
                                        child: const Center(
                                            child: Text(
                                                'Synchroniser les membres',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                ))),
                                      ),
                                    ],
                                  )),
                            )
                          ];
                        })),
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
                              style: TextStyle(fontSize: 18, color: greyColor),
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
    ));
  }
}
