// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:math';
import 'package:chessground/chessground.dart';
import 'package:dartchess/dartchess.dart';
import 'package:iconsax/iconsax.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:rune/imports.dart';
import 'package:rune/widgets/game_board/board_theme.dart';
import 'package:rune/widgets/game_board/game_buttons.dart';
import 'package:rune/widgets/game_board/game_drawer.dart';
import 'package:rune/widgets/game_board/player_profile.dart';
import 'package:rune/widgets/game_board/player_time.dart';



class GameBoard extends StatefulWidget {
  @override
  _GameBoardState createState() => _GameBoardState();
}


String pieceShiftMethodLabel(PieceShiftMethod method) {
  switch (method) {
    case PieceShiftMethod.drag:
      return 'Drag';
    case PieceShiftMethod.tapTwoSquares:
      return 'Tap two squares';
    case PieceShiftMethod.either:
      return 'Either';
  }
}

enum Mode {
  botPlay,
  inputMove,
  freePlay,
}

class _GameBoardState extends State<GameBoard> with SingleTickerProviderStateMixin {

@override
void initState() {
  super.initState();
 // Initialize with starting position
  _animationController = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 300),
  );

  // Start the timer for the white player first
  _startWhiteTimer();
}

void _onMove(String from, String to) {
  // Validate and make the move
  if (true) {


    // Switch the timers after a move
    _switchTimer();
  } 
  // else {
  //   // Invalid move handling
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(content: Text('Invalid move: $from -> $to')),
  //   );
  // }
}


  late List<List<ChessPiece?>> board;
  ChessPiece? selectedPiece;
  
  int selectedPieceRow = -1;
  int selectedPieceCol = -1;
  List<ChessPiece> whiteCaptured = [];
  List<ChessPiece> blackCaptured = [];
  late Timer _timerWhite;
  late Timer _timerBlack;
  int _whiteTime = 300; // 5 minutes
  int _blackTime = 300; // 5 minutes
  bool _isWhiteTurn = true;
  late AnimationController _animationController;


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
    _startBlackTimer(); // Start black timer
  } else {
    _timerBlack.cancel();
    _blackTime = 300; // reset black timer
    _startWhiteTimer(); // Start white timer
  }
  _isWhiteTurn = !_isWhiteTurn;
}



