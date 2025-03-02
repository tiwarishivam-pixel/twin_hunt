import 'package:flutter/material.dart';
import 'package:twin_hunt/Pages/scre_board.dart';
import 'package:twin_hunt/utils/game_logic.dart';

class Myhomepage extends StatefulWidget {
  const Myhomepage({super.key});

  @override
  _MyhomepageState createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  final Game _game = Game();
  int tries = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    _game.initGame();
  }

  void restartGame() {
    setState(() {
      tries = 0;
      score = 0;
      _game.resetGame();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 77, 15, 15),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Twin Hunt',
              style: TextStyle(
                  color: const Color.fromARGB(255, 5, 5, 5),
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              scoreboard('tries', tries.toString()),
              scoreboard('score', score.toString()),
            ],
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: restartGame,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Restart',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: screenWidth,
            width: screenWidth,
            child: GridView.builder(
                itemCount: _game.gameImg!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                padding: EdgeInsets.all(18.0),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        setState(() {
                          tries++;
                          _game.gameImg![index] = _game.card_list[index];
                          _game.matchcheck.add({index: _game.card_list[index]});
                        });
                        if (_game.matchcheck.length == 2) {
                          if (_game.matchcheck[0].values.first ==
                              _game.matchcheck[1].values.first) {
                            setState(() {
                              score += 100;
                              _game.matchcheck.clear();
                            });
                          } else {
                            Future.delayed(Duration(milliseconds: 500), () {
                              setState(() {
                                _game.gameImg![_game.matchcheck[0].keys.first] =
                                    _game.hiddencardpath;
                                _game.gameImg![_game.matchcheck[1].keys.first] =
                                    _game.hiddencardpath;
                                _game.matchcheck.clear();
                              });
                            });
                          }
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFB46A),
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage(_game.gameImg![index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ));
                }),
          ),
        ],
      ),
    );
  }
}
