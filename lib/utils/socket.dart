import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart'  ;

  RxList msgs=[].obs;

 late Socket socket;
socketConnect() async {
  print('tryng');
     socket= io('http://10.0.2.2:5000', OptionBuilder()
      .setTransports(['websocket']) // for Flutter or Dart VM
      .setExtraHeaders({'foo': 'bar'}) // optional
      .build());

   socket.onConnect((data) {
    print('connect ${data}');
    socket.emit('addUser', 'user1');
    socket.on("msg", (data)  {
      print(data);
      msgs.add({"msg":data['msg'],
      "sender":"user2"});
    });
  });
  socket.on("connecting", (data) {
print('connecting');
  });
  
    socket.on("connect_error", (data) {
print('connect_error');
print(data);
  });
    socket.on("error", (data) {
print('error');
  });
}