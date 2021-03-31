import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../shared/styles.dart';
import 'package:Procery/src/shared/styles.dart';
import 'package:Procery/src/shared/colors.dart';

class ComingSoon extends StatefulWidget {
  @override
  _ComingSoonState createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  bool _hasContents = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 60.0,
              ),
              Center(
                child: Image.asset(
                  "assets/images/notification.png",
                  width: 300.0,
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Text(
                "Receive Notifications",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                  color: Color.fromRGBO(28, 28, 28, 1),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Be the first to know when our partners join the app.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.8,
                  color: Color.fromRGBO(90, 93, 106, 1),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                          child: Image.asset(
                        "assets/icons/ntuc.png",
                        height: 100,
                        width: 100,
                      )),
                      SizedBox(
                        width: 20,
                      ),
                      ClipOval(
                          child: Image.asset(
                        "assets/icons/giant.png",
                        height: 80,
                        width: 80,
                      )),
                      SizedBox(
                        width: 20,
                      ),
                      ClipOval(
                          child: Image.asset(
                        "assets/icons/cold_storage.png",
                        height: 100,
                        width: 100,
                      )),
                    ],
                  )),
              Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      ClipOval(
                          child: Image.asset(
                        "assets/icons/sheng_siong.png",
                        height: 100,
                        width: 100,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      ClipOval(
                          child: Image.asset(
                        "assets/icons/don_don_donki.png",
                        height: 100,
                        width: 100,
                      )),
                    ],
                  )),
              SizedBox(
                height: 20.0,
              ),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 250, height: 40),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.greenAccent[700]),
                  child: Text(
                    "Notify Me",
                    style:
                        GoogleFonts.roboto(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
