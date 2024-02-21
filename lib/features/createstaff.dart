import 'package:company/service/database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';

class Staff extends StatefulWidget {
  const Staff({super.key});

  @override
  State<Staff> createState() => _StaffState();
}

class _StaffState extends State<Staff> {
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController datecontroller = new TextEditingController();
  TextEditingController citycontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Create ",
              style: TextStyle(
                color: Colors.orange,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
                ),
                Text(
              "Staff",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
                )
              ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 24.0, top: 30.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name", style: TextStyle(color: Colors.black,fontSize: 20.0),),
            SizedBox(height: 10.0,),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                controller: namecontroller,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("Date", style: TextStyle(color: Colors.black,fontSize: 20.0),),
            SizedBox(height: 10.0,),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                controller: datecontroller,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("City", style: TextStyle(color: Colors.black,fontSize: 20.0),),
            SizedBox(
              height: 10.0,
              ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                controller: citycontroller,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(height: 20.0,),
            Center(
              child:  ElevatedButton(
                onPressed: () async{
                  String Id = randomAlphaNumeric(10);
                  Map<String, dynamic> staffInfoMap ={
                    "Id": Id,
                    "Name": namecontroller.text,
                    "Date": datecontroller.text,
                    "City": citycontroller.text,
                  };
                  await DatabaseMethod().addStaff(staffInfoMap, Id).then((value) {
                    Fluttertoast.showToast(
                      msg: "Staff has been uploaded",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                  });
            }, 
            child: Text(
              "Create",
              style: TextStyle(fontSize: 20.0),)),

            )
           
          ],
        ),
      ),
    );
  }
}