import 'package:chat_firebase/domain/controller/controluser.dart';
import 'package:chat_firebase/ui/chat/widgetchat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

final mensaje = TextEditingController();
ControlAuthFirebase cu = Get.find();
final fire = FirebaseFirestore.instance;

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((cu.emailf).toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                      controller: mensaje,
                      decoration: const InputDecoration(
                        hintText: "Mensaje Chats",
                      )),
                ),
                IconButton(
                    onPressed: () {
                      fire.collection("Chat").doc().set({
                        "mensaje": mensaje.text,
                        "time": DateTime.now(),
                        "email": cu.emailf
                      });
                      mensaje.clear();
                    },
                    icon: const Icon(Icons.send_outlined))
              ],
            ),
            Container(
              child: const Expanded(child: Mensajes()),
            )
          ],
        ),
      ),
    );
  }
}
