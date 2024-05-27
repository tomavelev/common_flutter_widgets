import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform/get_platform.dart';

class CTextField extends StatelessWidget {
  final TextEditingController? controller;
  const CTextField({
    super.key,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    if (isApple()) {
      return CupertinoTextField(
        controller: controller,
      );
    }
    return TextFormField(
      controller: controller,
    );
  }
}
