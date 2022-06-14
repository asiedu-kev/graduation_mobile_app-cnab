import 'package:cnab/utils/design.util.dart';
import 'package:flutter/material.dart';

import '../utils/design.util.dart';

class secondBouton extends StatelessWidget {
  var btnText = "";
  var onClick;

  secondBouton({required this.btnText, this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: MediaQuery.of(context).size.height * 0.52,
        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            inactiveColorWhite,
            inactiveColorWhite,
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
            color: blackColor,
          ),
        ),
      ),
    );
  }
}
