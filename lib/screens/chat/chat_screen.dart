import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String name;
  final String image;
  final String responsibility;
  final bool online;

  const ChatScreen({
    Key? key,
    required this.name,
    required this.image,
    required this.responsibility,
    required this.online,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(
                text: '\n$responsibility',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        toolbarHeight: 80,
        elevation: 2,
        backgroundColor: Colors.blue[100],
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: <Widget>[
                CircleAvatar(backgroundImage: AssetImage(image)),
                Positioned(
                  right: 5,
                  top: 0,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: online ? Colors.green : Colors.red,
                    ),
                    constraints: BoxConstraints(minWidth: 10, minHeight: 10),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Container(),
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          border: Border(top: BorderSide(color: Colors.grey, width: 0.2)),
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: SizedBox(
                height: 60,
                child: TextFormField(
                  textAlign: TextAlign.left,
                  cursorColor: Colors.grey,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  maxLength: 500,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Digite uma mensagem',
                    labelStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.emoji_emotions_outlined,
                      color: Colors.grey,
                    ),
                    counterText: '',
                    errorStyle: TextStyle(height: 1.5),
                  ),
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue[100],
                shape: CircleBorder(),
              ),
              child: Icon(Icons.subdirectory_arrow_right, color: Colors.white),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
