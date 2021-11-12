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
          appBar: AppBar(
            title: Text('Step3'),
          ),
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
                      CustomButton(
                        onTap: () {},
                        str: 'Choose from devive',
                        backgroundColor: Colors.grey,
                        borderColor: Colors.transparent,
                        textColor: Colors.white,
                        width: 150.0,
                      ),
                      CustomButton(
                        onTap: () {},
                        str: 'Capture image',
                        backgroundColor: Colors.grey,
                        borderColor: Colors.transparent,
                        textColor: Colors.white,
                        width: 150.0,
                      ),
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
