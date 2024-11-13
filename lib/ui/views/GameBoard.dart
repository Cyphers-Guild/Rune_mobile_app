// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

import 'package:rune/helpers/constants.dart';
import 'package:rune/imports.dart';
import 'package:rune/widgets/game_board/game_buttons.dart';
import 'package:rune/widgets/game_board/game_drawer.dart';
import 'package:rune/widgets/game_board/player_profile.dart';
import 'package:rune/widgets/game_board/player_time.dart';
import 'package:rune/widgets/piece.dart';

class GameBoard extends StatefulWidget {
  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  late List<List<ChessPiece?>> board;
  ChessPiece? selectedPiece;
  List<List<int>> validMoves = [];
  int selectedPieceRow = -1;
  int selectedPieceCol = -1;
  List<ChessPiece> whiteCaptured = [];
  List<ChessPiece> blackCaptured = [];
  late Timer _timerWhite;
  late Timer _timerBlack;
  int _whiteTime = 300; // 5 minutes
  int _blackTime = 300; // 5 minutes
  bool _isWhiteTurn = true;

  @override
  void initState() {
    super.initState();
    initializeBoard();
    _startWhiteTimer();
  }

  void initializeBoard() {
    List<List<ChessPiece?>> newBoard =
        List.generate(8, (index) => List.generate(8, (index) => null));

    // Place pawns
    for (int i = 0; i < 8; i++) {
      newBoard[1][i] =
          ChessPiece(ChessPieceType.pawn, true, 'assets/pieces/white-pawn.png');
      newBoard[6][i] = ChessPiece(
          ChessPieceType.pawn, false, 'assets/pieces/black-pawn.png');
    }

    // Place rooks
    newBoard[0][0] =
        ChessPiece(ChessPieceType.rook, true, 'assets/pieces/white-rook.png');
    newBoard[0][7] =
        ChessPiece(ChessPieceType.rook, true, 'assets/pieces/white-rook.png');
    newBoard[7][0] =
        ChessPiece(ChessPieceType.rook, false, 'assets/pieces/black-rook.png');
    newBoard[7][7] =
        ChessPiece(ChessPieceType.rook, false, 'assets/pieces/black-rook.png');

    // Place knights
    newBoard[0][1] = ChessPiece(
        ChessPieceType.knight, true, 'assets/pieces/white-knight.png');
    newBoard[0][6] = ChessPiece(
        ChessPieceType.knight, true, 'assets/pieces/white-knight.png');
    newBoard[7][1] = ChessPiece(
        ChessPieceType.knight, false, 'assets/pieces/black-knight.png');
    newBoard[7][6] = ChessPiece(
        ChessPieceType.knight, false, 'assets/pieces/black-knight.png');

    // Place bishops
    newBoard[0][2] = ChessPiece(
        ChessPieceType.bishop, true, 'assets/pieces/white-bishop.png');
    newBoard[0][5] = ChessPiece(
        ChessPieceType.bishop, true, 'assets/pieces/white-bishop.png');
    newBoard[7][2] = ChessPiece(
        ChessPieceType.bishop, false, 'assets/pieces/black-bishop.png');
    newBoard[7][5] = ChessPiece(
        ChessPieceType.bishop, false, 'assets/pieces/black-bishop.png');

    // Place queens
    newBoard[0][3] =
        ChessPiece(ChessPieceType.queen, true, 'assets/pieces/white-queen.png');
    newBoard[7][3] = ChessPiece(
        ChessPieceType.queen, false, 'assets/pieces/black-queen.png');

    // Place kings
    newBoard[0][4] =
        ChessPiece(ChessPieceType.king, true, 'assets/pieces/white-king.png');
    newBoard[7][4] =
        ChessPiece(ChessPieceType.king, false, 'assets/pieces/black-king.png');

    board = newBoard;
  }

  void pieceSelected(int row, int col) {
    setState(() {
      if (selectedPiece != null &&
          selectedPieceRow == row &&
          selectedPieceCol == col) {
        // Deselect the piece if the same tile is clicked
        selectedPiece = null;
        validMoves = [];
        selectedPieceRow = -1;
        selectedPieceCol = -1;
      } else if (selectedPiece == null && board[row][col] != null) {
        selectedPiece = board[row][col];
        selectedPieceRow = row;
        selectedPieceCol = col;
        validMoves = calculateRawValidMoves(
            selectedPieceRow, selectedPieceCol, selectedPiece);
      } else if (board[row][col] != null &&
          board[row][col]!.isWhite == selectedPiece!.isWhite) {
        selectedPiece = board[row][col];
        selectedPieceRow = row;
        selectedPieceCol = col;
        validMoves = calculateRawValidMoves(
            selectedPieceRow, selectedPieceCol, selectedPiece);
      } else if (selectedPiece != null &&
          validMoves.any((element) => element[0] == row && element[1] == col)) {
        movePiece(row, col);
      }
    });
  }

