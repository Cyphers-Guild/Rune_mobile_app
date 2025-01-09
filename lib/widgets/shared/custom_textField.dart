import 'package:flutter/material.dart';
import 'package:country_state_city/models/country.dart';
import 'package:rune/imports.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final Color? bgColor;
  final bool? filled;
  final TextEditingController? controller;
  final bool isDropdown;
  final Widget? suffixIcon;
  final List<Country>? dropdownItems;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool? obscureText;
  final int? maxLength;
  final String? helperText;
  final String? hintText;
  final String? prefixText;
  final String? suffixText;
  final bool readOnly;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Function()? onTap;
  final EdgeInsetsGeometry? contentPadding;

  const CustomTextField({
    super.key,
    this.controller,
    this.label,
    this.bgColor,
    this.filled,
    this.suffixIcon,
    this.isDropdown = false,
    this.dropdownItems,
    this.keyboardType,
    this.textInputAction,
    this.obscureText,
    this.maxLength,
    this.helperText,
    this.hintText,
    this.readOnly = false,
    this.prefixText,
    this.suffixText,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    if (isDropdown) {
      return DropdownButtonFormField<String>(
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          fillColor:
              filled != null && bgColor != null ? bgColor : Colors.transparent,
          filled: filled ?? false,
          contentPadding:
              contentPadding ?? const EdgeInsets.symmetric(horizontal: 10),
        ),
        dropdownColor: bgColor ?? Colors.white,
        hint: Text(
          hintText ?? (label ?? 'Select an option'),
          style: const TextStyle(fontSize: 13),
        ),
        items: dropdownItems?.map((item) {
          return DropdownMenuItem<String>(
            value: item.isoCode,
            child: Text(
              item.name,
              style: const TextStyle(fontSize: 13),
            ),
          );
        }).toList(),
        onChanged: (value) {
          // Handle the selected value
          print('Selected: $value');
          if (onChanged != null) {
            onChanged!(value ?? '');
          }
        },
      );
    } else {
      return TextField(
        controller: controller,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        obscureText: obscureText ?? false,
        maxLength: maxLength,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        readOnly: readOnly,
        onTap: onTap,
        style: TextStyle(color: AppConstant.bgColor),
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          fillColor:
              filled != null && bgColor != null ? bgColor : Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          helperText: helperText,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: TextStyle(color: AppConstant.bgColor, fontSize: 14),
          prefixText: prefixText,
          contentPadding: contentPadding ?? const EdgeInsets.all(10),
          filled: filled ?? false,
        ),
      );
    }
  }
}
