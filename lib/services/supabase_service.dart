// คลาสนี้จะใช้สำหรับการเชื่อมโค้ดคำสั่งทำงานต่างๆ กับ supabase
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_food_log_app/models/food.dart';
class SupabaseService {
  //สร้าง object/instance/ตัวแทน ที่จะใช้ทำงานต่างๆ กับ supabase
  final supabase = Supabase.instance.client;
  //ส่วนของเมธอดต่างๆ ที่จะใช้ทำงานกับ supabase 
  // เช่น การเพิ่มข้อมูล การลบข้อมูล การแก้ไขข้อมูล การดึงข้อมูล เป็นต้น
  //สร้างเมธอดสำหรับดึงข้อมูลจาก foot_tb ใน supabase
  Future<List<Food>> getAllFood() async {
    //ดึงข้อมูลจากตาราง food_tb ใน supabase
    final data = await supabase.from('food_tb')
                                .select('*')
                                .order('foodDate', ascending: false);
//แปลงข้อมูลที่ได้จาก supabase ซึ่งเป็น json มาใช้ในแอปๆแล้วส่งกลับไป ณ จุดเรียกใช้เมธอดน
    return data.map<Food>((e) => Food.fromJson(e)).toList();

}

//สร้างเมธอดสำหรับเพิ่มข้อมูลเข้าไปใน food_tb ใน supabase
Future insertFood(Food food) async {
  await supabase.from('food_tb').insert(food.toJson());
}
//สร้างเมธอดสำหรับแก้ไขข้อมูลใน food_tb ใน supabase
Future updateFood(String id, Food food) async {
  await supabase.from('food_tb').update(food.toJson()).eq('id', id);
}
//สร้างเมธอดสำหรับลบข้อมูลใน food_tb ใน supabase
Future deleteFood(String id) async {
  await supabase.from('food_tb').delete().eq('id', id);

}

}