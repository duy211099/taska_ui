import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/shared.dart';

class TaskaInputField extends StatefulWidget {
  final String? icon;
  final String? hintText;
  final bool autofocus;
  final bool obscureText;
  final void Function(String)? onChanged;

  TaskaInputField({
    Key? key,
    this.icon,
    this.hintText,
    this.autofocus = false,
    this.obscureText = false,
    this.onChanged,
  }) : super(key: key);

  @override
  State<TaskaInputField> createState() => _TaskaInputFieldState();
}

class _TaskaInputFieldState extends State<TaskaInputField> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      onFocusChange: ((isFocused) {
        setState(() {
          _isFocused = isFocused;
        });
      }),
      child: TextFormField(
        obscureText: widget.obscureText,
        autofocus: widget.autofocus,
        style: heading5Style,
        cursorColor: kcBlackColor,
        decoration: InputDecoration(
          // isDense: true,
          contentPadding: EdgeInsets.fromLTRB(20, 24, 20, 16),
          hintText: widget.hintText,
          hintStyle: heading5Style.copyWith(fontWeight: FontWeight.w400),
          prefixIcon: widget.icon != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: SvgPicture.asset(widget.icon!,
                      color: _isFocused ? kcPrimaryColor : kcGreyScale,
                      fit: BoxFit.fitHeight),
                )
              : null,
          filled: true,
          fillColor: _isFocused
              ? kcPrimaryColor.withOpacity(0.08)
              : kcGreyScale.shade100,
          focusColor: kcPrimaryColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: kcPrimaryColor, width: 1),
          ),
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
