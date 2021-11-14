import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:phinder/main.dart';

class DetailedExercise extends StatefulWidget {
  const DetailedExercise({Key? key}) : super(key: key);

  @override
  _DetailedExerciseState createState() => _DetailedExerciseState();
}

class _DetailedExerciseState extends State<DetailedExercise> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                    padding: const EdgeInsets.only(left: 28.0, top: 20.0),
                    child: Text('Run 30 seconds',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)))),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(
                        'https://images.unsplash.com/photo-1571008887538-b36bb32f4571?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cnVubmluZ3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80'),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text('Run in 30 seconds', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
                    )
                  ],
                )),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(
                        'https://images.unsplash.com/photo-1571008887538-b36bb32f4571?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cnVubmluZ3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80'),
                    Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('Walk in 1 minute', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
                    )
                  ],
                )
              ),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(
                        'https://images.unsplash.com/photo-1571008887538-b36bb32f4571?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cnVubmluZ3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80'),
                    Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('Repeat 6 times', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
                    )
                  ],
                )),
            Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.center,
                child: 
                  Text('20:00', style: TextStyle(fontSize: 42))
                ),
            ),
            Expanded(
              flex: 1,
              child: Container(alignment: Alignment.center,
              child: CustomButton(
                  onTap: () {
                    print('Completed!');
                    // Navigator
                  },
                  str: 'COMPLETE',
                  backgroundColor: Color.fromRGBO(248, 207, 97, 30),
                  borderColor: Colors.transparent,
                  textColor: Colors.black,
                  width: 300))
            )
          ],
        ),
      ),
    ));
  }
}
