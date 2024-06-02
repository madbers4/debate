import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class ScreenLayout extends StatelessWidget {
  final Widget bodyContent;
  final Widget? leftTopContent;
  final Widget? rightTopContent;
  final Widget? leftBottomContent;
  final Widget? rightBottomContent;
  final Widget? topCenterContant;
  final AssetImage? background;

  const ScreenLayout({
    super.key,
    required this.bodyContent,
    this.leftTopContent,
    this.rightTopContent,
    this.leftBottomContent,
    this.rightBottomContent,
    this.topCenterContant,
    this.background,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              // color: Color.fromARGB(0, 0, 0, 0)
              // backgroundBlendMode: BlendMode.plus,
              // color: Colors.white
              // image: DecorationImage(
              //     image: Svg('assets/images/background.svg'),
              //     repeat: ImageRepeat.repeat,
              //     fit: BoxFit.none)
              image: DecorationImage(
                  image: AssetImage('assets/images/test-background.png'),
                  repeat: ImageRepeat.noRepeat,
                  fit: BoxFit.fitWidth)),
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
          child: rightBottomContent != null ? rightBottomContent! : Container(),
        ),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: bodyContent,
        ),
      ],
    );
  }
}
