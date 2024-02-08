import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pitbiarhive/model/document_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<DocumentModel>> fetchData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('documents').get();

      List<DocumentModel> documents = snapshot.docs.map((doc) {
        return DocumentModel.fromMap(doc.data());
      }).toList();

      return documents;
    } catch (e) {
      print("Error fetching data: $e");
      rethrow;
    }
  }
}
