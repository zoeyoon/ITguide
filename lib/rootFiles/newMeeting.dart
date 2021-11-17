// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'zoom.dart';
import 'meeting.dart';

class NewMeeting extends StatefulWidget {
  const NewMeeting({Key? key, required this.title}) : super(key: key);

  final String title;
  
  @override
  _NewMeetingState createState() => _NewMeetingState();
  
}

class _NewMeetingState extends State<NewMeeting>{
  bool _cam = true;
  bool _iduse = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '새로운 회의',
      home: Scaffold(
        backgroundColor: const Color(0XFF242424),
        appBar: AppBar(
          title: const Text('회의 시작'),
          backgroundColor: const Color(0XFF242424),
          leading: IconButton(
            alignment: Alignment.center,
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => const ZPage(title : 'IT 가이드')),
              );
            },
          )
        ),
        body: SafeArea(
          child: Container(
            color: const Color(0XFF242424),
            child: ListView(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF383838),
                  ),
                  child: _camera(),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF383838),
                  ),
                  child: _id(),
                ),
                Container(
                  height: 30,
                ),
                _startButton(),
                Container (
                  height: 330,
                ),
                FloatingActionButton(
                  onPressed: () => showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) {
                      return AlertDialog(
                        content: const Text(
                          "'회의시작' 버튼을 터치해주세요!",
                          style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('확인'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ]
                      );
                    }),
                  child: Image.asset('images/maru.png')),
              ],
            )
          )
        ),
      )
    );
  }
  
  Widget _camera() {
    return SwitchListTile(
      title: const Text(
        '비디오 켜짐',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        )
      ),
      value: _cam,
      onChanged: (bool value) {
        setState(() {
          _cam = value;
        });
      },
    );
  }
  Widget _id() {
    return SwitchListTile(
      title: const Text(
        '개인 회의 ID(PMI) 사용',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        )
      ),
      value: _iduse,
      onChanged: (bool value) {
        setState(() {
          _iduse = value;
        });
      },
    );
  }

  Widget _startButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 350,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Meeting(title : '회의 화면')),
              );
            },
            child: const Text(
              '회의 시작',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18)
              ),
              primary: const Color(0XFF0d72eb)
            )
          ),
        ),
      ]
    );
  }
}