import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'meeting.dart';

class Invite extends StatefulWidget{
  const Invite({Key? key, required this.title}) : super(key: key);
  
  final String title;

  @override
  _InviteState createState() => _InviteState();
}

class _InviteState extends State<Invite> {
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
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => const Meeting(title : 'IT 가이드')),
              );
            },
          ),
        ),
        body: SafeArea(
          child: Container(
            child: ListView(
              children: [
                Container(
                  color: const Color(0XFF242424),
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: _user(),
                ),
                Container(
                color: const Color(0XFF242424),
                height: 600
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