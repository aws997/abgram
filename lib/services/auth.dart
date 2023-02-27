import 'dart:convert';

import 'package:abgram/main.dart';
import 'package:abgram/models/userModel.dart';
import 'package:abgram/utils/utils.dart';
import 'package:http/http.dart' as http;
class AuthService {

  Future signIn(String email,String password) async {

    var body={
    "email":email,
    "password":password
  };
http.Response response = await http.post(
  Uri.parse("$host/auth/login",
  ),
  body: jsonEncode(body),
  headers: {
    "Content-Type":"application/json"
  }
);

print(response.body);
if(response.statusCode==200)
{
  var parsedBody=jsonDecode(response.body);
  
  return parsedBody;
}else {

  return;
}
   }
}