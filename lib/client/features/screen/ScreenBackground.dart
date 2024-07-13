import 'package:flutter/material.dart';

class ScreenBackground extends StatefulWidget {
  final String src;

  const ScreenBackground({super.key, required this.src});

  @override
  _ScreenBackgroundState createState() => _ScreenBackgroundState();
}

class _ScreenBackgroundState extends State<ScreenBackground>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 80),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween(begin: 1.0, end: 1.4).animate(_controller!);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRect(
        // Обрезает переключаемую анимированную область
        child: Stack(
          children: [
            AnimatedBuilder(
                animation: _animation!,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _animation!.value * 1,
                    child: child,
                  );
                },
                child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      // color: Color.fromARGB(0, 0, 0, 0)
                      // backgroundBlendMode: BlendMode.plus,
                      // color: Colors.white
                      // image: DecorationImage(
                      //     image: Svg('assets/images/background.svg'),
                      //     repeat: ImageRepeat.repeat,
                      //     fit: BoxFit.none)
                      image: DecorationImage(
                          image: AssetImage(widget.src),
                          repeat: ImageRepeat.noRepeat,
                          fit: BoxFit.fitWidth),
                    ))),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black
                      .withOpacity(0.5), // Прозрачный черный контейнер
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
