import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'jmeeting4.dart';

class Invite2 extends StatefulWidget{
  const Invite2({Key? key, required this.title}) : super(key: key);
  
  final String title;

  @override
  _InviteState2 createState() => _InviteState2();
}

class _InviteState2 extends State<Invite2> {
  @override

  Widget build(BuildContext context){
    return MaterialApp(
      title: '초대',
      home: Scaffold(
        backgroundColor: const Color(0XFF181414),
        appBar: AppBar(
          title: const Text('참가자(1)'),
          backgroundColor: const Color(0XFF242424),
          leading: IconButton(
            alignment: Alignment.center,
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const JMeeting4(title : 'IT 가이드')),
              );
            },
          ),
        ),
        body: SafeArea(
          child: Container(
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: _user(),
                ),
                Container(
                  height: 500
                ),
                FloatingActionButton(
                onPressed: () => showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) {
                    return AlertDialog(
                      content: const Text(
                        "잘했어요! \n이제 복사된 초대 링크를 \n친구들에게 전달하여 친구들과 \n줌 회의를 즐겨봐요! \n상단에 왼쪽으로 향해있는 \n화살표를 눌러 회의실로 \n돌아가요!",
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
                  }
                ),
                child: Image.asset('images/maru.png')
              ),
              Container(
                height: 50
              ),
              _buttons(),
              ],
            )
          )
        )
      )
    );
  }
  Widget _user() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget> [
        SizedBox(
          width: 40,
          height: 40,
          child: Container(
            child: const Icon(
              Icons.person,
              color: Color(0xFFd1e1c2),
              size: 25,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF679f38),
              borderRadius: BorderRadius.circular(12),
            ),
          )
        ),
        SizedBox(
          child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: const Text(
              '홍길동 (호스트, 나)',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )
            )
          )
        ),
        SizedBox(
          child: Container(
            padding: const EdgeInsets.only(left: 105, right: 10),
            child: const Icon(Icons.videocam, color: Color(0xFFffffff)) 
          )
        ),
        const SizedBox(
          child: Icon(Icons.headset, color: Color(0xFFffffff))
        )
      ]
    );
  }
  Widget _buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:<Widget>[
        SizedBox(
          child: Container(
            padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                primary: const Color(0XFF242424)
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context, builder: buildBottomSheet,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor: Color(0xFF242424)
                );
              },
              child: const Text(
                '초대',
                style: TextStyle(fontWeight:FontWeight.bold)
              )
            )
          )
          
        ),
        SizedBox(
          child: Container(
            padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                primary: const Color(0XFF242424)
              ),
              onPressed: () {
              },
              child: const Icon(Icons.more_horiz_rounded)
            )
          ),
        )
      ],
    );
  }
}

Widget buildBottomSheet(BuildContext context) {
  return SizedBox(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
          ListTile(
            title: const Text(
              '이메일 보내기',
              style: TextStyle(color: Colors.white)
            ),
            onTap: () {
              Navigator.pop(context);
            },
            trailing: const Icon(
              Icons.email_outlined,
              color: Colors.white
              ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
          ),
          ListTile(
            title: const Text(
              '메시지 보내기',
              style: TextStyle(color: Colors.white)
            ),
            onTap: () {
              Navigator.pop(context);
            },
            trailing: const Icon(
              Icons.message_outlined,
              color: Colors.white
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
          ),
          ListTile(
            title: const Text(
              '연락처 초대',
              style: TextStyle(color: Colors.white)
            ),
            onTap: () {
              Navigator.pop(context);
            },
            trailing: const Icon(
              Icons.contact_page_outlined,
              color: Colors.white
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
          ),
          ListTile(
            title: const Text(
              '초대 링크 복사',
              style: TextStyle(color: Colors.white)
            ),
            onTap: () {
              Navigator.pop(context);
            },
            trailing: const Icon(
              Icons.content_copy_outlined,
              color: Colors.white
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
          ),
        ],
    )
    
  );
}