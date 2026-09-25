import 'dart:io';
// Mga valid nga moves sa game
const Set<String> validMoves = {
  'rock',
  'paper',
  'scissors'
};


// Mangayo og pangalan sa player
String pangalan_sa_player(int number) {
  while (true) {
    stdout.write('Enter Player $number name: ');
    final String? input = stdin.readLineSync()?.trim();
// Kung walay gi-input, gamiton ang default name
    if (input == null || input.isEmpty) {
      print('(No name entered. Using "Player $number".)');
      return 'Player $number';
    }
// Letters ug spaces ra ang pwede sa pangalan
    if (RegExp(r'^[a-zA-Z ]+$').hasMatch(input)) {
      return input;
    }
// Message kung invalid ang name
    print('You can only enter a name. Please try again.');
  }
}
// I-check kung valid ang move
String? validateMove(String? input) {
  String move = input?.trim().toLowerCase() ?? '';
  // Ibalik ang move kung valid, kung dili null
  return validMoves.contains(move) ? move : null;
}