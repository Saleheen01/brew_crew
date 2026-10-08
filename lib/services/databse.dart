import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String? uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async{
    return await brewCollection.doc(uid).set({
      'name': name,
      'strength': strength,
      'sugars': sugars,
    });

  }

    //get brews collection
    Stream<QuerySnapshot> get brews{
      return brewCollection.snapshots();
    }


}


