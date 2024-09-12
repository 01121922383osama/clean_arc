import 'package:flutter/material.dart';

extension NavigatorToPage on BuildContext {
  void push({required Widget page}) {
    Navigator.push(
      this,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void pushReplacement({required Widget page}) {
    Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void pushAndRemoveUntil({required Widget widget}) {
    Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );
  }

  void pop() {
    Navigator.pop(this);
  }

  void pushNamed({required String pageRoute}) {
    Navigator.pushNamed(this, pageRoute);
  }

  void pushReplacementNamed({required String pageRoute}) {
    Navigator.pushReplacementNamed(
      this,
      pageRoute,
    );
  }

  void pushNamedAndRemoveUntil({required String pageRoute}) {
    Navigator.pushNamedAndRemoveUntil(
      this,
      pageRoute,
      (route) => false,
    );
  }
}
