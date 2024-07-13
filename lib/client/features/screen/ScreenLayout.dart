import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:starsview/config/MeteoriteConfig.dart';
import 'package:starsview/config/StarsConfig.dart';
import 'package:starsview/starsview.dart';
import 'package:transparent_pointer/transparent_pointer.dart';
import 'package:v1/client/features/screen/ScreenBackground.dart';

class ScreenLayout extends StatelessWidget {
  final Widget bodyContent;
  final Widget? leftTopContent;
  final Widget? rightTopContent;
  final Widget? leftBottomContent;
  final Widget? rightBottomContent;
  final Widget? topCenterContant;
  final String? background;

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
        TransparentPointer(
            child: ScreenBackground(
                src:
                    'assets/images/${background != null && background != 'black' ? background : 'test-brown-background.png'}')),
        const TransparentPointer(
            child: StarsView(
          fps: 20,
          meteoriteConfig: MeteoriteConfig(
            enabled: false,
          ),
          starsConfig: StarsConfig(starCount: 20),
        )),

        AnimatedOpacity(
          duration: Duration(milliseconds: 2000),
          opacity: background == 'black' ? 1.0 : 0,
          child: TransparentPointer(
              child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.black))),
        ),
        // const ScreenStarry(),

        Padding(
          padding: const EdgeInsets.all(50.0),
          child: bodyContent,
        ),
        Positioned(
            top: 40,
            left: 45,
            child: leftTopContent != null ? leftTopContent! : Container()
            // Icon(Icons.menu, color: Colors.white), // Пример элемента в углу
            ),
        Positioned(
            top: 40,
            right: 45,
            child: rightTopContent != null ? rightTopContent! : Container()),
        Positioned(
          bottom: 40,
          left: 45,
          child: leftBottomContent != null ? leftBottomContent! : Container(),
        ),
        Positioned(
          bottom: 40,
          right: 45,
          child: rightBottomContent != null ? rightBottomContent! : Container(),
        ),
        // Positioned(
        //   top: 0,
        //   left: 0,
        //   child: Container(
        //       width: MediaQuery.of(context).size.width,
        //       height: MediaQuery.of(context).size.height,
        //       decoration: BoxDecoration(
        //           border: Border.all(
        //         color: blueColor,
        //         width: 40,
        //       )),
        //       child: const ClipRect(
        //         child: Text('432'),
        //       )),
        // ),
      ],
    );
  }
}
