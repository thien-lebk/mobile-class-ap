import 'package:flutter/material.dart';
import 'package:phinder/api.dart';
import 'package:phinder/main.dart';

class Detail extends StatefulWidget {
  final int userID;
  final String token;
  const Detail({required this.userID, required this.token, Key? key})
      : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool isVisible = false;
  List<bool> isSelected = [false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    print('Current userID: ' + widget.userID.toString());
    return
        // FutureBuilder(
        //     future: getPost(token: widget.token, userId: widget.userID.toString()),
        //     builder: (BuildContext context, AsyncSnapshot snapshot) {
        //       if (snapshot.hasError)
        //         return Center(child: Text('Cannot connect to server!'));
        //       else {
        //         if (snapshot.connectionState == ConnectionState.done) {
        //           print(snapshot.data);
        //           // List<UserInfo> listUser = snapshot.data;
        //           return Text('------');
        //           // return PageView.builder(
        //           //     itemCount: listUser.length,
        //           //     scrollDirection: Axis.vertical,
        //           //     itemBuilder: (context, index) {
        //           //       print('Index: $index' + ' UserId: ${listUser[index].id}');
        //           //       return PageView(
        //           //         children: [
        //           //           Explore(
        //           //             userInfo: listUser[index],
        //           //           ),
        //           //           Detail(
        //           //             userID: int.parse(listUser[index].id),
        //           //           ),
        //           //         ],
        //           //       );
        //           //     });
        //         } else
        //           return Center(child: CircularProgressIndicator());
        //       }
        //     });

        SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: Container(),
            title: Text('Quỳnh Anh\'s journal'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('01/01/2021',
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  SizedBox(height: 5.0),
                  Center(
                    child: Text(
                      'HIIT Yoga',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                      'Tui đã hoàn thành bài tập hôm nay và tui cảm thấy tự hào :)'),
                  SizedBox(height: 5.0),
                  Row(
                    children: [
                      Expanded(
                        child: Image.network(
                          'https://i1-dulich.vnecdn.net/2021/11/11/3-1636626306.jpg?w=1200&h=0&q=100&dpr=2&fit=crop&s=d-QHSduvv6eASZ-alMmhdQ',
                        ),
                      ),
                      SizedBox(width: 1.0),
                      Expanded(
                          child: Image.network(
                        'https://i1-dulich.vnecdn.net/2021/11/11/1-1636626304.jpg?w=1200&h=0&q=100&dpr=2&fit=crop&s=wnv1riCfvctSV6bQGdcN_Q',
                      )),
                      SizedBox(width: 1.0),
                      Expanded(
                        child: Image.network(
                          'https://i1-dulich.vnecdn.net/2021/11/07/C3-9584-1636298834-4676-1636299490.jpg?w=300&h=180&q=100&dpr=1&fit=crop&s=c0InP1-zplvo_ohd0S1_kQ',
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.blueGrey,
                  ),
                  Text('01/01/2021',
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  SizedBox(height: 5.0),
                  Center(
                    child: Text(
                      'HIIT Yoga',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                      'Tui đã hoàn thành bài tập hôm nay và tui cảm thấy tự hào :)'),
                  SizedBox(height: 5.0),
                  Row(
                    children: [
                      Expanded(
                        child: Image.network(
                          'https://i1-dulich.vnecdn.net/2021/11/11/3-1636626306.jpg?w=1200&h=0&q=100&dpr=2&fit=crop&s=d-QHSduvv6eASZ-alMmhdQ',
                        ),
                      ),
                      SizedBox(width: 1.0),
                      Expanded(
                          child: Image.network(
                        'https://i1-dulich.vnecdn.net/2021/11/11/1-1636626304.jpg?w=1200&h=0&q=100&dpr=2&fit=crop&s=wnv1riCfvctSV6bQGdcN_Q',
                      )),
                      SizedBox(width: 1.0),
                      Expanded(
                        child: Image.network(
                          'https://i1-dulich.vnecdn.net/2021/11/07/C3-9584-1636298834-4676-1636299490.jpg?w=300&h=180&q=100&dpr=1&fit=crop&s=c0InP1-zplvo_ohd0S1_kQ',
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.blueGrey,
                  ),
                  Text('01/01/2021',
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  SizedBox(height: 5.0),
                  Center(
                    child: Text(
                      'HIIT Yoga',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                      'Tui đã hoàn thành bài tập hôm nay và tui cảm thấy tự hào :)'),
                  SizedBox(height: 5.0),
                  Row(
                    children: [
                      Expanded(
                        child: Image.network(
                          'https://i1-dulich.vnecdn.net/2021/11/11/3-1636626306.jpg?w=1200&h=0&q=100&dpr=2&fit=crop&s=d-QHSduvv6eASZ-alMmhdQ',
                        ),
                      ),
                      SizedBox(width: 1.0),
                      Expanded(
                          child: Image.network(
                        'https://i1-dulich.vnecdn.net/2021/11/11/1-1636626304.jpg?w=1200&h=0&q=100&dpr=2&fit=crop&s=wnv1riCfvctSV6bQGdcN_Q',
                      )),
                      SizedBox(width: 1.0),
                      Expanded(
                        child: Image.network(
                          'https://i1-dulich.vnecdn.net/2021/11/07/C3-9584-1636298834-4676-1636299490.jpg?w=300&h=180&q=100&dpr=1&fit=crop&s=c0InP1-zplvo_ohd0S1_kQ',
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.blueGrey,
                  ),
                  Text('01/01/2021',
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  SizedBox(height: 5.0),
                  Center(
                    child: Text(
                      'HIIT Yoga',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                      'Tui đã hoàn thành bài tập hôm nay và tui cảm thấy tự hào :)'),
                  SizedBox(height: 5.0),
                  Row(
                    children: [
                      Expanded(
                        child: Image.network(
                          'https://i1-dulich.vnecdn.net/2021/11/11/3-1636626306.jpg?w=1200&h=0&q=100&dpr=2&fit=crop&s=d-QHSduvv6eASZ-alMmhdQ',
                        ),
                      ),
                      SizedBox(width: 1.0),
                      Expanded(
                          child: Image.network(
                        'https://i1-dulich.vnecdn.net/2021/11/11/1-1636626304.jpg?w=1200&h=0&q=100&dpr=2&fit=crop&s=wnv1riCfvctSV6bQGdcN_Q',
                      )),
                      SizedBox(width: 1.0),
                      Expanded(
                        child: Image.network(
                          'https://i1-dulich.vnecdn.net/2021/11/07/C3-9584-1636298834-4676-1636299490.jpg?w=300&h=180&q=100&dpr=1&fit=crop&s=c0InP1-zplvo_ohd0S1_kQ',
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.blueGrey,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
