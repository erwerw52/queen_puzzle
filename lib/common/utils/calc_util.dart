import 'package:queen_puzzle/common/model/queen.dart';

class Calcutil {
  static final Calcutil _instance = Calcutil._internal();

  factory Calcutil() => _instance;

  Calcutil._internal();

  int boardSize = 8;
  List<int> board = List.filled(8, -1); // -1 means empty
  int count = 0;

  List<Queen> solve(int num) {
    List<Queen> queens = [];
    count = 0;
    boardSize = num;
    board = List.filled(num, -1); // -1 means empty
    placeQueen(0, queens);
    return queens;
  }

  placeQueen(int row, List<Queen> queens) {
    if (row == boardSize) {
      printBoard(queens);
      count++;
    }

    for (int col = 0; col < boardSize; col++) {
      if (isSafe(row, col)) {
        board[row] = col;
        placeQueen(row + 1, queens);
        board[row] = -1;
      }
    }
  }

  bool isSafe(int row, int col) {
    for (int i = 0; i < row; i++) {
      if (board[i] == col) {
        return false;
      }

      int diff = (row - i).abs();
      if (board[i] == col - diff || board[i] == col + diff) {
        return false;
      }
    }
    return true;
  }

  void printBoard(List<Queen> queens) {
    Map<int, List<String>> solution = {};
    for (int i = 0; i < boardSize; i++) {
      solution[i] = [];
      for (int j = 0; j < boardSize; j++) {
        if (board[i] == j) {
          solution[i]!.add('Q');
        } else {
          solution[i]!.add('. ');
        }
      }
    }
    Queen q = Queen();
    q.solutionCount = count + 1;
    q.solution = solution;
    queens.add(q);
  }
}
