import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'invite.dart';
import 'zmenu.dart';


class JMeeting4 extends StatefulWidget{
  const JMeeting4({Key? key, required this.title}) : super(key: key);
  
  final String title;

  @override
  _JMeetingState4 createState() => _JMeetingState4();
  
}

class _JMeetingState4 extends State<JMeeting4> {
  bool selected1 = true;
  bool selected2 = true;
  bool audioCon = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '회의 화면',
      home: Scaffold(
        backgroundColor: const Color(0XFF181414),
        appBar: AppBar(
          title: const Text('Zoom'),
          backgroundColor: const Color(0xFF181414),
          leading: IconButton(
            alignment: Alignment.center,
            icon: const Icon(Icons.cameraswitch_outlined),
            onPressed: () {
            },
          ),
          actions: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  primary: const Color(0xFFEE4019)
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MenuPage(title : '초기 화면')),
                  );
                },
                child: const Text(
                  '종료',
                  style: TextStyle(
                    fontWeight : FontWeight.bold
                  )
                )
              )
            )
          ]
        ),
        body: SafeArea(
          child: ListView(
            children: [
              const SizedBox(
                height: 5 
              ),
              Container(
                height: 520
              ),
              FloatingActionButton(
                onPressed: () => showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) {
                    return AlertDialog(
                      content: const Text(
                        "최고에요! \n이렇게 회의실에 참여하는 \n방법부터 친구를 초대하는 \n방법까지 배워봤어요! \n상단의 '종료' 버튼을 눌러 \n회의를 마치세요! 안녕!",
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
                child: Image.asset('images/maru.png')
              ),
              Container(
                height: 55
              ),
              _buttons(),
              Container(
                height: 20
              ),
              _text(),
            ],
          )
        ) 
      ),
    );
  }

  Widget _buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:<Widget>[
        SizedBox(
          width: 66,
          height: 30,
          child: IconButton(
            icon: Icon( selected2 ? Icons.headset : Icons.headset_off),
            onPressed: () {
              if (audioCon != true){
                _showDialog(context);
              }
              else{
                setState(() {
                  selected2 = !selected2;
                });
              }
            },
            iconSize: 35,
            color: const Color(0xFFa6a6a6),
          )
        ),
        SizedBox(
          width: 66,
          height: 30,
          child: IconButton(
            icon: Icon( selected1 ? Icons.videocam_rounded : Icons.videocam_off_rounded),
            onPressed: () {
              setState(() {
                selected1 = !selected1;
              });
            },
            iconSize: 35,
            color: const Color(0xFFa6a6a6),
          ),
        ),
        SizedBox(
          width: 66,
          height: 30,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.screen_share),
            iconSize: 35,
            color: Colors.green
          )
        ),
        SizedBox(
          width: 66,
          height: 30,
          child: IconButton(
            icon: const Icon(Icons.supervisor_account_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Invite(title : '초대')),
              );
            },
            iconSize: 35,
            color: const Color(0xFFa6a6a6),
          ),
        ),
        SizedBox(
          width: 66,
          height: 30,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz_rounded),
            iconSize: 35,
            color: const Color(0xFFa6a6a6),
          ),
        )
      ],
    );
  }

  Widget _text() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        SizedBox(
          width: 65,
          height: 20,
          child: Text(
            '오디오',
            style: TextStyle(
              color: Color(0xFFa6a6a6),
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: 65,
          height: 20,
          child: Text(
            '비디오',
            style: TextStyle(
              color: Color(0xFFa6a6a6),
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: 65,
          height: 20,
          child: Text(
            '콘텐츠 공유',
            style: TextStyle(
              color: Colors.green,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: 65,
          height: 20,
          child: Text(
            '참가자',
            style: TextStyle(
              color: Color(0xFFa6a6a6),
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: 65,
          height: 20,
          child: Text(
            '더 보기',
            style: TextStyle(
              color: Color(0xFFa6a6a6),
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ]
    );
  }

  _showDialog(BuildContext context){
    showDialog(context: context, builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Column(
            children: const <Widget>[
              Text("다른 사람의 소리를 들으려면 \n 오디오에 연결하십시오"),
            ],
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text("Wifi 또는 휴대전화 데이터"),
              onPressed: () {
                Navigator.of(context).pop();
                audioCon = !audioCon;
                setState(() {
                  selected2 = !selected2;
                });
              },
            ),
            CupertinoDialogAction(
              child: const Text("오디오 없음"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ]
        );
      }
    );       
  }
}


