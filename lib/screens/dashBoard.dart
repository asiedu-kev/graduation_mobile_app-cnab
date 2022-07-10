import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gestion_des_membres/widgets/drawer.dart';

import '../database/member_helper.dart';
import '../services/storage_service.dart';
import '../utils/design.util.dart';

class DashBoard extends StatefulWidget {
  //const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int numberOfMembers = 0;
  int numberOfPersonneMorale = 0;
  int numberOfPersonnePhysiqueNonExploitant = 0;
  int numberOfPersonnePhysiqueExploitant = 0;
  String? credentials = StorageService().getUserCredentials();
  List cred = [];

  @override
  void initState() {
    super.initState();
    fetchUserSaved();
    cred = credentials!.split('-');
  }

  fetchUserSaved() async {
    await MemberHelper().members().then((value) {
      setState(() {
        numberOfMembers = value.length;
      });
    });
    await MemberHelper().membersByCategory("personne morale").then((value) {
      setState(() {
        numberOfPersonneMorale = value.length;
      });
    });
    await MemberHelper()
        .membersByCategory("personne physique - non exploitant")
        .then((value) {
      setState(() {
        numberOfPersonnePhysiqueNonExploitant = value.length;
      });
    });
    await MemberHelper()
        .membersByCategory("personne physique - exploitant")
        .then((value) {
      setState(() {
        numberOfPersonnePhysiqueExploitant = value.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(numberOfMembers);
    return Scaffold(
      drawer: DrawerWidget(),
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
                          child: Image.asset(
                            'assets/png/member.png',
                            height: 20,
                          ),
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
                        child: Text(
                          'Membres enregistrés',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Container(
                        child: Text(
                          '2',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 35),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 27,
            ),
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
                    child: Image.asset(
                      'assets/png/categorie.png',
                      height: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Text(
                      'Membres par catégories',
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 27,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: clearprimaryColor,
                  ),
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: 70,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 45),
                        child: Center(
                          child: Image.asset(
                            'assets/png/entreprise.png',
                            height: 20,
                          ),
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
                        child: Text(
                          'Personne morale',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Container(
                        child: Text(
                          '$numberOfPersonneMorale',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 35),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 27,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: secondClearprimaryColor,
                  ),
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: 70,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 45),
                        child: Center(
                          child: Image.asset(
                            'assets/png/entreprise.png',
                            height: 20,
                          ),
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
                  width: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: Text(
                          'Personne physique(Exploitant)',
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        child: Text(
                          '1',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 33),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 27,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: secondClearprimaryColor,
                  ),
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: 70,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 45),
                        child: Center(
                          child: Image.asset(
                            'assets/png/entreprise.png',
                            height: 20,
                          ),
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
                  width: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: Text(
                          'Personne physique(Non exploitant)',
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        child: Text(
                          '1',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 33),
                        ),
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
          onTap: () {},
          child: Container(
            height: 55,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        text,
                        style: TextStyle(
                          color: inactiveColor,
                          fontSize: 18,
                        ),
                      ),
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
