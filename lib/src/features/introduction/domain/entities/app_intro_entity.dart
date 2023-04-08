import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppIntroEntity extends Equatable {
  const AppIntroEntity({
    required this.img,
    required this.title,
    required this.content,
  });

  final String img;
  final String title;
  final Text content;

  @override
  List<Object?> get props => [
        img,
        title,
        content,
      ];
}
