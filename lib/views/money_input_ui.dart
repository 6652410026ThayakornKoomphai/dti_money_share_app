// ignore_for_file: sort_child_properties_last, prefer_is_empty

import 'package:dti_money_share_app/views/money_result_ui.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoneyInputUI extends StatefulWidget {
  const MoneyInputUI({super.key});

  @override
  State<MoneyInputUI> createState() => _MoneyInputUIState();
}

class _MoneyInputUIState extends State<MoneyInputUI> {
  //สร้างตัวแปรใช้กับ Checkbox
  bool isChecked = false;

  //สร้าง Instance เพื่อควบคุม TextField
  TextEditingController moneyController = TextEditingController();
  TextEditingController personController = TextEditingController();
  TextEditingController tipsController = TextEditingController();

  showWarningDialog(context, message) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('คำเตือน'),
        content: Text(message),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('ตกลก'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'แชร์เงินกันเถอะ',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 40, right: 40),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 30.0,
                ),
                Image.asset(
                  'assets/images/money2.png',
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.width * 0.4,
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextField(
                  controller: moneyController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.moneyBill1Wave,
                      color: Colors.purple,
                    ),
                    hintText: 'ป้อนจำนวนเงิน',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextField(
                  controller: personController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.person,
                      color: Colors.purple,
                    ),
                    hintText: 'ป้อนจำนวนคน',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      onChanged: (paramValue) {
                        //*** โค้ดคำสั่งใดที่มีผลต่อการแสดงผล
                        //*** ให้เขียนอยู่ภายใต้ setState
                        setState(() {
                          isChecked = paramValue!;
                          if (isChecked == false) {
                            tipsController.text = '';
                          }
                        });
                      },
                      value: isChecked,
                      checkColor: Colors.purple.shade100,
                      activeColor: Colors.purple.shade400,
                      side: BorderSide(color: Colors.purple),
                    ),
                    Text(
                      'ทิปให้พนักงานเสิร์ฟ',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextField(
                  controller: tipsController,
                  enabled: isChecked,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.coins,
                      color: Colors.purple,
                    ),
                    hintText: 'ป้อนจำนวนเงินทิป',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    double money = 0;
                    int person = 0;
                    double tips = 0;
                    double moneyShare = 0;
                    //Validate UI
                    if (moneyController.text.length == 0) {
                      showWarningDialog(context, 'ป้อนจำนวนเงินด้วย');
                      return;
                    } else if (personController.text.length == 0) {
                      showWarningDialog(context, 'ป้อนจำนวนคนด้วย');
                      return;
                    } else if (isChecked == true) {
                      if (tipsController.text.length == 0) {
                        showWarningDialog(context, 'ป้อนเงินทิปด้วย');
                        return;
                      } else {
                        tips = double.parse(tipsController.text);
                      }
                    }
                    money = double.parse(moneyController.text);
                    person = int.parse(personController.text);
                    moneyShare = (money + tips) / person;

                    //เปิดหน้า
                    //
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MoneyResultUI(
                          money: money,
                          person: person,
                          tips: tips,
                          moneyShare: moneyShare,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'คำนวณ',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      53.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    //ทุกอย่างเคลียร์
                    setState(() {
                      moneyController.text = '';
                      personController.text = '';
                      tipsController.text = '';
                      isChecked = false;
                    });
                  },
                  icon: Icon(
                    Icons.refresh_sharp,
                    color: Colors.white,
                    size: 40,
                  ),
                  label: Text(
                    'ยกเลิก',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 211, 58, 12),
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      53.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Text('Created By Thayakorn Koomphai')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
