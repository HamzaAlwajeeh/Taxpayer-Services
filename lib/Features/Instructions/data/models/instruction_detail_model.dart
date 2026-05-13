import 'package:flutter/material.dart';

class InstructionDetailModel {
  final String title;
  final String headerDescription;
  final IconData headerIcon;
  final List<String> steps;
  final String? note;
  final Color? accentColor;

  const InstructionDetailModel({
    required this.title,
    required this.headerDescription,
    required this.headerIcon,
    required this.steps,
    this.note,
    this.accentColor,
  });
}
