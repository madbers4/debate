import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:transparent_pointer/transparent_pointer.dart';
import 'package:v1/client/colors.dart';
import 'package:v1/client/features/game/widgets/cards/FactCard.dart';
import 'package:v1/client/features/game/widgets/title/Title.dart';
import 'package:v1/client/features/rooms/RoomsState.dart';
import 'package:v1/client/widgets/game-card/GameCardWidget.dart';
import 'package:v1/common/features/player/Defendant.dart';
import 'package:v1/common/features/scenario/ScenarioAct.dart';
import 'package:v1/common/features/scenario/ScenarioActId.dart';

class ActTileV2 extends StatelessWidget {
  final ActId actId;
  final ScenarioAct event;
  final bool isShowed;
  final List<String> hiddenIds;

  const ActTileV2(
      {super.key,
      required this.actId,
      required this.event,
      required this.isShowed,
      required this.hiddenIds});

  @override
  Widget build(BuildContext context) {
    final roomsState = context.watch<RoomsState>();

    const double width = 550;
    const double titleTopMargin = 80;
    const double descriptionTopMargin = titleTopMargin + 45;
    const double cardsTopMargin = descriptionTopMargin + 160;

    return Positioned(
      top: 0,
      left: 0,
      width: width,
      height: 650,
      child: AnimatedOpacity(
        opacity: isShowed ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 750),
        child: Stack(
          children: [
            Positioned(
              top: titleTopMargin,
              left: 0,
              width: width,
              child: GameTitle(
                child: event.title,
                fontSize: 18,
              ),
            ),
            Positioned(
              top: descriptionTopMargin,
              left: 0,
              width: width,
              child: Text(
                event.description,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: whiteColor, fontFamily: 'Genshin', fontSize: 14),
              ),
            ),
            Positioned(
              top: cardsTopMargin,
              left: 0,
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: event.events.indexed
                    .map((e) {
                      final index = e.$1;
                      final value = e.$2;
                      final List<Widget> res = [];

                      if (index != 0) {
                        res.add(const SizedBox(
                          width: 10,
                        ));
                      }

                      final isSelected =
                          hiddenIds.any((element) => element == value.id);
                      final isDisabled =
                          roomsState.selectedRole is! Defendant ||
                              !isShowed ||
                              isSelected;

                      res.add(TransparentPointer(
                        transparent: !isShowed,
                        child: FactCard(
                          fact: value,
                          size: GameCardWidgetSize.S267,
                          isTransparent: isSelected,
                          isDisabled: isDisabled,
                          isCardCardFlipped: isDisabled ? false : null,
                        ),
                      ));
                      return res;
                    })
                    .expand((e) => e)
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
