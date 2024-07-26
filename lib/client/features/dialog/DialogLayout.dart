import 'package:flutter/material.dart';

class DialogLayout extends StatelessWidget {
  final Widget bodyContent;
  final Widget? leftTopContent;
  final Widget? rightTopContent;
  final Widget? leftBottomContent;
  final Widget? rightBottomContent;
  final Widget? topCenterContant;
  final Widget? bottomCenterContant;
  final AssetImage? background;
  // final bool? whiteBackground;

  const DialogLayout({
    super.key,
    required this.bodyContent,
    this.leftTopContent,
    this.rightTopContent,
    this.leftBottomContent,
    this.rightBottomContent,
    this.topCenterContant,
    this.bottomCenterContant,
    this.background,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        Positioned(
            top: 40,
            left: 40,
            child: leftTopContent != null ? leftTopContent! : Container()
            // Icon(Icons.menu, color: Colors.white), // Пример элемента в углу
            ),
        Positioned(
            top: 40,
            right: 45,
            child: rightTopContent != null ? rightTopContent! : Container()),
        Positioned(
          bottom: 10,
          left: 40,
          child: leftBottomContent != null ? leftBottomContent! : Container(),
        ),
        Positioned(
          bottom: 10,
          right: 40,
          child: rightBottomContent != null ? rightBottomContent! : Container(),
        ),
        Positioned(
            bottom: 10,
            child: bottomCenterContant != null
                ? Center(child: bottomCenterContant!)
                : Container()),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: bodyContent,
        ),
      ],
    );
  }
}
