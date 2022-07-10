import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gestion_des_membres/widgets/drawer.dart';

import '../utils/design.util.dart';

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
        title: Text("Parametres"),
      ),
      body: Container(
          child: Center(
              child: Text("Aucun parametre n'est disponible pour le moment"))),
    );
  }
}
