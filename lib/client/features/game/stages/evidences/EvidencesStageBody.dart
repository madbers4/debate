import 'package:flutter/material.dart';
import 'package:v1/client/features/game/widgets/cards/EvidenceCard.dart';
import 'package:v1/client/features/game/widgets/title/Title.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioEvedence.dart';

class EvidencesStageBody extends StatelessWidget {
  final List<ScenarioEvedence> evidences;

  const EvidencesStageBody({super.key, required this.evidences});

  @override
  Widget build(BuildContext context) {
    const double titleEndPos = 100.0;

    return Center(
      child: Stack(
        children: <Widget>[
          // Анимированное позиционирование для заголовка
          const AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            top: titleEndPos,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  GameTitle(
                    child: 'Улики',
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // GameDescription(
                  //   child: description,
                  // )
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
            top: titleEndPos + 60,
            left: 0,
            right: 0,
            child: Visibility(
              // Visibility виджет управляет видимостью описания
              visible: true,
              child: Center(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: evidences.indexed
                          .map((e) {
                            final index = e.$1;
                            final value = e.$2;
                            final List<Widget> res = [];

                            if (index != 0) {
                              res.add(SizedBox(
                                width: 10,
                              ));
                            }
                            res.add(EvidenceCard(evedence: value));
                            return res;
                          })
                          .expand((e) => e)
                          .toList(),
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
