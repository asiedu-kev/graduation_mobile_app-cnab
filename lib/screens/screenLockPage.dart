import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';

class ScreenLockPage extends StatefulWidget {
  const ScreenLockPage({Key? key}) : super(key: key);

  @override
  State<ScreenLockPage> createState() => _ScreenLockPageState();
}

class _ScreenLockPageState extends State<ScreenLockPage> {
  @override
  Widget build(BuildContext context) {
    return ScreenLock(
      correctString: '1234',
      didCancelled: Navigator.of(context).pop,
      didUnlocked: Navigator.of(context).pop,
    );
  }
}
