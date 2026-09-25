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
// Mangayo og move hangtod makahatag og valid
String getMove(String name) {
  String? move;

  while (true) {
    stdout.write('$name, enter your move (rock/paper/scissors): ');
    move = validateMove(stdin.readLineSync());
// Kung valid ang move, ipadayon ang game
    if (move != null) {
      return move;
    }
// Message kung sayop ang gi-input
    print('Mali imo gi INPUT BAI. Kani ang e INPUT type rock, paper, or scissors.');
  }
}
// I-determine kung kinsa ang nidaog sa round
int decideWinner(String first, String second) {
  // I-compare ang moves para mahibaw-an ang winner
  if (first == second) return 0;
  switch (first) {
    case 'rock':
      return second == 'scissors' ? 1 : 2;
    case 'paper':
      return second == 'rock' ? 1 : 2;
    default:
      return second == 'paper' ? 1 : 2;
  }
}

void main() {
  print('===== ROCK, PAPER, SCISSORS =====');
  // Kuhaon ang names sa duha ka players
  String playerOne = pangalan_sa_player(1);
  String playerTwo = pangalan_sa_player(2);
  // Initial score kay zero
  int playerOneScore = 0;
  int playerTwoScore = 0;
  // Sugod sa first round
  int round = 0;
  String? again;

  do {
    round++;
    print('\n--- Round $round ---');

  
    final String moveOne = getMove(playerOne);
    for (int i = 0; i < 30; i++) {
      print('');
    }
    String moveTwo = getMove(playerTwo);

  
    int result = decideWinner(moveOne, moveTwo);
    String? winner;
    if (result == 1) {
      winner = '$playerOne wins the round!';
      playerOneScore++;
    } else if (result == 2) {
      winner = '$playerTwo wins the round!';
      playerTwoScore++;
    }

    print('$playerOne chose $moveOne. $playerTwo chose $moveTwo.');
    print('Result: ${winner ?? "It's a draw!"}');
    print('Score -> $playerOne: $playerOneScore | $playerTwo: $playerTwoScore');

    stdout.write('Play again? (y/n): ');
    again = stdin.readLineSync();
  } while (again?.trim().toLowerCase() != 'n');


  String overall;
  if (playerOneScore > playerTwoScore) {
    overall = playerOne;
  } else if (playerTwoScore > playerOneScore) {
    overall = playerTwo;
  } else {
    overall = "It's a draw!";
  }

  print('\n===== FINAL SCORE =====');
  print('$playerOne: $playerOneScore | $playerTwo: $playerTwoScore');
  print('Overall winner: $overall');
}