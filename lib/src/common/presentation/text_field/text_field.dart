import 'package:flutter/material.dart';
import 'package:sys_gallery/src/common/presentation/text_field/custom_text_field.dart';
import 'package:sys_gallery/src/constants/app_colors_constants.dart';
import 'package:sys_gallery/src/constants/text_constants.dart';

class TextCustomTextField extends CustomTextField {
  const TextCustomTextField({
    super.key,
    super.labelText,
    super.hintText,
    super.onTextChange,
    super.validator,
    super.controller,
    super.maxLength,
    super.style,
    TextInputType inputType = TextInputType.text,
    super.inputFormatters,
    super.autofillHints,
    super.textCapitalization,
  }) : super(textInputType: inputType);

  @override
  State<TextCustomTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<TextCustomTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = widget.style ?? AppStyles.contentTextStyle(context).copyWith(fontWeight: FontWeight.w400);

    return TextFormField(
      keyboardType: widget.textInputType,
      textInputAction: TextInputAction.next,
      textCapitalization: widget.textCapitalization,
      validator: widget.validator,
      onChanged: (value) {
        widget.onTextChange?.call(value);
      },
      autofillHints: widget.autofillHints,
      controller: _controller,
      maxLength: widget.maxLength,
      cursorColor: Theme.of(context).colorScheme.onSurface,
      decoration: AppStyles.textFieldInputDecoration(context).copyWith(
        labelText: widget.labelText,
        hintText: widget.hintText,
        labelStyle: AppStyles.captionTextStyle(context).copyWith(color: kCharcoalPrimary),
      ),
      style: textStyle,
      inputFormatters: widget.inputFormatters,
    );
  }
}
