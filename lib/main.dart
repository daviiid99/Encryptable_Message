import 'package:flutter/material.dart';
import '../Message/user.dart';

void main() => runApp(const MaterialApp(home: EncryptableMessage(),));


class EncryptableMessage extends StatefulWidget{
  const EncryptableMessage({
  super.key,
});

  @override
  EncryptableMessageState createState() => EncryptableMessageState();
}

class EncryptableMessageState extends State<EncryptableMessage>{

  List<String> menuOptionsTitle = ["Encrypt Message", "Decrypt Message"]; // Button Option
  List<IconData> menuOptionsIcon = [Icons.enhanced_encryption_rounded, Icons.no_encryption_rounded]; // Button icon

  disclaimerDialog(BuildContext context) async {
     showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            backgroundColor: Colors.transparent,
            content: SizedBox(
              height: 400,
              child : ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(24),
                  topLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                  bottomLeft: Radius.circular(24),
                ),
                child : ColoredBox(
                    color: Colors.redAccent,
                    child : Column(
                      children: const [
                        SizedBox(height: 20,),
                        Align(
                            alignment : Alignment.center,
                            child : Text("<<< DISCLAIMER >>>", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),)),
                        SizedBox(height: 20,),
                        Align(
                            alignment : Alignment.center,
                            child : Text("This program is provided with no guarantee, I'm not responsible for broken devices. If you tell me anything I'll joke on you!", style: TextStyle(color: Colors.white, fontSize: 20),)),
                      ],
                    )
                )
            ),
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [

          // Main screen banner
          Image.asset("assets/icon/banner.png"),

          // This widget contains the Main menu of our app
          Expanded(
              child: ListView.builder(
                  itemCount: menuOptionsTitle.length,
                  itemBuilder: (context, index){
                    return InkWell(
                    onTap: (){
                      if (menuOptionsTitle[index].contains("Encrypt")){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const User(action: "Encrypt" )));
                      } else {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const User(action: "Decrypt" )));
                      }

                     },
                    child : ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                      child : Card(
                      color: Colors.white,
                        child: Row(
                        children: [
                          const Spacer(),
                          ListTile(
                          leading: Icon(menuOptionsIcon[index], color: Colors.yellowAccent,),
                          title : Text(menuOptionsTitle[index], style: const TextStyle(color: Colors.black),)
                          ),
                          const Spacer(),
                        ],
                      ),
                    )
                   )
                  );
                }
              )
          ),

          // Copyright and other stuff
           TextButton(
             style: TextButton.styleFrom(
               backgroundColor: Colors.redAccent
             ),
               onPressed: (){
                 disclaimerDialog(context);
               }, child: const Text("DISCLAIMER", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),))
        ],
      ),
    );
  }
}