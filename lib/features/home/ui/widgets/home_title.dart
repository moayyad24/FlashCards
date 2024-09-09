import 'package:flutter/material.dart';


class HomeTitle extends StatelessWidget {
  const HomeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 15),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          'Home',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
