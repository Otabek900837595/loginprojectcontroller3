import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:loginprojectcontroller3/pages/splash_page.dart';

import '../DB/HiveDB.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passswordcontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.green.shade400,
            ),
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: const [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage("assets/images/photo.jpg"),
                          ),
                          SizedBox(height: 5,),
                          Text("WELCOME!",style: TextStyle(fontSize: 24,color: Colors.white)),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Container(
                        height: 400,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Colors.grey,blurRadius: 5,offset: Offset(5,5)),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(19),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              controller: emailcontroller,
                              decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.black,fontSize: 18),
                              ),
                            ),
                            SizedBox(height: 20,),
                            TextField(
                              controller: passswordcontroller,
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.black,fontSize: 18),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Forgot password?",style: TextStyle(color: Colors.green.shade300,fontWeight: FontWeight.bold),)
                              ],
                            ),
                            SizedBox(height: 50,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MaterialButton(
                                  onPressed: (){
                                    stringDB ();
                                    stringDB1 ();
                                  },
                                  color: Colors.green,
                                  height: 80,
                                  minWidth: 80,
                                  child: Icon(Icons.chevron_right, color: Colors.white),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 12,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("New User?"),
                          TextButton(
                              onPressed: (){
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SplashPage()));
                              },
                              child: Text("Sign UP")
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }



  void stringDB (){
    String name = "Email ${emailcontroller.text}";
    HiveDB.storeString(name);
    String loadName = HiveDB.loadString();
    print(loadName);
  }
  void stringDB1 (){
    String name = "Password ${passswordcontroller.text}";
    HiveDB.storeString(name);
    String loadName = HiveDB.loadString();
    print(loadName);
  }
}
