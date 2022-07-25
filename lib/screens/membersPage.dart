import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gestion_des_membres/database/member_helper.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/Member.dart';
import '../utils/design.util.dart';
import '../widgets/drawer.dart';

class MembersPage extends StatefulWidget {
  const MembersPage({Key? key}) : super(key: key);

  @override
  State<MembersPage> createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  List<Member> members = [];

  @override
  void initState() {
    super.initState();
    _getMembers();
  }

  _getMembers() {
    MemberHelper().members().then((value) {
      setState(() {
        members = value;
      });
    });
  }

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
          title: Text("Liste des membres"),
        ),
        body: Column(
          children: members
              .map((member) => Container(
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 6.0,
                          spreadRadius: -5.0,
                          offset: Offset(0, 0),
                        )
                      ],
                      color: Color(0xFFFAFAFA),
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(12),
                  child: Row(children: [
                    Container(
                      child: Image.asset(
                        'assets/png/profile.png',
                        height: 55,
                      ),
                    ),
                    15.width,
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${member.lastName}  ${member.firstName}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("${member.category}",
                              style: TextStyle(fontWeight: FontWeight.normal)),
                          RichText(
                              text: TextSpan(
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                  children: [
                                TextSpan(
                                    text: "(00229)",
                                    style: TextStyle(fontSize: 12)),
                                TextSpan(text: " ${member.phone}")
                              ]))
                        ])
                  ])))
              .toList(),
        ));
  }
}
