import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/widgets/custom_chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//ignore: must_be_immutable
class ChatScreen extends StatelessWidget {
  static String id = 'Chat Screen';

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessageCollection);
  TextEditingController textController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessagesModel> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(MessagesModel.fromJson(snapshot.data!.docs[i]));
          }
          //print(snapshot.data!.docs[0][kMessage]);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: kPrimaryColor,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    kLogo,
                    height: 55,
                  ),
                  const Text(
                    'Chat',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: scrollController,
                    physics: const BouncingScrollPhysics(),
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return messagesList[index].id == email
                          ? CustomChatBubble(
                              messagesModel: messagesList[index],
                            )
                          : CustomChatBubbleForFriend(
                              messagesModel: messagesList[index]);
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextField(
                    controller: textController,
                    onSubmitted: (data) {
                      messages.add({
                        kMessage: data,
                        kCreatedAt: DateTime.now(),
                        'id': email,
                      });
                      textController.clear();
                      scrollController.animateTo(
                        0, //scrollController.position.maxScrollExtent,
                        duration: Duration(
                          milliseconds: 500,
                        ),
                        curve: Curves.easeIn,
                      );
                    },
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.send, color: kPrimaryColor),
                      hintText: 'Send Message',
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: kPrimaryColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Scaffold(body: CircularProgressIndicator());
        }
      },
    );
  }
}
