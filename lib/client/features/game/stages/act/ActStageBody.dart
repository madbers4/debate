import 'package:flutter/material.dart';

import 'package:v1/client/features/game/widgets/cards/FactCard.dart';
import 'package:v1/client/features/game/widgets/description/Description.dart';
import 'package:v1/client/features/game/widgets/title/Title.dart';
import 'package:v1/common/features/scenario/fact/ScenarioFact.dart';

class ActStageBody extends StatelessWidget {
  final String actTitle;
  final String title;
  final String description;
  final bool isCardsShowed;
  final ScenarioFact firstCard;
  final ScenarioFact secondCard;
  final ScenarioFact thirdCard;
  final bool isFirstCardShowed;
  final bool isSecondCardShowed;
  final bool isThirdCardShowed;

  const ActStageBody({
    super.key,
    required this.actTitle,
    required this.title,
    required this.description,
    required this.isCardsShowed,
    required this.firstCard,
    required this.secondCard,
    required this.thirdCard,
    required this.isFirstCardShowed,
    required this.isSecondCardShowed,
    required this.isThirdCardShowed,
  });

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
            top: isCardsShowed ? titleEndPos : titleStartPos,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  GameTitle(
                    child: actTitle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GameTitle(
                    child: title,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GameDescription(
                    child: description,
                  )
                ],
              ),
            ),
          ),
          // SizedBox(
          //   height: 50,
          // ),
          // Карты
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            top: isCardsShowed
                ? titleEndPos + 60
                : titleStartPos +
                    500, // смещаем описание ниже, если _showDescription true
            left: 0,
            right: 0,
            child: Visibility(
              // Visibility виджет управляет видимостью описания
              visible: isCardsShowed,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FactCard(
                          fact: firstCard,
                          isCardCardFlipped: true,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        FactCard(
                          fact: secondCard,
                          isCardCardFlipped: true,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        FactCard(fact: thirdCard, isCardCardFlipped: true),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
