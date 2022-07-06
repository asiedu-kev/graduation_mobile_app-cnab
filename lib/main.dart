import 'package:flutter/material.dart';
import 'package:gestion_des_membres/services/storage_service.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService().init();
  runApp(MyApp());
}
