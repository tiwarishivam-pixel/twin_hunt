class Game {
  final String hiddencardpath = 'assets/images/front.jpg';
  List<String>? gameImg;

  final List<String> card_list = [
    'assets/images/black_heart.jpeg',
    'assets/images/circle.jpeg',
    'assets/images/question.png',
    'assets/images/circle.jpeg',
    'assets/images/traingle.jpeg',
    'assets/images/black_heart.jpeg',
    'assets/images/question.png',
    'assets/images/traingle.jpeg',
  ];

  List<Map<int, String>> matchcheck = [];

  int cardcount = 8;
  void initGame() {
    gameImg = List.generate(cardcount, (index) => hiddencardpath);
  }
}
