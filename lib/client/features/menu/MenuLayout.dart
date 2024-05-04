import 'package:flutter/material.dart';

class ScreenLayout extends StatelessWidget {
  final Widget bodyContent;
  final Widget? leftTopContent;
  final Widget? rightTopContent;
  final Widget? leftBottomContent;
  final Widget? rightBottomContent;
  final AssetImage? background;

  const ScreenLayout({
    super.key,
    required this.bodyContent,
    this.leftTopContent,
    this.rightTopContent,
    this.leftBottomContent,
    this.rightBottomContent,
    this.background,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: background != null
                  ? DecorationImage(image: background!)
                  : null,
            ),
          ),
          Positioned(
              top: 20,
              left: 20,
              child: leftTopContent != null ? leftTopContent! : Container()
              // Icon(Icons.menu, color: Colors.white), // Пример элемента в углу
              ),
          Positioned(
              top: 20,
              right: 20,
              child: rightTopContent != null ? rightTopContent! : Container()),
          Positioned(
            bottom: 20,
            left: 20,
            child: leftBottomContent != null ? leftBottomContent! : Container(),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child:
                rightBottomContent != null ? rightBottomContent! : Container(),
          ),
          Center(child: bodyContent),
        ],
      ),
    );
  }
}
