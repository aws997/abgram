// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class Login extends StatefulWidget {
//   const Login({ Key? key }) : super(key: key);

//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login> {

//   // TextEditingController 
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     signin();
//   }

// // FirebaseAuth auth=FirebaseAuth.instance;
// // String? vid;
// //   signin() async {

// //     await auth.verifyPhoneNumber(
// //   phoneNumber: '+9647712894152',
// //   verificationCompleted: (PhoneAuthCredential credential) {   
// //     print(credential);
// //     print("donee");
// //   },
// //   verificationFailed: (FirebaseAuthException e) {
// //     print(e);
// //     print("errorr");
// //   },
// //   codeSent: (String verificationId, int? resendToken) {
// //     // print()
// //     vid=verificationId;
// //   },
// //   codeAutoRetrievalTimeout: (String verificationId) {

// //   },
// // );
// //   }
//   TextEditingController code=TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
// TextField(
//    controller: code,
// ),
// MaterialButton(onPressed: ()async {
  
//     String smsCode = code.text;

//     // Create a PhoneAuthCredential with the code
//     PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: vid!, smsCode: smsCode);

//     // Sign the user in (or link) with the credential
//     await auth.signInWithCredential(credential).then((value) {
//       print(value);
//     });

// },
// child: Text("done"),)
//         ],
//       ),
//     );
//   }
// }