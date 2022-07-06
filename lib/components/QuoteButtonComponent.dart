import 'package:flutter/material.dart';
import 'package:gestion_des_membres/utils/design.util.dart';

import '../utils/design.util.dart';

class bouton extends StatelessWidget {
  var btnText = "";
  var onClick;

  bouton({required this.btnText, this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: MediaQuery.of(context).size.height * 0.52,
        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            primaryColor,
            primaryColor,
          ], end: Alignment.centerLeft, begin: Alignment.centerRight),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          btnText,
          style: TextStyle(
            fontSize: 18,
            color: inactiveColor,
          ),
        ),
      ),
    );
  }
}
