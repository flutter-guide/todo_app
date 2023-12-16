import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/domain/models/todo.dart';

class TodoApi {
  Stream<QuerySnapshot<Map<String, dynamic>>> fetchTodos() {
    return FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }

  Future<bool> createTodo(Map<String, dynamic> todoMap) async {
    try{
      await FirebaseFirestore.instance
          .collection(FirebaseAuth.instance.currentUser!.uid)
          .doc()
          .set(
        todoMap,
      );
      return true;
    }catch(e){
      return false;
    }
  }

  Future<bool> toggleDone(String id) async {
    var documentReference = FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.uid)
        .doc(id);
    final res = await documentReference.get().then<bool>((documentSnapshot) {
      if (documentSnapshot.exists) {
        bool currentValue = documentSnapshot.data()?['done'] ?? false;
        documentReference.update({'done': !currentValue});
        return !currentValue;
      }
      return false;
    });
    return res;
  }
}
