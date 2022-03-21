import 'package:flutter/material.dart';

class GlobalTextFormField extends StatelessWidget {
  const GlobalTextFormField(
      {Key? key,
        required this.controller,
        required this.lable,
        this.errorText,
        required this.enabled,
        required this.focusNode,
        required this.onEditingComplete,
        required this.onChanged,
        this.obscureText,
        required this.textInputAction,
        required this.textInputType,
        required this.iconData,
        this.hintText,
        this.suffix,
      })
      : super(key: key);
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final String lable;
  final String? errorText;
  final String? hintText;
  final bool enabled;
  final IconData iconData;
  final bool? obscureText;
  final Widget? suffix;
  final VoidCallback? onEditingComplete;
  final void Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: textInputAction,keyboardType: textInputType,
      decoration: InputDecoration(
        suffix: suffix,
        fillColor: Colors.grey[100],
        filled: true,
        // label: Text(lable),
        labelText: lable,
        icon: Icon(iconData),
        errorText: errorText,
        enabled: enabled,
        hintText: hintText,
        // border: const OutlineInputBorder(
        //     borderSide: BorderSide(color: Colors.teal),
        // ),
      ),
      obscureText: obscureText ?? false,
      autocorrect: false,
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
    );
  }
}