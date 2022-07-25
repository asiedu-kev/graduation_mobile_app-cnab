import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gestion_des_membres/helpers/check_connexion_state.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/design.util.dart';
import '../widgets/drawer.dart';

class SynchronisationPage extends StatefulWidget {
  const SynchronisationPage({Key? key}) : super(key: key);

  @override
  State<SynchronisationPage> createState() => _SynchronisationPageState();
}

class _SynchronisationPageState extends State<SynchronisationPage> {
  final _formKey = GlobalKey<FormState>();
  bool synchronizationState = false;
  bool hasSynchronized = false;

  simulateSynchronisation() {
    setState(() {
      synchronizationState = true;
    });
    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        synchronizationState = false;
        hasSynchronized = true;
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
          title: Text("Synchroniser les membres"),
        ),
        body: Column(
          children: [
            20.height,
            Container(
                margin: EdgeInsets.only(left: 48, right: 48, bottom: 18),
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
                      checkConnection().then((value) {
                        if (value == true) {
                          showDialog(
                            context: context,
                            builder: (ctx) => StatefulBuilder(
                              builder: (BuildContext context,
                                  void Function(void Function()) setState) {
                                return AlertDialog(
                                  title: Text(
                                    hasSynchronized
                                        ? "Synchronisation effectuée"
                                        : "Synchronisation en cours",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  content: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: synchronizationState
                                        ? Container(
                                            height: 100,
                                            child: SpinKitCircle(
                                              color: primaryColor,
                                              size: 50.0,
                                            ))
                                        : hasSynchronized
                                            ? Container(
                                                child: Icon(
                                                Icons.check_circle_outline,
                                                color: primaryColor,
                                                size: 100,
                                              ))
                                            : Form(
                                                key: _formKey,
                                                child: AppTextField(
                                                  isValidationRequired: true,
                                                  errorThisFieldRequired:
                                                      "Ce champ est requis",
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return "Ce champ est requis";
                                                    }
                                                    return null;
                                                  },
                                                  // Optional
                                                  textFieldType:
                                                      TextFieldType.NAME,
                                                  decoration: InputDecoration(
                                                      labelText:
                                                          'Code de synchronisation',
                                                      border:
                                                          OutlineInputBorder()),
                                                ).validate(),
                                              ),
                                  ),
                                  actions: <Widget>[
                                    hasSynchronized
                                        ? Container()
                                        : TextButton(
                                            onPressed: () {
                                              setState(() {
                                                synchronizationState = false;
                                                synchronizationState = false;
                                              });
                                              Navigator.of(ctx).pop();
                                            },
                                            child: Text("Annuler"),
                                          ),
                                    hasSynchronized
                                        ? TextButton(
                                            onPressed: () {
                                              setState(() {
                                                synchronizationState = false;
                                                synchronizationState = false;
                                              });
                                              Navigator.of(ctx).pop();
                                            },
                                            child: Text("Ok"),
                                          )
                                        : TextButton(
                                            onPressed: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                setState(() {
                                                  synchronizationState = true;
                                                });
                                                Future.delayed(
                                                    const Duration(seconds: 5),
                                                    () {
                                                  setState(() {
                                                    synchronizationState =
                                                        false;
                                                    hasSynchronized = true;
                                                  });
                                                });
                                              }
                                            },
                                            child: Text("Valider"),
                                          ),
                                  ],
                                );
                              },
                            ),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text(
                                "Synchronisation en cours",
                                style: TextStyle(fontSize: 13),
                              ),
                              content: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                    child: Text(
                                        "Oups vous n'êtes pas connecté à Internet")),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: Text("Ok"),
                                ),
                              ],
                            ),
                          );
                        }
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.cloud_upload_outlined,
                          color: Colors.white,
                        ),
                        10.width,
                        Text("Lancer la synchronisation",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                )),
            Text("Dernière synchronisation",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Il y a X jours (28/12/2021)", style: TextStyle(fontSize: 12))
          ],
        ));
  }
}
