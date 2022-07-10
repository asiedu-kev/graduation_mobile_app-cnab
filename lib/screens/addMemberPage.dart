import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gestion_des_membres/models/Member.dart';
import 'package:gestion_des_membres/screens/personne_physique_non_exploitant/personnePhysiqueAddPage1.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/design.util.dart';
import '../widgets/drawer.dart';

class AddMemberPage extends StatefulWidget {
  const AddMemberPage({Key? key}) : super(key: key);

  @override
  State<AddMemberPage> createState() => _AddMemberPageState();
}

class _AddMemberPageState extends State<AddMemberPage> {
  Member newMember = new Member();

  @override
  Widget build(BuildContext context) {
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
          title: Text("Ajouter un membre"),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Veuillez selectionner la catégorie du membre avant de continuer :",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 48, right: 48, top: 18),
                child: SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(primaryColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                    onPressed: () {
                      newMember.category = "personne physique - non exploitant";
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PersonnePhysiqueAddPage1(member: newMember)));
                    },
                    child: Text(
                      "Personne physique (Non Exploitant)",
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                )),
            30.height,
            Container(
                margin: EdgeInsets.only(left: 48, right: 48, top: 18),
                child: SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(primaryColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                    onPressed: () {
                      newMember.category = "personne physique - exploitant";
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PersonnePhysiqueAddPage1(member: newMember)));
                    },
                    child: Text(
                      "Personne physique (Exploitant)",
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                )),
            30.height,
            Container(
                margin: EdgeInsets.only(left: 48, right: 48, top: 18),
                child: SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(primaryColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                    onPressed: () {
                      newMember.category = "personne morale";
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PersonnePhysiqueAddPage1(member: newMember)));
                    },
                    child: Text(
                      "Personne morale",
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                ))
          ]),
        ));
  }
}
