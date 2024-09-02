// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntegerTextField extends StatelessWidget {
  IntegerTextField({super.key, required this.value, this.onSubmitted});

  TextEditingController value;
  ValueChanged? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        fillColor: Color.fromARGB(216, 221, 224, 222),
        filled: true,
      ),
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
      onSubmitted: onSubmitted,
      controller: value,
    );
  }
}
