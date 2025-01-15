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

  @override
  void initState() {
    super.initState();
    _game.initGame();
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
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              scoreboard('tries', '0'),
              scoreboard('score', '0'),
            ],
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
                        print(_game.gameImg![index]);
                      },
                      child: Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            color: Color(0xFFFFB46A),
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage(_game.gameImg![index]),
                              fit: BoxFit.cover,
                            )),
                      ));
                }),
          ),
        ],
      ),
    );
  }
}

class gestureDetector extends StatelessWidget {
  const gestureDetector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
