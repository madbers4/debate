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
  final Map<String, Widget>? overlays;
  final String? activeOverlayId;

  const ScreenLayout(
      {super.key,
      required this.bodyContent,
      this.leftTopContent,
      this.rightTopContent,
      this.leftBottomContent,
      this.rightBottomContent,
      this.topCenterContant,
      this.background,
      this.overlays,
      this.activeOverlayId});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: <Widget>[
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
          duration: const Duration(milliseconds: 2000),
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
        TransparentPointer(
          transparent: activeOverlayId == null,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 1000),
            opacity: activeOverlayId != null ? 0.75 : 0,
            child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.black)),
          ),
        ),
        ...(overlays?.entries.map((MapEntry<String, Widget> entry) {
              return TransparentPointer(
                  transparent: activeOverlayId != entry.key,
                  child: AnimatedOpacity(
                    opacity: activeOverlayId == entry.key ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 1000),
                    child: activeOverlayId == entry.key
                        ? entry.value
                        : Container(),
                  ));
            }) ??
            [])
      ],
    );
  }
}
