import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:v1/client/features/game/widgets/description/Description.dart';
import 'package:v1/client/features/game/widgets/title/Title.dart';

class TitleStageBody extends StatelessWidget {
  final String title;
  final String description;
  final bool isDescriptionShowed;

  const TitleStageBody(
      {super.key,
      required this.title,
      required this.description,
      required this.isDescriptionShowed});

  @override
  Widget build(BuildContext context) {
    const double titleStartPos = 270;
    const double titleEndPos = 100;
    const double textStartPos = 500;
    const double textEndPos = 200;

    return Center(
      child: Stack(
        children: <Widget>[
          // Анимированное позиционирование для заголовка
          AnimatedPositioned(
            duration: Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
            top: isDescriptionShowed ? titleEndPos : titleStartPos,
            left: 0,
            right: 0,
            child: Center(
              child: GameTitle(
                child: title,
              ),
            ),
          ),
          // Анимированное позиционирование для описания

          AnimatedPositioned(
            duration: Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
            top: isDescriptionShowed ? textEndPos : textStartPos,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 1000),
              opacity: isDescriptionShowed ? 1.0 : 0.0,
              child: Center(
                child: GameDescription(
                  child: description,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
