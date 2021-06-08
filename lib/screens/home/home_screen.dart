import 'package:flutter/material.dart';
import 'package:flutter_uis/screens/chat/chat_screen.dart';

class HomeScreen extends StatelessWidget {
  final Map<String, dynamic> pages = {
    'Chat UI': ChatScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter UIS',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange[200],
        toolbarHeight: 150,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: pages.length,
        itemBuilder: (BuildContext ctx, index) {
          String key = pages.keys.elementAt(index);
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => pages[key],
              ),
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey, width: 0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 3,
              child: Center(
                child: Text(
                  key,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
