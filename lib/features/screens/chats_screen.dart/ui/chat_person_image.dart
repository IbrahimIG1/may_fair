import 'package:flutter/material.dart';

class ChatPersonImage extends StatelessWidget {
  final double raduis;
  final String image;

  const ChatPersonImage({super.key, required this.raduis, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: raduis,
      height: raduis,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: .5, color: Colors.black26),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
