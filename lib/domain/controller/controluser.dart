import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ControlAuthFirebase extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final Rx<dynamic> _uid = "".obs;
  final Rx<dynamic> _usuarior = "".obs;
  final Rx<dynamic> _mensajes = "".obs;

  String get emailf => _usuarior.value;
  String get uid => _uid.value;

  Future<void> registrarEmail(String email, String passwd) async {
    try {
      UserCredential usuario = await auth.createUserWithEmailAndPassword(
          email: email, password: passwd);

      print(usuario);

      _uid.value = usuario.user!.uid;
      _usuarior.value = usuario.user!.email;
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        return Future.error('error');
      } else if (e.code == 'email-already-in-use') {
        return Future.error('error 2');
      }
    }
  }
}
