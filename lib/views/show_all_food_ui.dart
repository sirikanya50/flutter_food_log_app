import 'package:flutter/material.dart';
import 'package:flutter_food_log_app/models/food.dart';
import 'package:flutter_food_log_app/views/add_food_ui.dart';
import 'package:flutter_food_log_app/services/supabase_service.dart';
import 'package:flutter_food_log_app/views/update_del_food_ui.dart';

class ShowAllFoodUi extends StatefulWidget {
  const ShowAllFoodUi({super.key});

  @override
  State<ShowAllFoodUi> createState() => _ShowAllFoodUiState();
}

class _ShowAllFoodUiState extends State<ShowAllFoodUi> {
  List<Food> foods = [];

  final Service = SupabaseService();

  //สร้างเมธอด
  void loadAllFood() async {
    //สร้างตัวแปรเก็บข้อมูล
    final data = await Service.getAllFood();
    setState(() {
      foods = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAllFood();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'กินกับหนู LOG',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            Image.asset(
              'assets/images/logo.png',
              width: 180,
              height: 180,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: foods.length,
                //สร้างหน้าตา
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateDelFoodUi(
                              //ส่งข้อมูลไปหน้า UpdateDelFoodUi
                              food: foods[index],
                            ),
                          ),
                        ).then((value) {
                          //กลับมาหน่าแล้วจะให้ทำอะไร
                          //เรียก
                          loadAllFood();
                        });
                      },
                      leading: Image.asset(
                        'assets/images/food_img.png',
                      ),
                      trailing: Icon(
                        Icons.info,
                        color: Colors.red,
                      ),
                      title: Text(
                        'กิน ${foods[index].foodName}',
                      ),
                      subtitle: Text(
                          'วันที่ ${foods[index].foodDate},มื้อ ${foods[index].foodMeal}'),
                      tileColor: index % 2 == 0
                          ? const Color.fromARGB(255, 255, 237, 255)
                          : const Color.fromARGB(255, 234, 255, 247).withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddFoodUi()),
          ).then((value) {
            //กลับมาหน่าแล้วจะให้ทำอะไร
            //เรียก
            loadAllFood();
          });
        },
        backgroundColor: Colors.red,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}