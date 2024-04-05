import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class OTPColumnWidget extends StatefulWidget {
  const OTPColumnWidget({
    super.key,
    required this.controllers,
  });
  final List<TextEditingController> controllers;
  @override
  State<OTPColumnWidget> createState() => _OTPColumnWidgetState();
}

class _OTPColumnWidgetState extends State<OTPColumnWidget> {
  @override
  void dispose() {
    super.dispose();
    for (var controller in widget.controllers) {
      controller.dispose();
    }
  }

  void _handleTextChanged(int index, String value) {
    if (value.isNotEmpty && index < widget.controllers.length - 1) {
      FocusScope.of(context).nextFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        6,
        (index) => Container(
          width: 46.0,
          height: 48.0,
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextFormField(
            autofocus: true,
            controller: widget.controllers[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            style: const TextStyle(
              color: CustomColors.red,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            onChanged: (value) => _handleTextChanged(index, value),
            decoration: InputDecoration(
              border: InputBorder.none,
              counterText: '',
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
