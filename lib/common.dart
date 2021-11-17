import 'package:flutter/material.dart';
import 'package:phinder/api.dart';
import 'package:phinder/detail.dart';
import 'package:phinder/explore.dart';

class Common extends StatefulWidget {
  final String token;
  const Common({required this.token, Key? key}) : super(key: key);
  @override
  _CommonState createState() => _CommonState();
}

class _CommonState extends State<Common> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUserList(token: widget.token),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError)
            return Center(child: Text('Cannot connect to server!'));
          else {
            if (snapshot.connectionState == ConnectionState.done) {
              print(snapshot.data);
              List<UserInfo> listUser = snapshot.data;
              return PageView.builder(
                  itemCount: listUser.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    print('Index: $index' + ' UserId: ${listUser[index].id}');
                    return PageView(
                      children: [
                        Explore(
                          userInfo: listUser[index],
                        ),
                        Detail(
                          userID: int.parse(listUser[index].id),
                          token: widget.token,
                        ),
                      ],
                    );
                  });
            } else
              return Center(child: CircularProgressIndicator());
          }
        });

    // PageView.builder(
    //     scrollDirection: Axis.vertical,
    //     itemBuilder: (context, index) {
    //       return PageView(
    //         children: [
    //           Explore(),
    //           Detail(),
    //         ],
    //       );
    //     });
  }
}

//!----------------------------------------------
