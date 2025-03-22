import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_list/model/todo_model.dart';

class DatabaseService {
  final CollectionReference todoCollection =
      FirebaseFirestore.instance.collection("todos");
  User? user = FirebaseAuth.instance.currentUser;

  Future<DocumentReference> addTodoItem(String title) async {
    return await todoCollection.add({
      'uid': user!.uid,
      'title': title,
      'completed': false,
    });
  }

  Future<void> updatetodo(String id, String title) async {
    final updateToCollection =
        FirebaseFirestore.instance.collection("todos").doc(id);
    await updateToCollection.update({
      'title': title,
    });
  }

  Future<void> updatestatustodo(String id, bool completed) async {
    print("تحديث حالة المهمة: $id إلى $completed");
    await FirebaseFirestore.instance.collection("todos").doc(id).update({
      'completed': completed,
    });
  }

  Future<void> delettodotask(String id) async {
    print("حذف المهمة: $id");
    await FirebaseFirestore.instance.collection("todos").doc(id).delete();
  }

  Stream<List<Todo>> get todos {
    return todoCollection
        .where('uid', isEqualTo: user!.uid)
        .snapshots()
        .map(todoListFromSnapshot);
  }

  // جلب المهام غير المكتملة فقط
  Stream<List<Todo>> get pendingTodos {
    return todoCollection
        .where('uid', isEqualTo: user!.uid)
        .where('completed', isEqualTo: false)
        .snapshots()
        .map(todoListFromSnapshot);
  }

  Stream<List<Todo>> get completedTodos {
    return todoCollection
        .where('uid', isEqualTo: user!.uid)
        .where('completed', isEqualTo: true)
        .snapshots()
        .map(todoListFromSnapshot);
  }

  List<Todo> todoListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Todo(
        id: doc.id,
        title: doc['title'] ?? '',
        completed: doc['completed'] ?? false,
      );
    }).toList();
  }
}
