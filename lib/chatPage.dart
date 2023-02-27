import 'package:abgram/utils/socket.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({ Key? key }) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController messagecon=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: []),
      body: Column(
        children: [
Expanded(child: Obx(()=>ListView(

  children: [
   ...msgs.value.map((e) {
    bool our=e['sender']=="user1";
      return Align(
        alignment:our? Alignment.topRight
        :Alignment.topLeft,
        child: Container(
          decoration: BoxDecoration(
            color: our?Colors.green:Colors.grey,
            borderRadius: 
          BorderRadius.only(
            topLeft: Radius.circular(12),
             topRight: Radius.circular(12),
              bottomLeft: Radius.circular(!our?0:12),
               bottomRight: Radius.circular(our?0:12)
          )),
          margin: const EdgeInsets.all(3),
          padding: const EdgeInsets.all(6),
          
          child: Text('${e?['msg']}')),
      );
    }).toList()
  ],)) 
  ),
Padding(
  padding: const EdgeInsets.all(8.0),
  child:   TextField(
    controller: messagecon,
    onChanged: (s){
      setState(() {
        
      });
    },
    decoration: InputDecoration(
      hintText: "Message",
      suffixIcon: IconButton(icon: Icon(Icons.send),
      onPressed:messagecon.text.isEmpty?null:
       (){
socket.emit("msg",{
"receiver":"user2",
"msg":"${messagecon.text}"
});
msgs.add({"msg":messagecon.text,
"sender":"user1"});
messagecon.clear();
      },)
    ),
  ),
)
        ],
      ),
    );
  }
}