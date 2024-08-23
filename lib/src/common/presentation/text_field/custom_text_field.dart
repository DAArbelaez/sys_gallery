import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class CustomTextField extends StatefulWidget {
  final String? Function(String?)? validator;
  final String? errorText;
  final int? maxLength;
  final TextStyle? style;
  final String? labelText;
  final String? hintText;
  final void Function(String)? onTextChange;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final bool showSuffixIcon;
  final void Function(String)? onSubmitted;
  final Iterable<String>? autofillHints;
  final TextCapitalization textCapitalization;

  const CustomTextField({
    super.key,
    this.validator,
    this.errorText,
    this.maxLength,
    this.style,
    required this.labelText,
    this.onTextChange,
    this.textInputType,
    this.controller,
    this.hintText,
    this.inputFormatters,
    this.showSuffixIcon = true,
    this.onSubmitted,
    this.autofillHints,
    this.textCapitalization = TextCapitalization.none,
  });
}
