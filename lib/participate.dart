import 'package:flutter/material.dart';
import 'zmenu.dart';
import 'meeting.dart';

class Participate extends StatefulWidget {
  const Participate({Key? key, required this.title}) : super(key: key);
  
  final String title;
  
  @override
  _ParticipateState createState() => _ParticipateState();
}

class _ParticipateState extends State<Participate> {
  bool _audio = false;
  bool _cam = false;
  @override

   Widget build(BuildContext context){
     return MaterialApp(
       title: '회의 참가',
      home: Scaffold(
        backgroundColor: const Color(0XFF242424),
        appBar: AppBar(
          title: const Text('회의 참가'),
          backgroundColor: const Color(0XFF242424),
          leading: IconButton(
            alignment: Alignment.center,
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => const MenuPage(title : 'IT 가이드')),
              );
            }
          )
        ),
        body: SafeArea(
          child: Container(
            color: const Color(0XFF242424),
            child: ListView(
              children: [
                Container(
                  width: double.infinity,
                  height: 45,
                  decoration: const BoxDecoration(
                    color: Color(0xFF38383a),
                  ),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: const Color(0xFFffffff),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: const Color(0xFFffffff).withOpacity(0.5),
                      ),
                      hintText: "회의 ID",
                      hintStyle: const TextStyle(
                        fontSize: 15.2, 
                        color: Color(0xFFffffff),
                      ),
                      border: InputBorder.none),
                  ), 
                ),
                Container(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                  child: Center(
                    child: Text(
                      '개인 링크 이름으로 참가',
                      style: TextStyle(
                        color: Colors.blue,
                      )
                    ),
                  )
                ),
                Container(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  height: 45,
                  decoration: const BoxDecoration(
                    color: Color(0xFF38383a),
                  ),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: const Color(0xFFffffff),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: const Color(0xFFffffff).withOpacity(0.5),
                      ),
                      hintText: "회의 ID",
                      hintStyle: const TextStyle(
                        fontSize: 15.2, 
                        color: Color(0xFFffffff),
                      ),
                      border: InputBorder.none
                    ),
                  ), 
                ),
                Container(
                  height: 15,
                ),
                _startButton(),
                Container(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: const SizedBox(
                    height: 20,
                    child: Text(
                      '초대 링크를 받았다면 다시 링크를 탭하여 회의에 참가하십시오',
                      style: TextStyle(
                        color: Color(0xFF979797),
                      )
                    ),
                  ),
                ),
                Container(
                  height: 20
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: const SizedBox(
                    height: 20,
                    child: Text(
                      '참가 옵션',
                      style: TextStyle(
                        color: Color(0xFF979797),
                      )
                    ),
                  ),
                ),
                Container(
                  height: 10
                ),
                Container(
                  height: 50,
                  alignment: const Alignment(0.0,0.0),
                  decoration: const BoxDecoration(
                    color: Color(0xFF383838),
                    border: Border(
                      top: BorderSide(width: 0.3, color: Color(0xFFa6a6a6)),
                      bottom: BorderSide(width: 0.3, color: Color(0xFFa6a6a6))
                    )
                  ),
                  child: _audioOff(),
                ),
                Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color(0xFF383838),
                    border: Border(
                      bottom: BorderSide(width: 0.3, color: Color(0xFFa6a6a6))
                    )
                  ),
                  child: _camOff(),
                ),
              ],
            )
          )
        )
      ),
    );
  }

  Widget _startButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 360,
          height: 45,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Meeting(title : '회의 화면')),
              );
            },
            child: const Text(
              '참가',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17)
              ),
              primary: const Color(0XFF0d72eb)
            )
          ),
        ),
      ],
    );
  }
  Widget _audioOff() {
    return SwitchListTile(
      title: const Text(
        '오디오에 연결하지 않음',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ), 
      ),
      value: _audio,
      onChanged: (bool value) {
        setState(() {
          _audio = value;
        });
      },
    );
  }
  Widget _camOff() {
    return SwitchListTile(
      title: const Text(
        '내 비디오 끄기',
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
}