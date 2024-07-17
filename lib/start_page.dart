import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac/home_layout.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              child: Padding(
                padding:  EdgeInsets.only(top:120.0),
                child:  Text("TIC TAC TOE",style: TextStyle(color:Colors.black,fontSize: 30.0,fontWeight: FontWeight.bold),),
              ),
            ),
           const Expanded(
              flex: 2,
              child:  AvatarGlow(
              glowColor: Colors.black,
              endRadius: 140.0,
              duration: Duration(seconds: 2), 
              child: CircleAvatar(
              backgroundImage: AssetImage("image/TIC.png",),
              radius: 80.0,
              ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:  const EdgeInsets.only(top:80.0),
                child: Container(
                  alignment: Alignment.center,
                  child: const Text("@ Create By Mario",style:TextStyle(color:Colors.black,fontSize: 30.0,fontWeight: FontWeight.bold),
                  )
                  ),
              ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0,right: 40.0,bottom: 80.0),
                child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  width: double.infinity,
                  height: 80.0,
                  child: MaterialButton(
                    onPressed: ()
                    {
                      Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) =>
                       const HomeLayout(),
                       )
                       );
                    },
                    child:const Text("Play Game",style:TextStyle(color:Colors.black,fontSize: 30.0,fontWeight: FontWeight.bold)),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}