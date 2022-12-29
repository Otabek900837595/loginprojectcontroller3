import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginprojectcontroller3/pages/home_page.dart';

import '../DB/HiveDB.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
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
                      children: [
                        Text("Sign Up",style: TextStyle(fontSize: 24,color: Colors.white)),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Container(
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
                              hintText: "email",
                              hintStyle: TextStyle(color:Colors.black,fontSize: 18),
                            ),

                          ),
                          SizedBox(height: 20,),
                          TextField(
                            controller: namecontroller,
                            decoration: InputDecoration(
                              hintText: "Full Name",
                              hintStyle: TextStyle(color: Colors.black,fontSize: 18),
                            ),

                          ),
                          SizedBox(height: 20,),
                          TextField(
                            controller: phonecontroller,
                            decoration: InputDecoration(
                              hintText: "Phone No.",
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
                          SizedBox(height: 50,),
                          SizedBox(
                            // width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MaterialButton(
                                  onPressed: (){
                                    stringDB();
                                    stringDB2();
                                    stringDB3();
                                    stringDB4();
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
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already accaunt?"),
                        TextButton(
                            onPressed: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                            },
                            child: Text("Sign In")
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

  void stringDB2 (){
    String name = "name ${namecontroller.text}";
    HiveDB.storeString(name);
    String loadName = HiveDB.loadString();
    print(loadName);
  }

  void stringDB3 (){
    String name = "phone ${phonecontroller.text}";
    HiveDB.storeString(name);
    String loadName = HiveDB.loadString();
    print(loadName);
  }

  void stringDB4 (){
    String name = "password ${passswordcontroller.text}";
    HiveDB.storeString(name);
    String loadName = HiveDB.loadString();
    print(loadName);
  }

}
