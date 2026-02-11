import 'package:fe_lw_shams/main_design.dart';
import 'package:flutter/material.dart';

class InputFields {
  InputFields(
      {required this.index,
      this.focus = false,
      required this.controller,
      required this.label,
      this.inputType = TextInputType.text,
      this.textDirection = mainDirection,
      this.obscuretext = false});
  final int index;
  bool focus;
  final TextEditingController controller;
  final String label;
  final TextInputType inputType;
  final TextDirection textDirection;
  final bool obscuretext;
}
