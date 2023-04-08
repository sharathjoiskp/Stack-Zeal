import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stack_zeal/Model/model.dart';
import 'package:stack_zeal/Views/full_info.dart';

import '../Service/service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Model> models = [];
  TextEditingController numberController = TextEditingController();
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack Zeal'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.4,
              child: ListView.builder(
                  itemCount: number,
                  itemBuilder: (context, index) {
                    final readModel = models[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red.shade200,
                            style: BorderStyle.solid,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(
                              FullInfoPage(
                                id: readModel.id.toString(),
                                uid: readModel.userId.toString(),
                                title: readModel.title,
                                body: readModel.body,
                              ),
                            );
                            print('....................object...............');
                          },
                          child: ListTile(
                            title: Text(
                              readModel.title,
                              style: GoogleFonts.lato(
                                  color: Colors.blueGrey.shade900,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FontStyle.italic),
                            ),
                            subtitle: Text(
                              readModel.body,
                              style: GoogleFonts.lato(
                                color: Colors.black45,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            leading: Text(
                              readModel.id.toString(),
                              style: GoogleFonts.lato(
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              color: Colors.black12,
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Enter the number of \ndata you wanna fetch : ',
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Container(
                
                    width: 120,
                    child: TextField(
                      controller: numberController,
                      maxLines: 1,
                      //maxLength: 3,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () async {
                              if (numberController.text.isEmpty ||
                                  int.parse(numberController.text) <= 0 ||
                                  int.parse(numberController.text) > 100) {
                                Fluttertoast.showToast(
                                    msg:
                                        "Invalid number \n Please enter number from 1 to 100",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.redAccent,
                                    textColor: Colors.black,
                                    fontSize: 16.0);
                              } else {
                                setState(() {
                                  number = int.parse(numberController.text);
                                });
                                await fetchdata();
                              }
                            },
                            icon: Icon(
                              Icons.arrow_right_alt_sharp,
                              size: 40,
                              color: Colors.black,
                            )),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: Colors.redAccent), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> fetchdata() async {
    final response = await getData();

    setState(() {
      models = response;
    });
  }
}
