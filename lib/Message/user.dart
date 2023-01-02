import 'package:flutter/material.dart';
import '../Encrypt/encrypt.dart';
import '../Decrypt/decrypt.dart';

class User extends StatefulWidget{
   const User({
    super.key,
    required this.action,
});

  final String action;

  @override
  UserState createState() => UserState(action: this.action);
}

class UserState extends State<User>{
  UserState({
    required this.action,
});

  final String action;
  TextEditingController message = TextEditingController(text: "");
  TextEditingController result = TextEditingController(text: "");
  Encrypt encryptMessage = Encrypt();
  Decrypt decryptMessage = Decrypt();
  bool encrypted = false;
  bool decrypted = false;
  String encryptedResult = "";

  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor:  Colors.deepPurpleAccent,
      body: Column(
        children: [
          Expanded(
      child: Column(
          children : [
          // Banner
          Image.asset("assets/icon/banner_message.png"),
        const SizedBox(height: 20,),

        // Show choosed mode
        Row(
          children: [
            const Spacer(),
            const Text("Choosed Mode : ", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
            Text(action, style: const TextStyle(color: Colors.white, fontSize: 25),),
            const Spacer(),
          ],
        ),
            SizedBox(height: 50,),
            if (encrypted || decrypted)
              Column(
                children: [
                  const Text("Result", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                  const SizedBox(height: 20,),
                  ClipRRect(
                    child : TextField(
                      textAlign: TextAlign.center,
                      controller: result,
                      decoration: const InputDecoration(
                        filled:  true,
                        fillColor: Colors.white,
                      ),
                      maxLines: null,
                    ),
                  ),
                ],
              ),
            ]
      )
          ),

          // Result
          // Only show after encryption


          // TextInput
              InkWell(
            child: Row(
            children : [
              const Spacer(),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                child : SizedBox(
                  width: 300,
                    child : InkWell (
                      onTap: (){
                        // After the user entered a message
                        // Let choose encryption hardness



                      },
                      child : TextField(
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          backgroundColor: Colors.transparent,
                          color: Colors.black
                      ),
                      decoration: const InputDecoration(
                          hintText: "Write a message...",
                          hintStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      controller: message ,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                    ),
                    ),
                  ),
              ),
              IconButton(
                onPressed: (){
                  setState(() {
                  });
                  if (action == "Encrypt"){
                    setState(() async {
                       result.text = await encryptMessage.encryptMessage(message.text);
                       if (result.text.isNotEmpty)
                       encrypted = true;
                    });
                  } else if (action == "Decrypt"){
                    setState(() async  {
                      result.text = await decryptMessage.decryptMessage(message.text);
                      if (result.text.isNotEmpty)
                        decrypted = true;
                        encrypted = false;
                    });
                  }
                }, icon: const Icon(Icons.send_rounded, size: 40,), color: Colors.blueAccent,),
              const Spacer(),
              ]
          )
          ),
          const SizedBox(height: 20,),
        ],
      )
    );
  }
}