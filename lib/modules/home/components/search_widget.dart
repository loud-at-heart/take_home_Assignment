import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:take_home_assignment/modules/home/components/search_textfield.dart';
import 'package:take_home_assignment/style/app_colors.dart';
import 'package:take_home_assignment/style/app_text_styles.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    super.key,
    this.onChanged,
    this.onDebounceStart,
  });

  final ValueSetter<String?>? onChanged;
  final VoidCallback? onDebounceStart;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final FocusNode _searchFocus = FocusNode();

  Color get themePrimary => AppColors.purple;

  Color get placeholderColor => AppColors.color737373;

  Timer? _debounce;

  @override
  void initState() {
    _searchFocus.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    widget.onDebounceStart?.call();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      widget.onChanged?.call(query);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchTextField(
      focusNode: _searchFocus,
      textInputAction: TextInputAction.search,
      inputFormatters: [
        LengthLimitingTextInputFormatter(256),
        FilteringTextInputFormatter.allow(RegExp(r'^(?! )[A-Za-z ]*')),
      ],
      onChanged: _onSearchChanged,
      style: AppTextStyles.regular(
        FontSize.normal,
        AppColors.color737373,
      ),
      titleLabel: _searchFocus.hasFocus ? "GIF" : "What are you looking for?",
      hint: "Search for GIFs",
      hintStyle: AppTextStyles.regular(
        FontSize.normal,
        AppColors.colorB2B2B2,
      ),
      textCapitalization: TextCapitalization.words,
      labelColor: _searchFocus.hasFocus ? themePrimary : placeholderColor,
      enabledBorderColor:
          _searchFocus.hasFocus ? themePrimary : placeholderColor,
      focusedBorderColor:
          _searchFocus.hasFocus ? themePrimary : placeholderColor,
      enableBoderWidth: 2,
      addPadding: false,
    );
  }
}
