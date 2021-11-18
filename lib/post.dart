import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phinder/api.dart';
import 'package:phinder/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  bool isVisible = false;
  String routine = "";
  String mind = "";

  bool _fileSelected = false;
  late File _localFile;

  Future _browseImage() async {
    FilePickerResult? _browsedImage = await FilePicker.platform.pickFiles(
        // type: FileType.custom, allowedExtensions: ['jpg', 'png', 'bmp']);
        type: FileType.image);
    if (_browsedImage != null) {
      setState(() {
        _fileSelected = true;

        _localFile = File(_browsedImage.files.single.path!);
      });
    }
  }

  Future _captureImage() async {
    final _pickedImage = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 25);
    if (_pickedImage != null) {
      setState(() {
        _fileSelected = true;
        _localFile = File(_pickedImage.path);
        print('size: ');
        print(_localFile.lengthSync());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ROUTINE',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                      height: 40.0,
                      child: TextField(
                          onChanged: (val) {
                            routine = val;
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 2.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0))))),
                  SizedBox(height: 20.0),
                  Text(
                    'WHAT\'S ON YOUR MIND?',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                      height: 100.0,
                      child: TextField(
                          onChanged: (val) {
                            mind = val;
                          },
                          keyboardType: TextInputType.multiline,
                          minLines: 5,
                          maxLines: 5,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 2.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))))),
                  SizedBox(height: 20.0),
                  Container(
                    height: 50.0,
                    child: Row(
                      children: [
                        Expanded(
                            child: InkWell(
                                onTap: () {
                                  _browseImage();
                                },
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
                                onTap: () async {
                                  await _captureImage();
                                },
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
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    height: 200,
                    child: Center(
                        child: !_fileSelected
                            ? Text('Choose an image to display')
                            : Image.file(_localFile)),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: !_fileSelected
                                ? Colors.grey
                                : Colors.transparent)),
                  ),
                  // Expanded(
                  //     child: Container(

                  //   child: Center(
                  //       // child: !_fileSelected
                  //       //     ? Text('Chose an image to display!')
                  //       //     : Image.file(_localFile)),
                  //       child: Text('abc')),
                  //   decoration: BoxDecoration(
                  //       border: Border.all(
                  //           color: !_fileSelected
                  //               ? Colors.grey
                  //               : Colors.transparent)),
                  // )),
                  CustomButton(
                    onTap: () async {
                      print('Routine: $routine');
                      print('Your mind: $mind');
                      if (routine.length == 0) {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.WARNING,
                          animType: AnimType.BOTTOMSLIDE,
                          headerAnimationLoop: false,
                          title: "Note",
                          desc: "Please input your routine !",
                          btnCancelColor: Colors.red,
                          btnCancelOnPress: () {},
                          btnCancelText: 'Close',
                        ).show();
                      } else {
                        
                      }
                    },
                    //   else {
                    //     SharedPreferences prefs =
                    //         await SharedPreferences.getInstance();
                    //     String token = prefs.getString('token') ?? "*";
                    //     List<UserHobby> lUserHoppy =
                    //         await getHoppy(token: token);
                    //     // await Navigator.push(
                    //     //     context,
                    //     //     MaterialPageRoute(
                    //     //         builder: (context) => Post(
                    //     //               routine: routine,
                    //     //               mind: mind,
                    //     //               token: token,
                    //     //             )));
                    //   }
                    // },
                    str: 'Share',
                    backgroundColor:
                        _fileSelected ? Colors.black87 : Colors.grey,
                    borderColor: Colors.transparent,
                    textColor: Colors.white,
                    width: double.infinity,
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
