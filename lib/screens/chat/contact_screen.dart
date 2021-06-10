import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'models/contact_model.dart';

class ContactScreen extends StatelessWidget {
  final List<ContactModel> contacts = [
    ContactModel(
      name: 'Vitor',
      image: 'assets/images/chat/profile_2.jpg',
      responsibility: 'Desenvolvedor Mobile',
      online: true,
    ),
    ContactModel(
      name: 'Karina',
      image: 'assets/images/chat/profile_1.jpg',
      responsibility: 'Gerente de Projetos',
      online: false,
    ),
    ContactModel(
      name: 'Juliana',
      image: 'assets/images/chat/profile_5.jpg',
      responsibility: 'Desenvolvedora Front-End',
      online: true,
    ),
    ContactModel(
      name: 'Pedro',
      image: 'assets/images/chat/profile_4.jpg',
      responsibility: 'Suporte',
      online: false,
    ),
    ContactModel(
      name: 'Rodrigo',
      image: 'assets/images/chat/profile_3.jpg',
      responsibility: 'Estagiario',
      online: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat', style: TextStyle(fontSize: 25)),
        backgroundColor: Colors.blue[100],
        toolbarHeight: 150,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white70,
              border: Border.all(color: Colors.grey, width: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 100,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(5),
                        child: Icon(Icons.add),
                      ),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.all(10),
                          itemCount: contacts.length,
                          itemBuilder: (BuildContext context, int index) {
                            ContactModel item = contacts[index];

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(item.image),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 15),
                  child: Row(
                    children: [
                      Text(
                        "Todos",
                        style: TextStyle(
                          color: Colors.blue[100],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text("Familia"),
                      const SizedBox(width: 20),
                      Text("Escola"),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (BuildContext context, int index) {
                ContactModel item = contacts[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(item.image),
                  ),
                  title: Text(item.name),
                  subtitle: Text(item.responsibility),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(
                        name: item.name,
                        image: item.image,
                        responsibility: item.responsibility,
                        online: item.online,
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