  void movePiece(int newRow, int newCol) {
    setState(() {
      if (board[newRow][newCol] != null) {
        if (board[newRow][newCol]!.isWhite) {
          whiteCaptured.add(board[newRow][newCol]!);
        } else {
          blackCaptured.add(board[newRow][newCol]!);
        }
      }

      board[newRow][newCol] = selectedPiece;
      board[selectedPieceRow][selectedPieceCol] = null;

      selectedPiece = null;
      validMoves = [];
      selectedPieceRow = -1;
      selectedPieceCol = -1;

      _switchTimer();
    });
  }

  List<List<int>> calculateRawValidMoves(int row, int col, ChessPiece? piece) {
    List<List<int>> candidateMoves = [];

    if (piece == null) {
      return [];
    }

    int direction = piece.isWhite ? 1 : -1;

    switch (piece.type) {
      case ChessPieceType.pawn:
        // Pawns can capture diagonally
        if (isInBoard(row + direction, col - 1) &&
            board[row + direction][col - 1] != null &&
            board[row + direction][col - 1]!.isWhite != piece.isWhite) {
          candidateMoves.add([row + direction, col - 1]);
        }
        if (isInBoard(row + direction, col + 1) &&
            board[row + direction][col + 1] != null &&
            board[row + direction][col + 1]!.isWhite != piece.isWhite) {
          candidateMoves.add([row + direction, col + 1]);
        }

        // Pawns can move one step forward if the square is not occupied
        if (isInBoard(row + direction, col) &&
            board[row + direction][col] == null) {
          candidateMoves.add([row + direction, col]);
        }

        // Pawns can move two steps forward if in their initial position
        if ((row == 1 && piece.isWhite) || (row == 6 && !piece.isWhite)) {
          if (isInBoard(row + 2 * direction, col) &&
              board[row + 2 * direction][col] == null &&
              board[row + direction][col] == null) {
            candidateMoves.add([row + 2 * direction, col]);
          }
        }
        break;

      case ChessPieceType.rook:
        var directions = [
          [-1, 0], // up
          [1, 0], // down
          [0, -1], // left
          [0, 1], // right
        ];

        for (var direction in directions) {
          var i = 1;
          while (true) {
            var newRow = row + i * direction[0];
            var newCol = col + i * direction[1];

            if (!isInBoard(newRow, newCol)) {
              break;
            }

            if (board[newRow][newCol] != null) {
              if (board[newRow][newCol]!.isWhite != piece.isWhite) {
                candidateMoves.add([newRow, newCol]);
              }
              break;
            }

            candidateMoves.add([newRow, newCol]);
            i++;
          }
        }
        break;

      case ChessPieceType.knight:
        var knightMoves = [
          [-2, -1], // up 2 left 1
          [-2, 1], // up 2 right 1
          [-1, -2], // up 1 left 2
          [-1, 2], // up 1 right 2
          [1, -2], // down 1 left 2
          [1, 2], // down 1 right 2
          [2, -1], // down 2 left 1
          [2, 1], // down 2 right 1
        ];

        for (var move in knightMoves) {
          var newRow = row + move[0];
          var newCol = col + move[1];

          if (isInBoard(newRow, newCol)) {
            if (board[newRow][newCol] != null) {
              if (board[newRow][newCol]!.isWhite != piece.isWhite) {
                candidateMoves.add([newRow, newCol]);
              }
            } else {
              candidateMoves.add([newRow, newCol]);
            }
          }
        }
        break;

      case ChessPieceType.bishop:
        var directions = [
          [-1, -1], // up left
          [-1, 1], // up right
          [1, -1], // down left
          [1, 1], // down right
        ];

        for (var direction in directions) {
          var i = 1;
          while (true) {
            var newRow = row + i * direction[0];
            var newCol = col + i * direction[1];

            if (!isInBoard(newRow, newCol)) {
              break;
            }

            if (board[newRow][newCol] != null) {
              if (board[newRow][newCol]!.isWhite != piece.isWhite) {
                candidateMoves.add([newRow, newCol]);
              }
              break;
            }

            candidateMoves.add([newRow, newCol]);
            i++;
          }
        }
        break;

      case ChessPieceType.queen:
        var directions = [
          [-1, 0], // up
          [1, 0], // down
          [0, -1], // left
          [0, 1], // right
          [-1, -1], // up left
          [-1, 1], // up right
          [1, -1], // down left
          [1, 1], // down right
        ];

        for (var direction in directions) {
          var i = 1;
          while (true) {
            var newRow = row + i * direction[0];
            var newCol = col + i * direction[1];

            if (!isInBoard(newRow, newCol)) {
              break;
            }

            if (board[newRow][newCol] != null) {
              if (board[newRow][newCol]!.isWhite != piece.isWhite) {
                candidateMoves.add([newRow, newCol]);
              }
              break;
            }

            candidateMoves.add([newRow, newCol]);
            i++;
          }
        }
        break;

      case ChessPieceType.king:
        var kingMoves = [
          [-1, 0], // up
          [1, 0], // down
          [0, -1], // left
          [0, 1], // right
          [-1, -1], // up left
          [-1, 1], // up right
          [1, -1], // down left
          [1, 1], // down right
        ];

        for (var move in kingMoves) {
          var newRow = row + move[0];
          var newCol = col + move[1];

          if (isInBoard(newRow, newCol)) {
            if (board[newRow][newCol] != null) {
              if (board[newRow][newCol]!.isWhite != piece.isWhite) {
                candidateMoves.add([newRow, newCol]);
              }
            } else {
              candidateMoves.add([newRow, newCol]);
            }
          }
        }
        break;

      default:
        break;
    }

    return candidateMoves;
  }

