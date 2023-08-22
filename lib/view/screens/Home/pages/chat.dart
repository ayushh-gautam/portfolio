// ignore_for_file: public_member_api_docs, sort_constructors_first, no_logic_in_create_state
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:portfolio/elements/myText.dart';
import 'package:portfolio/view/screens/Home/pages/chats/chatService.dart';
import 'package:portfolio/view/screens/loginScreen/elements/textField.dart';

class ChatPage extends StatefulWidget {
  String recieverEmail;
  String recieverUsername;
  String? recieverphotoUrl;
  ChatPage(
      {Key? key,
      required this.recieverEmail,
      required this.recieverUsername,
      required this.recieverphotoUrl})
      : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState(
      recieverEmail: recieverEmail,
      recieverphotoUrl: recieverphotoUrl,
      recieverUsername: recieverUsername);
}

class _ChatPageState extends State<ChatPage> {
  String recieverEmail;
  String? recieverUsername;
  String? recieverphotoUrl;
  TextEditingController messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  _ChatPageState(
      {required this.recieverUsername,
      required this.recieverphotoUrl,
      required this.recieverEmail});

  void sendMessage1() async {
    if (messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.recieverEmail, messageController.text);

      // clear the controller after sending the message
      print('hello');
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: (recieverphotoUrl == '')
                    ? Image.asset(
                        'lib/assets/images/person.png',
                        height: 50,
                      )
                    : Image.network(
                        recieverphotoUrl!,
                        height: 50,
                      ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(recieverUsername!)
            ],
          ),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Expanded(
              child: _buildMessageList(),
            ),
            _buildMessageInput()
          ],
        ));
  }
  // build message list

  Widget _buildMessageList() {
    return StreamBuilder(
        stream: _chatService.getMessages(
            widget.recieverEmail, _firebaseAuth.currentUser!.email.toString()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return MyText(
                text: 'Error' + snapshot.error.toString(),
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.normal);
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MyText(
                text: 'loadingg...',
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.normal);
          }

          return ListView(
            children: snapshot.data!.docs
                .map((document) => _buildMessageItem(document))
                .toList(),
          );
        });
  }

  // build messsge  item
  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    // align the messages to the right if the sender is the current id and left if the receiver id and vice versa
    var alignment = (data['senderEmail'] == _firebaseAuth.currentUser!.email)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Column(
        children: [
          Text(
            data['senderEmail'],
            style: TextStyle(color: Colors.black),
          ),
          Text(data['message'], style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
  // build message input

  Widget _buildMessageInput() {
    return Row(
      children: [
        Expanded(
          child: MyTextField(
              controller: messageController,
              text: 'Type Here...',
              top: 0,
              right: 0,
              left: 0,
              obscureText: false),
        ),
        IconButton(
            onPressed: () {
              sendMessage1();
            },
            icon: Icon(Icons.arrow_upward))
      ],
    );
  }
}
