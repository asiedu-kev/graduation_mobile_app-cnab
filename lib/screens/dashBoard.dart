import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/design.util.dart';
import 'parametre.dart';

class DashBoard extends StatefulWidget {
  //const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {


  var selectedMember;

  final List<String> taches = ['AG-', 'CO-',];

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
                    decoration: BoxDecoration(
                    ),
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
                                        child: Image.asset('assets/png/profil.png',height: 55,),
                                      ),
                                      SizedBox(height: 20,),
                                      Container(
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(right: 60),
                                              child: Text('Jane Doe', style: TextStyle(color: greyColor, fontSize: 20),),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(left: 15),
                                              child: Text('janedoe@gmail.com', style: TextStyle(fontSize: 15),),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                          ),

                        ],
                      ),
                    )
                ),

                Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Container(
                          width: (MediaQuery.of(context).size.width * 0.72),
                          padding: EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10.0,
                                spreadRadius: -10.0,
                                offset: Offset(-7, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: DropdownButtonFormField(
                            items: taches.map((item) {
                              return new DropdownMenuItem(
                                value: item,
                                child: new Text(item),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                print(value);
                                selectedMember = value.toString();
                              });
                            },
                            decoration: InputDecoration(
                                labelStyle: TextStyle(fontWeight: FontWeight.w600),
                                hintText: "Membres",
                                fillColor: inactiveColor,
                                filled: true,
                                focusColor: Colors.white,
                                contentPadding: new EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 10.0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                    color: inactiveColor,
                                  ),
                                )
                            ),
                          )
                      ),

                      SizedBox(height: 25,),

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
                              child: Image.asset('assets/png/parametre.png',height: 20,),
                            ),
                            SizedBox(height: 20,),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Parametre()));
                              },
                              child: Container(
                                child: Text('Paramètres', style: TextStyle(fontSize: 18, color: greyColor ),),
                              ),
                            )
                          ],
                        ),
                      ),


                      SizedBox(height: 25,),

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
                              child: Image.asset('assets/png/dashBlack.png',height: 20,),
                            ),
                            SizedBox(height: 20,),
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).pop();
                              },
                              child:  Container(
                                child: Text('Dashboard', style: TextStyle(fontSize: 18, color: greyColor ),),
                              ),
                            )
                          ],
                        ),
                      ),

                      SizedBox(height: 25,),

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
                              child: Image.asset('assets/png/deconnection.png',height: 20,),
                            ),
                            SizedBox(height: 20,),
                            GestureDetector(
                              onTap: (){
                                exit(0);
                              },
                                child: Container(
                                  child: Text('Se déconnecter', style: TextStyle(fontSize: 18, color: greyColor ),),
                                )
                            )
                          ],
                        ),
                      ),


                    ],
                  ),
                )


              ],
            ),
          )
      ),

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
        title: Text("Dashboard"),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, bottom: 20, right: 20, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primaryColor,
                  ),
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: 70,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 45),
                        child: Center(
                          child: Image.asset('assets/png/member.png',height: 20,),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: inactiveColor,
                  ),
                  padding: EdgeInsets.all(12),
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text('Membres enregistrés', style: TextStyle(fontSize: 16),),
                      ),
                      Container(
                        child: Text('1024', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),),
                      )
                    ],
                  ),
                )
              ],
            ),

            SizedBox(height: 27,),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.greenAccent,
              ),
              padding: EdgeInsets.all(12),
              height: MediaQuery.of(context).size.height * 0.07,
              width: 320,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 15, left: 40),
                    child: Image.asset('assets/png/categorie.png',height: 20,),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: Text('Membres par catégories', style: TextStyle(fontSize: 15),),
                  )
                ],
              ),
            ),

            SizedBox(height: 27,),

            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: clearGreen,
                  ),
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: 70,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 45),
                        child: Center(
                          child: Image.asset('assets/png/entreprise.png',height: 20,),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: inactiveColor,
                  ),
                  padding: EdgeInsets.all(12),
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text('Personne morale', style: TextStyle(fontSize: 16),),
                      ),
                      Container(
                        child: Text('768', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),),
                      )
                    ],
                  ),
                )
              ],
            ),

            SizedBox(height: 27,),

            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: secondClearGreen,
                  ),
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: 70,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 45),
                        child: Center(
                          child: Image.asset('assets/png/entreprise.png',height: 20,),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: inactiveColor,
                  ),
                  padding: EdgeInsets.all(12),
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: Text('Personne physique(Exploitant)', style: TextStyle(fontSize: 15), textAlign: TextAlign.center,),
                      ),
                      Container(
                        child: Text('512', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),),
                      )
                    ],
                  ),
                )
              ],
            ),

            SizedBox(height: 27,),

            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: darkGreen,
                  ),
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: 70,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 45),
                        child: Center(
                          child: Image.asset('assets/png/entreprise.png',height: 20,),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: inactiveColor,
                  ),
                  padding: EdgeInsets.all(12),
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: Text('Personne physique(Non exploitant)', style: TextStyle(fontSize: 15),textAlign: TextAlign.center,),
                      ),
                      Container(
                        child: Text('64', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),

    );
  }
}


class CustomListile extends StatelessWidget {

  String text;
  Function onTap;

  CustomListile(this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0, 8.0, 0),
      child: Container(
        child: InkWell(
          splashColor: inactiveColor,
          onTap: onTap,
          child: Container(
            height: 55,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(text, style: TextStyle(
                        color: inactiveColor,
                        fontSize: 18,
                      ),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}