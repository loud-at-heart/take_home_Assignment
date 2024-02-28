import 'package:flutter/material.dart';
import 'package:take_home_assignment/style/app_colors.dart';
import 'package:take_home_assignment/style/app_text_styles.dart';

class PaymentKeyboard extends StatelessWidget {
  PaymentKeyboard({
    required this.onTextInput,
    required this.onBackspace,
  });

  final ValueSetter<String> onTextInput;
  final VoidCallback onBackspace;

  void _textInputHandler(String text) => onTextInput.call(text);

  void _backspaceHandler() => onBackspace.call();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      decoration: BoxDecoration(
        color: AppColors.colorD9D9D9,
      ),
      child: Column(
        children: [
          buildRowOne(),
          buildRowTwo(),
          buildRowThree(),
          buildRowFour(),
        ],
      ),
    );
  }

  Expanded buildRowOne() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: '1',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '2',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '3',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }

  Expanded buildRowTwo() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: '4',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '5',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '6',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }

  Expanded buildRowThree() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: '7',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '8',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '9',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }

  Expanded buildRowFour() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: '.',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '0',
            onTextInput: _textInputHandler,
          ),
          BackspaceKey(
            onBackspace: _backspaceHandler,
          ),
        ],
      ),
    );
  }
}

class TextKey extends StatelessWidget {
  const TextKey({
    required this.text,
    required this.onTextInput,
    this.flex = 1,
  });

  final String text;
  final ValueSetter<String> onTextInput;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(0.5),
        child: Material(
          color: AppColors.white,
          child: InkWell(
            onTap: () {
              onTextInput.call(text);
            },
            child: Container(
              child: Center(
                  child: Text(
                text,
                style: AppTextStyles.regular(22, AppColors.color454545),
              ),),
            ),
          ),
        ),
      ),
    );
  }
}

class BackspaceKey extends StatelessWidget {
  const BackspaceKey({
    required this.onBackspace,
    this.flex = 1,
  });

  final VoidCallback onBackspace;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(0.5),
        child: Material(
          color: AppColors.white,
          child: InkWell(
            onTap: () {
              onBackspace.call();
            },
            child: Container(
              child: Center(
                child: Icon(
                  Icons.backspace_outlined,
                  color: AppColors.color454545,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
