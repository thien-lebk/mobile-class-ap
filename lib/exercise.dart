import 'package:flutter/material.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({Key? key}) : super(key: key);

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Your challenge today', style: TextStyle(fontSize: 20)),
                  ],
                ),
              )  
            ),
            Expanded(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(Color.fromRGBO(38, 38, 38, 70), BlendMode.srcOver),
                    image: NetworkImage('https://dungcutheduc.vn/images/khong-nen-hit-dat-moi-ngay.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Lower-Body Burnout', style: TextStyle(fontSize: 48, color: Colors.white)),
                    Text('20 mins', style: TextStyle(color: Colors.white)),
                    Text('Intermediate', style: TextStyle(color: Colors.white)),
                  ],
                ),
              )
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('All challenges'),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        Container(child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              colorFilter: ColorFilter.mode(Color.fromRGBO(38, 38, 38, 70), BlendMode.srcOver),
                              image: NetworkImage('https://cdn-img.thethao247.vn/upload/thanhtung/2020/01/03/top-5-giay-tap-gym-6.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Running', style: TextStyle(fontSize: 20, color: Colors.white)),
                            Text('20 mins', style: TextStyle(fontSize: 15, color: Colors.white)),
                            Text('Intermediate', style: TextStyle(fontSize: 15, color: Colors.white)),
                          ],
                        )
                        )),
                        Container(child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              colorFilter: ColorFilter.mode(Color.fromRGBO(38, 38, 38, 70), BlendMode.srcOver),
                              image: NetworkImage('https://cdn-img.thethao247.vn/upload/thanhtung/2020/01/03/top-5-giay-tap-gym-6.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Runninf', style: TextStyle(fontSize: 20, color: Colors.white)),
                            Text('20 mins', style: TextStyle(fontSize: 15,color: Colors.white)),
                            Text('Intermediate', style: TextStyle(fontSize: 15,color: Colors.white)),
                          ],
                        )
                        )),
                        Container(child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              colorFilter: ColorFilter.mode(Color.fromRGBO(38, 38, 38, 70), BlendMode.srcOver),
                              image: NetworkImage('https://cdn-img.thethao247.vn/upload/thanhtung/2020/01/03/top-5-giay-tap-gym-6.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Running', style: TextStyle(fontSize: 20, color: Colors.white)),
                            Text('20 mins', style: TextStyle(fontSize: 15,color: Colors.white)),
                            Text('Intermediate', style: TextStyle(fontSize: 15,color: Colors.white)),
                          ],
                        )
                        )),
                        Container(child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              colorFilter: ColorFilter.mode(Color.fromRGBO(38, 38, 38, 70), BlendMode.srcOver),
                              image: NetworkImage('https://cdn-img.thethao247.vn/upload/thanhtung/2020/01/03/top-5-giay-tap-gym-6.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Running', style: TextStyle(fontSize: 20, color: Colors.white)),
                            Text('20 mins', style: TextStyle(fontSize: 15,color: Colors.white)),
                            Text('Intermediate', style: TextStyle(fontSize: 15,color: Colors.white)),
                          ],
                        )
                        )),
                      ],
                    ),
                  )
                ],
              )
            ),
          ],
        ),
      ),
    ));
  }
}
