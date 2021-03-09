import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';





Future<bool> signIn(String email, String password) async{
  try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch(e){
    print(e);
    return false;
  }
}
Future<bool> register(String email, String password) async{
  try{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    return true;
  }on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
    return false;
  } catch (e) {
    print(e);
    return false;
  }
}
Future <bool> SaveToFirebase(String email,String name) async {
  try{
    String uid = FirebaseAuth.instance.currentUser.uid;
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid).collection('Profile').doc(name);

    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      if(!snapshot.exists){
        documentReference.set({"Email": email,
        "Name":name,
        });
        return true;
      }
      //transaction.update(documentReference, {'Amount': email});
      return true;
    });
  } catch(e){
    return false;
  }
}