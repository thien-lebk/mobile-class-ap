import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phinder/api.dart';
import 'package:phinder/main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class Step3 extends StatefulWidget {
  final String fullName;
  final String aboutYou;
  final String dob;
  final List<int> hobbies;
  final String token;
  const Step3(
      {required this.fullName,
      required this.aboutYou,
      required this.dob,
      required this.hobbies,
      required this.token,
      Key? key})
      : super(key: key);

  @override
  _Step3State createState() => _Step3State();
}

class _Step3State extends State<Step3> {
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
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(80.0),
              child: AppBar(
                  elevation: 0,
                  iconTheme: IconThemeData(color: Colors.black),
                  flexibleSpace: Row(
                    children: [
                      Expanded(
                          child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Step 3 of 3\nUpload your image',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500))),
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
                  Expanded(
                      child: Container(
                    width: double.infinity,
                    child: Center(
                        child: !_fileSelected
                            ? Text('Chose an image to display!')
                            : Image.file(_localFile)),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: !_fileSelected
                                ? Colors.grey
                                : Colors.transparent)),
                  )),
                  CustomButton(
                    onTap: () async {
                      if (_fileSelected == false) {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.WARNING,
                          animType: AnimType.BOTTOMSLIDE,
                          headerAnimationLoop: false,
                          title: "Note",
                          desc: "Please chose an image !",
                          btnCancelColor: Colors.red,
                          btnCancelOnPress: () {},
                          btnCancelText: 'Close',
                        ).show();
                      } else {
                        int resCode = await updateUser(
                            token: widget.token,
                            fullName: widget.fullName,
                            aboutYou: widget.aboutYou,
                            dob: widget.dob,
                            hobbies: widget.hobbies);
                        print(resCode);
                        if (resCode != 200) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.WARNING,
                            animType: AnimType.BOTTOMSLIDE,
                            headerAnimationLoop: false,
                            title: "Note",
                            desc: "Update error !",
                            btnCancelColor: Colors.red,
                            btnCancelOnPress: () {},
                            btnCancelText: 'Close',
                          ).show();
                        }
                        await uploadImage(
                            toUploadFile: _localFile, token: widget.token);

                        Navigator.pushNamed(context, '/finish');
                      }
                    },
                    str: 'Done',
                    backgroundColor: Colors.black87,
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