Position<Chess> position = Chess.initial;
  Side orientation = Side.white;
  String fen = kInitialBoardFEN;
  NormalMove? lastMove;
  NormalMove? promotionMove;
  NormalMove? premove;
  ValidMoves validMoves = IMap(const {});
  Side sideToMove = Side.white;
  PieceSet pieceSet = PieceSet.gioco;
  PieceShiftMethod pieceShiftMethod = PieceShiftMethod.either;
  DragTargetKind dragTargetKind = DragTargetKind.circle;
  BoardTheme boardTheme = BoardTheme.metal;
  bool drawMode = true;
  bool pieceAnimation = true;
  bool dragMagnify = true;
  Mode playMode = Mode.botPlay;
  Position<Chess>? lastPos;
  ISet<Shape> shapes = ISet();
  bool showBorder = false;


  @override
  void dispose() {
    _timerWhite.cancel();
    _timerBlack.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
  
             GestureDetector(
              onTap: (){
                if(_animationController.isCompleted){
                    _animationController.reverse();
                  }
              },
               child: AnimatedBuilder(
                     animation: _animationController,
                     builder: (context, child) {
                       double slide = _animationController.value * MediaQuery.of(context).size.width * 0.7;
                       double scale = 1 - (_animationController.value * 0.1);
               
                       return Transform(
                         transform: Matrix4.identity()
                           ..translate(slide)
                           ..scale(scale),
                         alignment: Alignment.centerLeft,
                         child: Opacity(
                           opacity: 1 - (_animationController.value * 0.5),
                      child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  
                                  GestureDetector(
                                    onTap: () {
                                         if(_animationController.isCompleted){
                    _animationController.reverse();
                  }else{
                    _animationController.forward();
                  }
                                    },
                                    child: Row(
                                     
                                      children: const [
                                        Icon(Iconsax.dollar_circle,color: Colors.black,),
                                      ],
                                      
                                    ),
                                  ),Row(
                                    children: [
                                      Icon(Icons.electric_bolt_outlined,color: Colors.white,),
                                      3.0.sbW,
                                      Text(
                                        'Blitz',
                                        style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              50.0.sbH,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PlayerTimer(
                                      isWhite: true,
                                      timeString:
                                          ' ${_whiteTime ~/ 60}:${(_whiteTime % 60).toString().padLeft(2, '0')}',
                                      isWhiteTurn: _isWhiteTurn),
                                  GamePlayerProfile(
                                    captured: blackCaptured,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        20.0.sbH,
                        Chessboard(
          size: mediaQuery(context).width,
          orientation: Side.white,
          fen: kInitialBoardFEN,
          settings:  ChessboardSettings(
              pieceAssets:PieceSet.cardinalAssets,
              colorScheme: boardTheme.colors,
              border: BoardBorder(
                      width: 16.0,
                      color: Colors.black,
                    )
             ,
              enableCoordinates: true,
              animationDuration:
                   const Duration(milliseconds: 200)
             
             , dragFeedbackScale: 2.0,
              dragTargetKind: DragTargetKind.circle,
              drawShape: DrawShapeOptions(
                enable: true,
              ),
              pieceShiftMethod: PieceShiftMethod.either,
              autoQueenPromotionOnPremove: false,
              pieceOrientationBehavior:  PieceOrientationBehavior.facingUser,
              
            ), lastMove: lastMove,
            game: GameData(
              playerSide:
                  (playMode == Mode.botPlay || playMode == Mode.inputMove)
                      ? PlayerSide.white
                      : (position.turn == Side.white
                          ? PlayerSide.white
                          : PlayerSide.black),
              validMoves: validMoves,
              sideToMove: position.turn == Side.white ? Side.white : Side.black,
              isCheck: position.isCheck,
              promotionMove: promotionMove,
              onMove:
                   _playMove,
              onPromotionSelection: _onPromotionSelection,
              premovable: (
                onSetPremove: _onSetPremove,
                premove: premove,
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
                              GamePlayerProfile(
                                captured: whiteCaptured,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  PlayerTimer(
                                      isWhite: false,
                                      timeString:
                                          ' ${_blackTime ~/ 60}:${(_blackTime % 60).toString().padLeft(2, '0')}',
                                      isWhiteTurn: !_isWhiteTurn),
                                  5.0.sbH,
                                
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
                }, 
                           ),
             ),
                   // Drawer
    AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
         double slide = MediaQuery.of(context).size.width * (1 - _animationController.value);
        return Transform.translate(
          offset: Offset(slide, 0),
          child: GameBoardDrawer(), // Your drawer content
        );
      },
    ),   ],
        ),
      ),
    );
  }


  void _onSetPremove(NormalMove? move) {
    setState(() {
      premove = move;
    });
  }

   void _playMove(NormalMove move, {bool? isDrop, bool? isPremove}) {
    lastPos = position;
    if (isPromotionPawnMove(move)) {
      setState(() {
        promotionMove = move;
      });
    } else if (position.isLegal(move)) {
      setState(() {
        position = position.playUnchecked(move);
        lastMove = move;
        fen = position.fen;
        validMoves = makeLegalMoves(position);
        promotionMove = null;
        if (isPremove == true) {
          premove = null;
        }
      });
    }
  }

  void _onPromotionSelection(Role? role) {
    if (role == null) {
      _onPromotionCancel();
    } else if (promotionMove != null) {
      if (playMode == Mode.botPlay) {
        _onUserMoveAgainstBot(promotionMove!.withPromotion(role));
      } else {
        _playMove(promotionMove!.withPromotion(role));
      }
    }
  }

  void _onUserMoveAgainstBot(NormalMove move, {isDrop}) async {
    lastPos = position;
    if (isPromotionPawnMove(move)) {
      setState(() {
        promotionMove = move;
      });
    } else {
      setState(() {
        position = position.playUnchecked(move);
        lastMove = move;
        fen = position.fen;
        validMoves = IMap(const {});
        promotionMove = null;
      });
      await _playBlackMove();
      _tryPlayPremove();
    }
  }

  void _tryPlayPremove() {
    if (premove != null) {
      Timer.run(() {
        _playMove(premove!, isPremove: true);
      });
    }
  }

  Future<void> _playBlackMove() async {
    Future.delayed(const Duration(milliseconds: 100)).then((value) {
      setState(() {});
    });
    if (!position.isGameOver) {
      final random = Random();
      await Future.delayed(Duration(milliseconds: random.nextInt(1000) + 500));
      final allMoves = [
        for (final entry in position.legalMoves.entries)
          for (final dest in entry.value.squares)
            NormalMove(from: entry.key, to: dest)
      ];
      if (allMoves.isNotEmpty) {
        final mv = (allMoves..shuffle()).first;
        setState(() {
          position = position.playUnchecked(mv);
          lastMove = NormalMove(from: mv.from, to: mv.to);
          fen = position.fen;
          validMoves = makeLegalMoves(position);
        });
        lastPos = position;
      }
    }
  }
    bool isPromotionPawnMove(NormalMove move) {
    return move.promotion == null &&
        position.board.roleAt(move.from) == Role.pawn &&
        ((move.to.rank == Rank.first && position.turn == Side.black) ||
            (move.to.rank == Rank.eighth && position.turn == Side.white));
  }

    void _onPromotionCancel() {
    setState(() {
      promotionMove = null;
    });
  }
}


