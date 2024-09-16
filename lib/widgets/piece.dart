import 'package:flutter/material.dart';

enum ChessPieceType { pawn, rook, knight, bishop, king, queen }

class ChessPiece {
  final ChessPieceType type;
  final bool isWhite;
  final String imgPath;

  ChessPiece(
    this.type,
    this.isWhite,
    this.imgPath,
  ) {}
}
