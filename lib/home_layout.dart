import 'package:flutter/material.dart';
import 'package:tic_tac/start_page.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  // String xO="";
  bool oTurn=true;
  int allBoxesAreTapped=0;
  List<String> boxes=[
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    ""
  ];
  int player1Score=0;
  int player2Score=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.topLeft,
              child: IconButton(icon: const Icon(Icons.arrow_back),onPressed:()
              {
                resetPlay();
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                const StartPage(),
                )
              );
              } 
              ),
            ),
            const SizedBox(height: 20.0,),
             Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: 
                        [
                          const Text("Player O" ,style: TextStyle(color:Colors.deepOrangeAccent,fontSize: 30.0,fontWeight: FontWeight.bold),),
                          Text(player1Score.toString(),style: const TextStyle(color:Colors.black,fontSize: 30.0,fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: 
                        [
                       const Text("Player X" ,style: TextStyle(color:Colors.deepPurpleAccent,fontSize: 30.0,fontWeight: FontWeight.bold),),
                       Text(player2Score.toString(),style: const TextStyle(color:Colors.black,fontSize: 30.0,fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3) ,
                 itemBuilder: (context, index) => 
                 GestureDetector(
                  onTap:() {
                    boxIsTapped(index);
                    },
                   child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[500]!)
                    ),
                     child: Center(
                      child: Text(boxes[index],style: (boxes[index]=="X")? const TextStyle(fontSize: 60.0,fontWeight: FontWeight.w600,color: Colors.deepPurpleAccent):const TextStyle(fontSize: 60.0,fontWeight: FontWeight.w600,color: Colors.deepOrangeAccent),),
                     ),
                   ),
                 ),
                 itemCount: 9,
                 ),
              ),
            ),
            const Expanded(
              child: Text(""),
            )
          ],
        ),
      ),
    );
  }

  void boxIsTapped(int index)
  {
    setState(() {
      if(oTurn && boxes[index].isEmpty)
      {
        boxes[index]="O";
        oTurn=!oTurn;
        allBoxesAreTapped++;
        checkWinner();
      }
      else if(!oTurn && boxes[index].isEmpty)
      {
         boxes[index]="X";
         oTurn=!oTurn;
         allBoxesAreTapped++;
         checkWinner();
      }
    });
  }

  void checkWinner()
  {
    if(boxes[0]==boxes[1]&&boxes[0]==boxes[2]&& boxes[0].isNotEmpty)
    {
      winner(boxes[0]);
    }
    else if(boxes[3]==boxes[4]&&boxes[3]==boxes[5]&& boxes[3].isNotEmpty)
    {
      winner(boxes[3]);
    }
    else if (boxes[6]==boxes[7]&&boxes[6]==boxes[8]&& boxes[6].isNotEmpty)
    {
      winner(boxes[6]);
    }
    else if(boxes[0]==boxes[3]&&boxes[0]==boxes[6]&& boxes[0].isNotEmpty)
    {
      winner(boxes[0]);
    }
    else if(boxes[1]==boxes[4]&&boxes[1]==boxes[7]&& boxes[1].isNotEmpty)
    {
      winner(boxes[1]);
    }
    else if(boxes[2]==boxes[5]&&boxes[2]==boxes[8]&& boxes[2].isNotEmpty)
    {
      winner(boxes[2]);
    } 
    else if(boxes[0]==boxes[4]&&boxes[0]==boxes[8]&& boxes[0].isNotEmpty)
    {
      winner(boxes[0]);
    }
    else if(boxes[2]==boxes[4]&&boxes[2]==boxes[6]&& boxes[2].isNotEmpty)
    {
      winner(boxes[2]);
    }
    else if(allBoxesAreTapped==9)
    {
      winner("Draw");
    }
  }
  void winner(String win)
  {
    showDialog(
      barrierDismissible: false,
      context: context, builder: (context) => 
      AlertDialog(
        title: win=="Draw"? Text(win) : Text("The Winner is $win Player"),
        actions: [
          TextButton(onPressed:resetGame , child: const Text("Play Again")),
          TextButton(onPressed:resetPlay , child: const Text("Reset The Game")),
        ],
      ),
    );

    if(win=="O")
    {
      oTurn=!oTurn;
      player1Score++;
    }
    else if(win=="X")
    {
      oTurn=!oTurn;
      player2Score++;
    }
  }

void resetGame()
{
  setState(() 
  {
    for(int i=0 ;i<boxes.length;i++)
    {
      boxes[i]="";
    }
  allBoxesAreTapped=0;
  Navigator.pop(context);
  }
  );
}
 void resetPlay()
 {
  resetGame();
  player1Score=0;
  player2Score=0;
  oTurn=true;
 }
}