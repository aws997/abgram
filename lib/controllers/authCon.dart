import 'dart:ffi';

import 'package:abgram/main.dart';
import 'package:abgram/services/auth.dart';
import 'package:get/get.dart';

import '../models/userModel.dart';

class AuthController extends GetxController {

RxString token="".obs;

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
 
  }
AuthService service=AuthService();
  Future<bool> signIn(String email,String password)async{
var res=await service.signIn(email,password);
if(res !=null)
{
 await saveUserData(res['token'], res['id']);
    User user=User.fromJson(res);
return true;

} else {
 return false;

}
  }

  Future saveUserData(String token,String id) async {

    await secStorage.write(key: "token", value: token);
storage.write("userid", id);    
  }
  
}