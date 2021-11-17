import 'package:flutter/material.dart';
import 'zmenu.dart';
import 'participate.dart';

class ZPage2 extends StatefulWidget {
  const ZPage2({Key? key, required this.title}) : super(key: key);
  
  final String title;

  @override
  _ZPageState2 createState() => _ZPageState2();
}

class _ZPageState2 extends State<ZPage2>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '초기 화면',
      color: const Color(0XFF242424),
      home: Scaffold(
        backgroundColor: const Color(0XFF242424),
        appBar: AppBar(
          title: const Text('회의 및 채팅'),
          backgroundColor: const Color(0XFF242424),
          leading: IconButton(
            alignment: Alignment.center,
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => const MenuPage(title : 'IT 가이드')),
              );
            },
          ),
        ),
        body: SafeArea(
          child: Container(
            color: const Color(0XFF242424),
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: ListView(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  height: 35,
                  decoration: BoxDecoration(
                      color: const Color(0xFF38383a),
                      borderRadius: BorderRadius.circular(12.5)),
                  child: TextField(
                    style: const TextStyle(
                      color: Color(0xFFffffff)
                    ),
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: const Color(0xFFffffff),
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: const Color(0xFFffffff).withOpacity(0.5),
                        ),
                        hintText: "검색",
                        hintStyle: const TextStyle(fontSize: 15.2, color: Color(0xFF979797)),
                        border: InputBorder.none),
                  ),
                ),
                Container(
                  height: 30,
                ),
                _buttons(),
                Container(
                  height: 10,
                ),
                _text(),
                Container(
                  height: 20,
                ),
                _user(),
                Container (
                  height: 270,
                ),
                FloatingActionButton(
                onPressed: () => showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) {
                    return AlertDialog(
                      content: const Text(
                        "안녕! 마루에요! \n 이번엔 회의와 참여하는 방법 \n그리고 친구를 초대하는 방법을 배워볼거에요! \n먼저, 진행되고 있는 회의에 참여하기 위해 상단의 '참가' 버튼을 터치해주세요!",
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
            ),
          )
        ),
        bottomNavigationBar: BottomNavigationBar( 
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFF1a1a1a),
          selectedItemColor: const Color(0xFFf5f5f5), //선택된 아이템의 색상
          unselectedItemColor: const Color(0xFFf5f5f5).withOpacity(.60),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_rounded),
              label: ('회의 및 채팅'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time),
              label: ('회의'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_page_rounded),
              label: ('연락처'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: ('설정'),
            ),
          ],
        ),
      )
    );
  }

  Widget _buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:<Widget>[
        SizedBox(
          width: 66,
          height: 66,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              primary: const Color(0XFFfe742e)
            ),
            onPressed: () {},
            child: const Icon(
              Icons.camera_indoor,
              size: 35
              )
          ),
        ),
        SizedBox(
          width: 66,
          height: 66,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              primary: const Color(0XFF0d72eb)
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Participate(title : '회의 참여')),
              );
            },
            child: const Icon(
              Icons.add_box_rounded,
              size: 35
              )
          ),
        ),
        SizedBox(
          width: 66,
          height: 66,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              primary: const Color(0XFF0d72eb)
            ),
            onPressed: () {
            },
            child: const Icon(
              Icons.calendar_today_rounded,
              size: 35
              )
          )
        ),
        SizedBox(
          width: 66,
          height: 66,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              primary: const Color(0XFF0d72eb)
            ),
            onPressed: () {
            },
            child: const Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.screen_share,
                size: 35
              )
            ) 
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
            '새 회의',
            style: TextStyle(
              color: Color(0xFF979797),
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: 65,
          height: 20,
          child: Text(
            '참가',
            style: TextStyle(
              color: Color(0xFF979797),
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: 65,
          height: 20,
          child: Text(
            '예약',
            style: TextStyle(
              color: Color(0xFF979797),
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: 65,
          height: 20,
          child: Text(
            '공유',
            style: TextStyle(
              color: Color(0xFF979797),
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ]
    );
  }

  Widget _user() {
    return ListTile(
      contentPadding: const EdgeInsets.only(),
      leading: SizedBox(
        width: 50,
        height: 50,
        child: Container(
          child: const Icon(
            Icons.person,
            color: Color(0xFFd1e1c2),
            size: 40,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF679f38),
            borderRadius: BorderRadius.circular(15.5),
          ),
        ),  
      ),
      title: const Text(
        '홍길동 (나)',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        )
      ),
    );
  }
}
