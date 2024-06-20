import 'package:flutter/material.dart';

import 'package:qtrack/phptrack.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  navigate() async {
    await Future.delayed(Duration(seconds: 3), () async {
      Navigator.push(
          context,
          PageRouteBuilder(
              opaque: false, // set to false
              pageBuilder: (_, __, ___) {
                return MyWidget(
                  urlphp: 'https://trafiqerp.in/qtracker/index.php',
                );
              }));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColor,
      body: InkWell(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Center(
            child: Column(
          children: [
            Expanded(
              child: Container(
                  height: 150,
                  width: 150,
                  child: Image.asset(
                    "asset/logo_black_bg.png",
                  )),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(right: 8.0, bottom: 12),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text(
            //         "VEGA BUSINESS SOFTWARE",
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 10,
            //             fontWeight: FontWeight.bold),
            //       )
            //       // Container(
            //       //     height: 50,
            //       //     // width: 150,
            //       //     child: Image.asset(
            //       //       "assets/logo_black_bg.png",
            //       //     )),
            //     ],
            //   ),
            // )
          ],
        )),
      ),
    );
  }
}

Color parseColor(String color) {
  print("Colorrrrr...$color");
  String hex = color.replaceAll("#", "");
  if (hex.isEmpty) hex = "ffffff";
  if (hex.length == 3) {
    hex =
        '${hex.substring(0, 1)}${hex.substring(0, 1)}${hex.substring(1, 2)}${hex.substring(1, 2)}${hex.substring(2, 3)}${hex.substring(2, 3)}';
  }
  Color col = Color(int.parse(hex, radix: 16)).withOpacity(1.0);
  return col;
}
