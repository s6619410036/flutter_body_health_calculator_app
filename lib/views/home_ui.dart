import 'package:flutter/material.dart';
import 'package:flutter_iot_second_app/views/about_ui.dart';
import 'package:flutter_iot_second_app/views/bmi_ui.dart';
import 'package:flutter_iot_second_app/views/bmr_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  //สร้างด้วยตัวแปรควบคุม currentIndex ของ barItem
  int currentIndexStatus = 1;

  //สร้างตัวแปลเก็บ widget หน้าจอที่จะมาแสดงที่ body ของ Scaffold
  List<Widget> showBody = [
    BmiUi(),
    AboutUi(),
    BmrUi(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFAB80BF),
        title: Text(
          'Body Health Calculator',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentIndexStatus = value;
          });
        },
        currentIndex: currentIndexStatus,
        selectedItemColor: Color(0xFFAB80BF),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_3,
            ),
            label: 'BMI',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.personBooth,
            ),
            label: 'BMR',
          ),
        ],
      ),
      body: showBody[currentIndexStatus],
    );
  }
}
