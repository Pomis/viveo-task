import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:viveo_task/common/themes/colors.dart';
import 'package:viveo_task/common/themes/dimens.dart';
import 'package:viveo_task/common/themes/text_styles.dart';

class EditText extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final String? label;
  final String? hintText;
  final bool isObscure;

  EditText({
    this.onChanged,
    this.errorText,
    this.label,
    this.hintText,
    this.isObscure = false,
  });

  @override
  _EditTextState createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.textFieldHeight,
      child: TextField(
        onChanged: widget.onChanged,
        style: TextStyles.input,
        decoration: InputDecoration(
          hintStyle: TextStyles.input,
          labelStyle: TextStyles.input,
          counterStyle: TextStyles.input,
          focusColor: colorPink,
          enabledBorder: OutlineInputBorder(
              borderRadius: Dimens.borderRadius,
              borderSide: BorderSide(color: colorPink)),
          focusedBorder: OutlineInputBorder(
              borderRadius: Dimens.borderRadius,
              borderSide: BorderSide(color: colorPink)),
          disabledBorder: OutlineInputBorder(
              borderRadius: Dimens.borderRadius,
              borderSide: BorderSide(color: colorPink)),
          border: OutlineInputBorder(
              borderRadius: Dimens.borderRadius,
              borderSide: BorderSide(color: colorPink)),
          labelText: widget.label,
          hintText: widget.hintText,
          errorText: widget.errorText,
        ),
      ),
    );
  }
}