  bool isInBoard(int row, int col) {
    return row >= 0 && row < 8 && col >= 0 && col < 8;
  }

  void _startWhiteTimer() {
    _timerWhite = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_whiteTime > 0) {
          _whiteTime--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  void _startBlackTimer() {
    _timerBlack = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_blackTime > 0) {
          _blackTime--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  void _switchTimer() {
    if (_isWhiteTurn) {
      _timerWhite.cancel();
      _whiteTime = 300; // reset white timer
      _startBlackTimer();
    } else {
      _timerBlack.cancel();
      _blackTime = 300; // reset black timer
      _startWhiteTimer();
    }
    _isWhiteTurn = !_isWhiteTurn;
  }

  @override
  void dispose() {
    _timerWhite.cancel();
    _timerBlack.cancel();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: GameBoardDrawer(),
      backgroundColor: kBgColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.electric_bolt_outlined),
                          3.0.sbW,
                          Text(
                            'Blitz',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        child: Row(
                          children: [
                            Icon(Iconsax.dollar_circle),
                            5.0.sbW,
                            Text('Stake'),
                          ],
                        ),
                      )
                    ],
                  ),
                  50.0.sbH,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade200),
                                borderRadius: BorderRadius.circular(2)),
                            height: 25,
                            width: mediaQuery(context).width * 0.40,
                            child: Wrap(
                              spacing: 4.0, // Gap between adjacent pieces
                              runSpacing: 4.0, // Gap between lines
                              children: blackCaptured
                                  .map((piece) => Image.asset(piece.imgPath,
                                      width: 20, height: 20))
                                  .toList(),
                            ),
                          ),
                          5.0.sbH,
                          PlayerTimer(
                              isWhite: true,
                              timeString:
                                  ' ${_whiteTime ~/ 60}:${(_whiteTime % 60).toString().padLeft(2, '0')}:00',
                              isWhiteTurn: _isWhiteTurn),
                        ],
                      ),
                      GamePlayerProfile(),
                    ],
                  ),
                ],
              ),
            ),
            20.0.sbH,
            Padding(
              padding: const EdgeInsets.only(
                right: 16,
                left: 16,
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: GridView.builder(
                    itemCount: 64,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 8,
                    ),
                    itemBuilder: (context, index) {
                      int row = index ~/ 8;
                      int col = index % 8;
                      bool isValidMove = validMoves
                          .any((move) => move[0] == row && move[1] == col);

                      return GestureDetector(
                        onTap: () => pieceSelected(row, col),
                        child: Container(
                          decoration: BoxDecoration(
                            color: (row + col) % 2 == 0
                                ? kTileAccent
                                : Color.fromARGB(255, 232, 237,
                                    249), //makes the game board checkered
                          ),
                          child: Stack(
                            children: [
                              if (board[row][col] != null)
                                Center(
                                  child: Image.asset(
                                    board[row][col]!.imgPath,
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                              if (isValidMove)
                                Center(
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: const Color.fromARGB(
                                              255, 122, 145, 122)
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            20.0.sbH,
            // Captured Pieces (White)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GamePlayerProfile(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      PlayerTimer(
                          isWhite: false,
                          timeString:
                              ' ${_blackTime ~/ 60}:${(_blackTime % 60).toString().padLeft(2, '0')}:00',
                          isWhiteTurn: !_isWhiteTurn),
                      5.0.sbH,
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(5)),
                        height: 25,
                        width: mediaQuery(context).width * 0.40,
                        child: Wrap(
                          spacing: 4.0, // Gap between adjacent pieces
                          runSpacing: 4.0, // Gap between lines
                          children: whiteCaptured
                              .map((piece) => Image.asset(piece.imgPath,
                                  width: 20, height: 20))
                              .toList(),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GameBoardButtons(
                      icon: 'assets/svgs/game_buttons/exit.svg',
                      onclick: () => Navigator.pop(context),
                    ),
                    GameBoardButtons(
                      icon: 'assets/svgs/game_buttons/message.svg',
                    ),
                    GameBoardButtons(
                      icon: 'assets/svgs/game_buttons/left_arrow.svg',
                    ),
                    GameBoardButtons(
                      icon: 'assets/svgs/game_buttons/right_arrow.svg',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
