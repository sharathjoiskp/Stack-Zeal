import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stack_zeal/Model/model.dart';
import 'package:stack_zeal/Service/service.dart';

class FullInfoPage extends StatefulWidget {
  FullInfoPage(
      {required this.id,
      required this.uid,
      required this.title,
      required this.body});
  String id;
  String uid;
  String title;
  String body;
  @override
  State<FullInfoPage> createState() => _FullInfoPageState();
}

class _FullInfoPageState extends State<FullInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Full Information',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.amber.shade100,
              border: Border.all(
                color: Colors.red.shade200,
                style: BorderStyle.solid,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: 400,
            width: 350,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                    
                        width: 70,
                        height: 50,
                         decoration: BoxDecoration(
                               color: Colors.blueGrey.shade100,
                          border: Border.all(
                            color: Colors.black12,
                            style: BorderStyle.solid,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Text(
                            'Id  : ${widget.id}',
                            style: GoogleFonts.lato(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                     Container(
                    
                        width: 100,
                        height: 50,
                         decoration: BoxDecoration(
                               color: Colors.blueGrey.shade100,
                          border: Border.all(
                            color: Colors.black12,
                            style: BorderStyle.solid,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Text(
                            'User Id  : ${widget.uid}',
                            style: GoogleFonts.lato(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.title,
                    style: GoogleFonts.lato(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  
                  Text(
                    widget.body,
                    style: GoogleFonts.lato(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
