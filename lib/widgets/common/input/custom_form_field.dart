import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transporter/values/colors.dart';
import 'package:transporter/values/dimensions.dart';

enum FieldType { password, email, textArea, textField }

abstract class _Constants {
  static const double _defaultTextFieldHeight = 60;
  static const double _defaultTextAreaHeight = 120;
}

class TFormField extends StatefulWidget {
  const TFormField({
    required this.controller,
    required this.fieldType,
    required this.labelText,
    required this.validator,
    super.key,
    this.isObscured = false,
    this.hasSuffixIcon = false,
    this.suffixIconAsset,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.prefixIconAsset,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16),
    this.hintText,
    this.labelStyle,
    this.isBorderEnabled = true,
  });
  final TextEditingController controller;
  final FieldType fieldType;
  final String labelText;
  final String? Function(String?) validator;
  final bool isObscured;
  final bool hasSuffixIcon;
  final String? suffixIconAsset;
  final IconButton? suffixIcon;
  final VoidCallback? onSuffixIconPressed;
  final String? prefixIconAsset;
  final EdgeInsetsGeometry contentPadding;
  final String? hintText;
  final TextStyle? labelStyle;
  final bool isBorderEnabled;

  @override
  _TFormFieldState createState() => _TFormFieldState();
}

class _TFormFieldState extends State<TFormField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.fieldType == FieldType.textArea
          ? _Constants._defaultTextAreaHeight
          : _Constants._defaultTextFieldHeight,
      child: TextFormField(
        expands: widget.fieldType == FieldType.textArea,
        maxLines: widget.fieldType == FieldType.textArea ? null : 1,
        controller: widget.controller,
        obscureText: widget.isObscured,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: widget.labelText,
          labelStyle: widget.labelStyle,
          contentPadding: widget.contentPadding,
          border: widget.isBorderEnabled
              ? const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.tLightGrey),
                  borderRadius: BorderRadius.all(
                    Radius.circular(Dimensions.radiusDefault),
                  ),
                )
              : InputBorder.none,
          enabledBorder: widget.isBorderEnabled
              ? const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.tLightGrey),
                  borderRadius: BorderRadius.all(
                    Radius.circular(Dimensions.radiusDefault),
                  ),
                )
              : InputBorder.none,
          focusedBorder: widget.isBorderEnabled
              ? const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.tLightGreen),
                  borderRadius: BorderRadius.all(
                    Radius.circular(Dimensions.radiusDefault),
                  ),
                )
              : InputBorder.none,
          prefixIcon: widget.prefixIconAsset != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: SvgPicture.asset(
                    widget.prefixIconAsset!,
                  ),
                )
              : null,
          suffixIcon: widget.hasSuffixIcon
              ? widget.suffixIcon
              : widget.suffixIconAsset != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: SvgPicture.asset(
                        widget.suffixIconAsset!,
                      ),
                    )
                  : null,
        ),
        validator: widget.validator,
      ),
    );
  }
}
