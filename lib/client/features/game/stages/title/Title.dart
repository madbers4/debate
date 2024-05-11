import 'package:flutter/material.dart';
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
    const double titleStartPos = 200.0;
    const double titleEndPos = 100.0;

    return Center(
      child: Stack(
        children: <Widget>[
          // Анимированное позиционирование для заголовка
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
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
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            top: isDescriptionShowed
                ? titleEndPos + 60
                : titleStartPos +
                    500, // смещаем описание ниже, если _showDescription true
            left: 0,
            right: 0,
            child: Visibility(
              // Visibility виджет управляет видимостью описания
              visible: isDescriptionShowed,
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
