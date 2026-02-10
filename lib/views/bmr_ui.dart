// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class BmrUi extends StatefulWidget {
  const BmrUi({super.key});

  @override
  State<BmrUi> createState() => _BmrUiState();
}

class _BmrUiState extends State<BmrUi> {
  //ตัวควบคุม TextField
  TextEditingController wCtrl = TextEditingController();
  TextEditingController hCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();

  String selectedGender = 'ชาย'; // Default gender
  double bmrValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 10),
                Text(
                  'คำนวณหาอัตราการเผาผลาญพื้นฐาน (BMR)',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/images/bmi.png',
                  width: 160,
                  height: 160,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'เพศ',
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: DropdownButton<String>(
                    value: selectedGender,
                    isExpanded: true,
                    underline: SizedBox(),
                    items: ['ชาย', 'หญิง'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedGender = newValue ?? 'ชาย';
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'น้ำหนัก ( kg.)',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: wCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรอกน้ำหนักของคุณ',
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ส่วนสูง ( cm.)',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: hCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรอกส่วนสูงของคุณ',
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'อายุ ( ปี )',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: ageCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรอกอายุของคุณ',
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    //คำนวณ BMR
                    //Validate input
                    if (wCtrl.text.isEmpty ||
                        hCtrl.text.isEmpty ||
                        ageCtrl.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('กรุณากรอกข้อมูลให้ครบถ้วน'),
                          backgroundColor: Color(0xFFAB80BF),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }

                    //คำนวณและแสดงผล
                    double w = double.parse(wCtrl.text);
                    double h = double.parse(hCtrl.text);
                    double age = double.parse(ageCtrl.text);

                    setState(() {
                      if (selectedGender == 'ชาย') {
                        // BMR = 66 + (13.7 x weight) + (5 x height) – (6.8 x age)
                        bmrValue = 66 + (13.7 * w) + (5 * h) - (6.8 * age);
                      } else {
                        // BMR = 665 + (9.6 x weight) + (1.8 x height) – (4.7 x age)
                        bmrValue = 665 + (9.6 * w) + (1.8 * h) - (4.7 * age);
                      }
                    });
                  },
                  child: Text(
                    'คำนวณ BMR',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFAB80BF),
                    textStyle: TextStyle(fontSize: 18),
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      55.0,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    //ล้างข้อมูล
                    setState(() {
                      wCtrl.clear();
                      hCtrl.clear();
                      ageCtrl.clear();
                      selectedGender = 'ชาย';
                      bmrValue = 0;
                    });
                  },
                  child: Text(
                    'ล้างข้อมูล',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[400],
                    textStyle: TextStyle(fontSize: 18),
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      55.0,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'BMR',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        Text(
                          bmrValue.toStringAsFixed(2),
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFAB80BF),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'kcal/day',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
