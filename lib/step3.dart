import 'package:flutter/material.dart';
import 'package:phinder/main.dart';

class Step3 extends StatefulWidget {
  const Step3({Key? key}) : super(key: key);

  @override
  _Step3State createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  bool isVisible = false;
  List<bool> isSelected = [false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(80.0),
              child: AppBar(
                  iconTheme: IconThemeData(color: Colors.black),
                  flexibleSpace: Row(
                    children: [
                      Expanded(
                          child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Step 3 of 3\nUpload your image',
                                textAlign: TextAlign.center),
                          ],
                        ),
                      )),
                      Image.asset('assets/screens/capture.png',
                          fit: BoxFit.fitHeight),
                    ],
                  ),
                  backgroundColor: Color.fromARGB(255, 248, 207, 97))),
          body: Container(
            // child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: InkWell(
                              onTap: () {},
                              child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Icon(
                                    Icons.cloud_upload_outlined,
                                    size: 40,
                                    color: Colors.blueGrey,
                                  )))),
                      SizedBox(width: 20.0),
                      Expanded(
                          child: InkWell(
                              onTap: () {},
                              child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Icon(
                                    Icons.photo_camera_outlined,
                                    size: 40,
                                    color: Colors.blueGrey,
                                  )))),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 100.0,
                            child: Image.network(
                              'https://i1-dulich.vnecdn.net/2021/11/08/69778654-2673094529369257-2099-9934-2443-1636376832.jpg?w=0&h=0&q=100&dpr=1&fit=crop&s=dQQHhQ8ObWZLh7tSrQCfSA',
                            ),
                          ),
                          SizedBox(height: 5.0),
                          SizedBox(
                            width: 100.0,
                            child: Image.network(
                              'https://i1-dulich.vnecdn.net/2021/11/08/69778654-2673094529369257-2099-9934-2443-1636376832.jpg?w=0&h=0&q=100&dpr=1&fit=crop&s=dQQHhQ8ObWZLh7tSrQCfSA',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 5.0),
                      Column(
                        children: [
                          SizedBox(
                            width: 100.0,
                            child: Image.network(
                              'https://i1-dulich.vnecdn.net/2021/11/08/69778654-2673094529369257-2099-9934-2443-1636376832.jpg?w=0&h=0&q=100&dpr=1&fit=crop&s=dQQHhQ8ObWZLh7tSrQCfSA',
                            ),
                          ),
                          SizedBox(height: 5.0),
                          SizedBox(
                            width: 100.0,
                            child: Image.network(
                              'https://i1-dulich.vnecdn.net/2021/11/08/69778654-2673094529369257-2099-9934-2443-1636376832.jpg?w=0&h=0&q=100&dpr=1&fit=crop&s=dQQHhQ8ObWZLh7tSrQCfSA',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  CustomButton(
                    onTap: () {
                      Navigator.pushNamed(context, '/finish');
                    },
                    str: 'Next',
                    backgroundColor: Colors.grey,
                    borderColor: Colors.transparent,
                    textColor: Colors.white,
                    width: double.infinity,
                  )
                ],
              ),
            ),
            // ),
          )),
    );
  }
}
