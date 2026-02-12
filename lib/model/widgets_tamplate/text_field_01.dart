import 'package:fe_lw_shams/constan_value.dart';
import 'package:flutter/material.dart';

class TextField01 extends StatefulWidget {
  const TextField01(
      {super.key,
      required this.controller,
      required this.label,
      this.obscureText = false,
      this.inputType = TextInputType.text,
      this.textDir = TextDirection.rtl,
      this.textAlign = TextAlign.center,
      this.autofocus = false});
  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final TextInputType inputType;
  final TextDirection textDir;
  final TextAlign textAlign;
  final bool autofocus;
  @override
  State<TextField01> createState() => _TextField01State();
}

class _TextField01State extends State<TextField01> {
  late bool isPassword;

  @override
  void initState() {
    super.initState();
    isPassword = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        textAlign: widget.textAlign,
        textDirection: widget.textDir,
        controller: widget.controller,
        obscureText: isPassword,
        keyboardType: widget.inputType,
        autofocus: widget.autofocus,
        decoration: InputDecoration(
          label: Text(
            widget.label,
            style: TextStyle(fontSize: 14, color: Colors.blueGrey),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey),
          ),
          suffixIcon: widget.obscureText
              ? IconButton(
                  onPressed: () => setState(() => isPassword = !isPassword),
                  icon: Icon(
                      isPassword ? Icons.visibility_off : Icons.visibility))
              : SizedBox(),
        ),
      ),
    );
  }
}
