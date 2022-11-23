import 'package:chat_firebase/domain/controller/controluser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mensajes extends StatefulWidget {
  const Mensajes({super.key});

  @override
  State<Mensajes> createState() => _MensajesState();
}

class _MensajesState extends State<Mensajes> {
  ControlAuthFirebase cu = Get.find();
  Stream<QuerySnapshot> resp_consulta = FirebaseFirestore.instance
      .collection("Chat")
      .orderBy("time", descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: resp_consulta,
        builder:
            (BuildContext context, AsyncSnapshot<QuerySnapshot> respuesta) {
          return ListView.builder(
            itemCount: respuesta.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: (cu.emailf).toString() ==
                        respuesta.data!.docs[index].get("email").toString()
                    ? Colors.greenAccent[100]
                    : Colors.redAccent[100],
                child: ListTile(
                  title: Text(
                    respuesta.data!.docs[index].get("mensaje"),
                    textAlign: (cu.emailf).toString() ==
                            respuesta.data!.docs[index].get("email").toString()
                        ? TextAlign.left
                        : TextAlign.right,
                  ),
                  subtitle: Text(respuesta.data!.docs[index].get("email"),
                      textAlign: (cu.emailf).toString() ==
                              respuesta.data!.docs[index]
                                  .get("email")
                                  .toString()
                          ? TextAlign.left
                          : TextAlign.right),
                ),
              );
            },
          );
        });
  }
}
