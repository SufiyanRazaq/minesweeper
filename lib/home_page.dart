import 'package:flutter/material.dart';
import 'package:sufiyan_game/bomb.dart';
import 'package:sufiyan_game/numberbox.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  int numberofsquares = 9 * 9;
  int numberineachrow = 9;
  var squarestatus = [];
  final List<int> bomblocation = [
    4,
    5,
    6,
    41,
    42,
    43,
    61,
  ];
  bool bombsrevealed = false;
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < numberofsquares; i++) {
      squarestatus.add([0, false]);
    }
    scanbomb();
  }

  void ResetGame() {
    setState(() {
      bombsrevealed = false;
      for (int i = 0; i < numberofsquares; i++) {
        squarestatus[i][1] = false;
      }
    });
  }

  void revealboxnumbers(int index) {
    if (squarestatus[index][0] != 0) {
      setState(() {
        squarestatus[index][1] = true;
      });
    } else if (squarestatus[index][0] == 0) {
      setState(() {
        squarestatus[index][1] = true;
        if (index % numberineachrow != 0) {
          if (squarestatus[index - 1][0] == 0 &&
              squarestatus[index - 1][1] == false) {
            revealboxnumbers(index - 1);
          }
          squarestatus[index - 1][1] = true;
        }
        if (index % numberineachrow != 0 && index >= numberineachrow) {
          if (squarestatus[index - 1 - numberineachrow][0] == 0 &&
              squarestatus[index - 1 - numberineachrow][1] == false) {
            revealboxnumbers(index - 1 - numberineachrow);
          }
          squarestatus[index - 1 - numberineachrow][1] = true;
        }
        if (index >= numberineachrow) {
          if (squarestatus[index - numberineachrow][0] == 0 &&
              squarestatus[index - numberineachrow][1] == false) {
            revealboxnumbers(index - numberineachrow);
          }
          squarestatus[index - numberineachrow][1] = true;
        }
        if (index >= numberineachrow &&
            index % numberineachrow != numberineachrow - 1) {
          if (squarestatus[index + 1 - numberineachrow][0] == 0 &&
              squarestatus[index + 1 - numberineachrow][1] == false) {
            revealboxnumbers(index + 1 - numberineachrow);
          }
          squarestatus[index + 1 - numberineachrow][1] = true;
        }
        if (index % numberineachrow != numberineachrow - 1) {
          if (squarestatus[index + 1][0] == 0 &&
              squarestatus[index + 1][1] == false) {
            revealboxnumbers(index + 1);
          }
          squarestatus[index + 1][1] = true;
        }
        if (index % numberineachrow != numberineachrow - 1) {
          if (squarestatus[index + 1][0] == 0 &&
              squarestatus[index + 1][1] == false) {
            revealboxnumbers(index + 1);
          }
          squarestatus[index + 1][1] = true;
        }
        if (index < numberineachrow - numberineachrow &&
            index % numberineachrow != numberineachrow - 1) {
          if (squarestatus[index + 1 + numberineachrow][0] == 0 &&
              squarestatus[index + 1 + numberineachrow][1] == false) {
            revealboxnumbers(index + 1 + numberineachrow);
          }
          squarestatus[index + 1 + numberineachrow][1] = true;
        }
        if (index < numberineachrow - numberineachrow) {
          if (squarestatus[index + numberineachrow][0] == 0 &&
              squarestatus[index + numberineachrow][1] == false) {
            revealboxnumbers(index + numberineachrow);
          }
          squarestatus[index + numberineachrow][1] = true;
        }

        if (index < numberineachrow - numberineachrow &&
            index % numberineachrow != 0) {
          if (squarestatus[index - 1 + numberineachrow][0] == 0 &&
              squarestatus[index - 1 + numberineachrow][1] == false) {
            revealboxnumbers(index - 1 + numberineachrow);
          }
          squarestatus[index - 1 + numberineachrow][1] = true;
        }
      });
    }
  }

  void scanbomb() {
    for (int i = 0; i < numberofsquares; i++) {
      int numberofbombsaround = 0;
      if (bomblocation.contains(i - 1) && i % numberineachrow != 0) {
        numberofbombsaround++;
      }
      if (bomblocation.contains(i - 1 - numberineachrow) &&
          i % numberineachrow != 0 &&
          i >= numberineachrow) {
        numberofbombsaround++;
      }
      if (bomblocation.contains(i - numberineachrow) && i >= numberineachrow) {
        numberofbombsaround++;
      }
      if (bomblocation.contains(i + 1 - numberineachrow) &&
          i >= numberineachrow &&
          i % numberineachrow != numberineachrow - 1) {
        numberofbombsaround++;
      }
      if (bomblocation.contains(i + 1) &&
          i % numberineachrow != numberineachrow - 1) {
        numberofbombsaround++;
      }
      if (bomblocation.contains(i + 1 + numberineachrow) &&
          i % numberineachrow != numberineachrow - 1 &&
          i < numberofsquares - numberineachrow) {
        numberofbombsaround++;
      }
      if (bomblocation.contains(i + numberineachrow) &&
          i < numberofsquares - numberineachrow) {
        numberofbombsaround++;
      }
      if (bomblocation.contains(i + 1) &&
          i % numberineachrow != numberineachrow - 1) {
        numberofbombsaround++;
      }
      if (bomblocation.contains(i + 1 + numberineachrow) &&
          i % numberineachrow != numberineachrow - 1 &&
          i < numberofsquares - numberineachrow) {
        numberofbombsaround++;
      }
      if (bomblocation.contains(i + numberineachrow) &&
          i < numberofsquares - numberineachrow) {
        numberofbombsaround++;
      }
      if (bomblocation.contains(i - 1 + numberineachrow) &&
          i < numberineachrow - numberineachrow &&
          i % numberineachrow != 0) {
        numberofbombsaround++;
      }
      setState(() {
        squarestatus[i][0] = numberofbombsaround;
      });
    }
  }

  void playerlost() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.grey[800],
            title: Center(
                child: Text(
              'YOU LOST',
              style: TextStyle(color: Colors.white),
            )),
            actions: [
              MaterialButton(
                color: Colors.grey[100],
                onPressed: () {
                  ResetGame();
                  Navigator.pop(context);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.grey[300],
                    child: Icon(
                      Icons.refresh,
                      size: 30,
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }

  void playerWon() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              backgroundColor: Colors.grey[700],
              title: Center(
                child: Text(
                  'YOU WIN',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              actions: [
                MaterialButton(
                  color: Colors.grey[100],
                  onPressed: () {
                    ResetGame();
                    Navigator.pop(context);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Colors.grey[300],
                      child: Icon(
                        Icons.refresh,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ]);
        });
  }

  void checkWinner() {
    int unrevealedbox = 0;
    for (int i = 0; i < numberofsquares; i++) {
      if (squarestatus[i][1] == false) {
        unrevealedbox++;
      }
    }
    if (unrevealedbox == bomblocation.length) {
      playerWon();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Container(
            height: 150,
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      bomblocation.length.toString(),
                      style: TextStyle(fontSize: 40),
                    ),
                    Text("B O M B")
                  ],
                ),
                GestureDetector(
                  onTap: ResetGame,
                  child: Card(
                    child: Icon(
                      Icons.refresh,
                      size: 40,
                      color: Colors.white,
                    ),
                    color: Colors.grey[700],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "0",
                      style: TextStyle(fontSize: 40),
                    ),
                    Text("T I M E")
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: numberofsquares,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: numberineachrow),
                itemBuilder: (context, index) {
                  if (bomblocation.contains(index)) {
                    return mybomb(
                      revealed: bombsrevealed,
                      function: () {
                        setState(() {
                          bombsrevealed = true;
                        });
                        playerlost();
                      },
                    );
                  } else {
                    return numberbox(
                      child: squarestatus[index][0],
                      revealed: squarestatus[index][1],
                      function: () {
                        revealboxnumbers(index);
                        checkWinner();
                      },
                    );
                  }
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: Text("C r e a t e d b y S u f i y a n"),
          ),
        ],
      ),
    );
  }
}
