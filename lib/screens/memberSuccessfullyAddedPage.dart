import 'package:flutter/material.dart';

import '../models/Member.dart';
import '../utils/design.util.dart';
import 'dashBoard.dart';

class MemberSuccessfulAddedPage extends StatefulWidget {
  final Member member;

  const MemberSuccessfulAddedPage({Key? key, required this.member})
      : super(key: key);

  @override
  State<MemberSuccessfulAddedPage> createState() =>
      _MemberSuccessfulAddedPageState();
}

class _MemberSuccessfulAddedPageState extends State<MemberSuccessfulAddedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          titleSpacing: 40,
          centerTitle: true,
          backgroundColor: primaryColor,
          title: Text("Ajout de membre "),
        ),
        body: Column(
          children: [
            Container(height: MediaQuery.of(context).size.height * 0.3),
            Container(
                child: Icon(
              Icons.check_circle_outline,
              color: primaryColor,
              size: 100,
            )),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(text: "Le membre "),
                  TextSpan(
                      text:
                          "${widget.member.lastName}  ${widget.member.firstName}",
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: " a été ajouté avec succès"),
                ],
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DashBoard()));
                    },
                    child: Text("Revenir a l'accueil"),
                  ),
                )),
          ],
        ));
  }
}
