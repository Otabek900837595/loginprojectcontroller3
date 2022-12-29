
import 'package:hive/hive.dart';

class HiveDB {
  static var box2 = Hive.box("baza1");

  static void storeString (String name){
    box2.put("name", name);
  }

  static String loadString(){
    return box2.get("name");
  }

}