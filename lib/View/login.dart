import 'dart:ui';

import 'package:abgram/controllers/authCon.dart';
import 'package:abgram/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

//      TextInput.finishAutofillContext();

class _LoginState extends State<Login> {

  TextEditingController emailController=  TextEditingController();
  TextEditingController passwordController = TextEditingController();

 bool isLoading=false;
var userid;
bool err=false;
// String errorMessage ="";
GlobalKey<FormState> formKey=GlobalKey();

AuthController controller=Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("t"),
      ),
      body: Center(
        child: SingleChildScrollView(child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              
TextFormField(
    onChanged: ((value) {
    setState(() {
      err=false;
    });
  }),
  controller:emailController,
     autofillHints:const <String> [AutofillHints.email],
keyboardType: TextInputType.emailAddress,
textInputAction: TextInputAction.next,
validator: (s){
  if(s==null || s.isEmpty) { return "Email can't be empty";}
  else if(!GetUtils.isEmail(s)) { return "Please enter a valid email";}
  else return null;

},
  decoration: InputDecoration(
     contentPadding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 12),
    labelText: "Email",
    hintText: "Mark....@gmail.com",
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10)
    ),
    
    prefixIcon: Icon(Icons.alternate_email_rounded)
    // hintText: "Email"
  ),
),
const SizedBox(height: 20,),
TextFormField(
  onChanged: ((value) {
    setState(() {
      err=false;
    });
  }),
  controller:passwordController,
     autofillHints:const <String> [AutofillHints.password],
keyboardType: TextInputType.visiblePassword,
textInputAction: TextInputAction.next,
obscureText: true,
validator: (s){
  if(s==null || s.isEmpty) { return "Password can't be empty";}
  else if(s.length<6) { return "Password length should be 6 or more";}
  else return null;

},
  decoration: InputDecoration(
     contentPadding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 12),
    labelText: "password",
    hintText: "********",
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10)
    ),
    
    prefixIcon: Icon(Icons.password_rounded)
    // hintText: "Email"
  ),
),
const SizedBox(height: 20,),

  AnimatedContainer(
                curve: Curves.elasticOut,
                duration: Duration(milliseconds: 1200),
              child:
               
               InkWell(
                onTap: ()async{
                  setState(() {
  isLoading=true;
});
if(!formKey.currentState!.validate())
{
  //delay to make time to play the animataions
  Future.delayed(Duration(milliseconds: 250)).then((value) {
    setState(() {
    isLoading=false;
    err=true;
  });
  },);
  
return;
}
setState(() {
  isLoading=true;
});

bool success=await controller.signIn(emailController.text,passwordController.text);

if(success){

}else {

}
setState(() {
  isLoading=false;
  err=!success;
});
// Future.delayed(Duration(seconds: 2)).then((value) {
//   setState(() {
//     isLoading=false;
//     err=true;
//   });

//   Future.delayed(Duration(seconds: 2)).then((value) {
//   // setState(() {
//   //   loading=false;
//   //   err=true;
//   // });
//   userid=1;
//   // Navigator.of(context).pushAndRemoveUntil(createRoute(MyTasks()),((route) => false));
  
// });
// });
// setState(() {
//   loading=!loading;
// });
                },
                 child: Center(
                   child:isLoading? SizedBox(
                    height: 25,width: 25,
                     child: CircularProgressIndicator(
                      // valueColor: AlwaysStoppedAnimation(Colors.white),
                     ),
                   ): Text(!err?"Signin":"Something wrong",maxLines: 1,
                   style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                 ),
               )
               ,
               width:isLoading?50: 200,
               height: 35,
              decoration: BoxDecoration(
                boxShadow: [
  //     if(!isLoading)     BoxShadow(
  //   color: Colors.grey.shade600.withOpacity(0.4),
  //   spreadRadius: 0.5,
  //   blurRadius: 5,
  //   offset: const Offset(1, 3),
  // ),
  // if(!loading)   BoxShadow(
  //   color: Colors.grey.shade300,
  //   offset: const Offset(-5,0),
  // )
                ],
                color:isLoading?Colors.transparent:err? Colors.red: primaryBlack,
                borderRadius: BorderRadius.circular(isLoading?100:8)
              ),)

// MaterialButton(onPressed: (){})
            ],),
          ),
        )),
      ),
    );
  }


  
}