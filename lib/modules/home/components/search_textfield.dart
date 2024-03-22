import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:take_home_assignment/style/app_colors.dart';
import 'package:take_home_assignment/style/app_text_styles.dart';

class SearchTextField extends StatelessWidget {

  const SearchTextField({
    this.readOnly = false,
    this.showCursor = true,
    this.initialValue,
    this.controller,
    this.keyboardType,
    this.hint,
    this.titleLabel = '',
    this.validator,
    this.obscure = false,
    this.textInputAction,
    this.autofocus = false,
    this.maxLength,
    this.focusNode,
    this.enableInteractiveSelection = true,
    this.onChanged,
    this.passwordTrailingIcons,
    this.prefixIcon,
    this.suffixIcon,
    this.obscuringCharacter,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onTap,
    this.autocorrect = false,
    this.enableSuggestions = false,
    this.enabled = true,
    this.inputFormatters,
    this.focusedBorderColor,
    this.enabledBorderColor,
    this.enableBoderWidth,
    this.labelColor,
    this.fillColor,
    this.cursorColor,
    this.textCapitalization = TextCapitalization.none,
    this.isDropDown = false,
    this.borderRadius = 4,
    this.style,
    this.hintStyle,
    this.addPadding = true,
  });
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final String? hint;
  final String? titleLabel;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final bool obscure;
  final bool autofocus;
  final bool enableInteractiveSelection;
  final bool isDropDown;
  final bool? passwordTrailingIcons;
  final bool autocorrect;
  final bool enableSuggestions;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function? validator;
  final Function? onChanged;
  final Function? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final Function? onTap;
  final String? initialValue;
  final String? obscuringCharacter;
  final bool readOnly;
  final bool showCursor;
  final bool enabled;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final Color? labelColor;
  final Color? fillColor;
  final Color? cursorColor;
  final double? enableBoderWidth;
  final double borderRadius;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final bool addPadding;

  @override
  Widget build(BuildContext context) => Container(
        padding:
            addPadding ? const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0.0) : null,
        child: TextFormField(
          enabled: enabled,
          initialValue: initialValue,
          controller: controller,
          obscureText: obscure,
          obscuringCharacter: obscuringCharacter ?? '•',
          keyboardType: keyboardType,
          style: style ?? AppTextStyles.regular(14.0, AppColors.black),
          textInputAction: textInputAction,
          autofocus: autofocus,
          enableInteractiveSelection: enableInteractiveSelection,
          validator: validator as String? Function(String?)?,
          maxLength: maxLength,
          onSaved: (String? value) {
            controller!.text = value!;
          },
          focusNode: focusNode,
          cursorColor: cursorColor ?? AppColors.purple,
          autocorrect: autocorrect,
          enableSuggestions: enableSuggestions,
          readOnly: readOnly,
          showCursor: showCursor,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            fillColor: fillColor,
            filled: fillColor != null,
            labelText: titleLabel,
            labelStyle: TextStyle(
              color: labelColor,
              backgroundColor: AppColors.white,
              letterSpacing: 0,
            ),
            hintStyle: hintStyle ??
                AppTextStyles.regular(14.0, AppColors.color737373),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(
                color: AppColors.darkRed,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: enabledBorderColor!,
                width: enableBoderWidth!,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: enabledBorderColor!,
                width: enableBoderWidth!,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: focusedBorderColor!,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(
                color: AppColors.darkRed,
              ),
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
          onChanged: onChanged as void Function(String)?,
          onEditingComplete: onEditingComplete as void Function()?,
          onFieldSubmitted: onFieldSubmitted,
          onTap: onTap as void Function()?,
          inputFormatters: inputFormatters,
          textCapitalization: textCapitalization,
        ),
      );
}
