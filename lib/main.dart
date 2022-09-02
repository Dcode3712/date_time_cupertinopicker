import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main()
{
    runApp(MaterialApp(home: date_time_cupertinopicker(),));
}

class date_time_cupertinopicker extends StatefulWidget {
  const date_time_cupertinopicker({Key? key}) : super(key: key);

  @override
  State<date_time_cupertinopicker> createState() => _date_time_cupertinopickerState();
}

class _date_time_cupertinopickerState extends State<date_time_cupertinopicker> {

  String curdate = "";
  String curTime = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    curdate = DateTime.now().toString();
    curTime = TimeOfDay.now().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Date Picker And Time Picker"),),

      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            ElevatedButton(
                onPressed: () {
                  showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2025))
                      .then((value) {
                    if (value != null) {
                      setState(() {
                        curdate = value.toString();
                      });
                    }
                  });
                },
                child: Text("${curdate}")),

            SizedBox(height: 20),

            ElevatedButton(
                onPressed: () {
                  showTimePicker(
                      initialEntryMode: TimePickerEntryMode.input,
                      context: context,
                      initialTime: TimeOfDay.now())
                      .then((value) {
                    if (value != null) {
                      setState(() {
                        curTime = value.toString();
                      });
                    }
                  });
                },
                child: Text("${curTime}")),

            SizedBox(height: 20),


            ElevatedButton(onPressed: () {
              showDialog(builder: (context) {
                return  Container(
                  color: Colors.purple.shade200,
                  height: 150,
                  child: CupertinoDatePicker(mode: CupertinoDatePickerMode.time,onDateTimeChanged: (value) {


                    SystemSound.play(SystemSoundType.click);

                    print(value);
                  },),
                );
              },context: context);
            }, child: Text("Time")),
          ],
        ),
      ),
    );
  }
}
