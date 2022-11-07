import 'dart:io';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:merchant/firebase_options.dart';

class FirebaseMethods {
  static googleSignIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    if (Platform.isIOS) {
      googleSignIn = GoogleSignIn(clientId: DefaultFirebaseOptions.currentPlatform.iosClientId);
    }
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      
    }
  }

  static facebookLogin() async {
    final LoginResult result = await FacebookAuth.instance.login(
      permissions: ['email', 'public_profile'],
    );
    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;
      final userData = await FacebookAuth.instance.getUserData();
      print(accessToken.token);
      print(userData);
      //Get.to(() => DashBoard());
    } else {
      print(result.status);
      print(result.message);
    }
  }
}

//   static final CollectionReference _userCollection =
//       _firestore.collection(USERS_COLLECTION);

//   static final Firestore _firestore = Firestore.instance;

//   StorageReference _storageReference;

//   //user class
//   User user = User();

//   Future<FirebaseUser> getCurrentUser() async {
//     FirebaseUser currentUser;
//     currentUser = await _auth.currentUser();
//     return currentUser;
//   }

//   Future<User> getUserDetails() async {
//     FirebaseUser currentUser = await getCurrentUser();

//     DocumentSnapshot documentSnapshot =
//         await _userCollection.document(currentUser.uid).get();

//     return User.fromMap(documentSnapshot.data);
//   }


//   Future<bool> authenticateUser(FirebaseUser user) async {
//     QuerySnapshot result = await firestore
//         .collection(USERS_COLLECTION)
//         .where(EMAIL_FIELD, isEqualTo: user.email)
//         .getDocuments();

//     final List<DocumentSnapshot> docs = result.documents;

//     //if user is registered then length of list > 0 or else less than 0
//     return docs.length == 0 ? true : false;
//   }

//   Future<void> addDataToDb(FirebaseUser currentUser) async {
//     String username = Utils.getUsername(currentUser.email);

//     user = User(
//         uid: currentUser.uid,
//         email: currentUser.email,
//         name: currentUser.displayName,
//         profilePhoto: currentUser.photoUrl,
//         username: username);

//     firestore
//         .collection(USERS_COLLECTION)
//         .document(currentUser.uid)
//         .setData(user.toMap(user));
//   }

//   Future<void> signOut() async {
//     await _googleSignIn.signOut();
//     return await _auth.signOut();
//   }

//   Future<List<User>> fetchAllUsers(FirebaseUser currentUser) async {
//     List<User> userList = List<User>();

//     QuerySnapshot querySnapshot =
//         await firestore.collection(USERS_COLLECTION).getDocuments();
//     for (var i = 0; i < querySnapshot.documents.length; i++) {
//       if (querySnapshot.documents[i].documentID != currentUser.uid) {
//         userList.add(User.fromMap(querySnapshot.documents[i].data));
//       }
//     }
//     return userList;
//   }

//   Future<void> addMessageToDb(
//       Message message, User sender, User receiver) async {
//     var map = message.toMap();

//     await firestore
//         .collection(MESSAGES_COLLECTION)
//         .document(message.senderId)
//         .collection(message.receiverId)
//         .add(map);

//     return await firestore
//         .collection(MESSAGES_COLLECTION)
//         .document(message.receiverId)
//         .collection(message.senderId)
//         .add(map);
//   }

//   Future<String> uploadImageToStorage(File imageFile) async {
//     // mention try catch later on

//     try {
//       _storageReference = FirebaseStorage.instance
//           .ref()
//           .child('${DateTime.now().millisecondsSinceEpoch}');
//       StorageUploadTask storageUploadTask =
//           _storageReference.putFile(imageFile);
//       var url = await (await storageUploadTask.onComplete).ref.getDownloadURL();
//       // print(url);
//       return url;
//     } catch (e) {
//       return null;
//     }
//   }

//   void setImageMsg(String url, String receiverId, String senderId) async {
//     Message message;

//     message = Message.imageMessage(
//         message: "IMAGE",
//         receiverId: receiverId,
//         senderId: senderId,
//         photoUrl: url,
//         timestamp: Timestamp.now(),
//         type: 'image');

//     // create imagemap
//     var map = message.toImageMap();

//     // var map = Map<String, dynamic>();
//     await firestore
//         .collection(MESSAGES_COLLECTION)
//         .document(message.senderId)
//         .collection(message.receiverId)
//         .add(map);

//     firestore
//         .collection(MESSAGES_COLLECTION)
//         .document(message.receiverId)
//         .collection(message.senderId)
//         .add(map);
//   }

//   void uploadImage(File image, String receiverId, String senderId,
//       ImageUploadProvider imageUploadProvider) async {
//     // Set some loading value to db and show it to user
//     imageUploadProvider.setToLoading();

//     // Get url from the image bucket
//     String url = await uploadImageToStorage(image);

//     // Hide loading
//     imageUploadProvider.setToIdle();

//     setImageMsg(url, receiverId, senderId);
//   }
// }