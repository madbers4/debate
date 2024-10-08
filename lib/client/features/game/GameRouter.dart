import 'package:go_router/go_router.dart';
import 'package:v1/client/Router.dart';
import 'package:v1/client/features/game/stages/act/ActStage.dart';
import 'package:v1/client/features/game/stages/debates/DebatesStage.dart';
import 'package:v1/client/features/game/stages/defendant/DefendantStage.dart';
import 'package:v1/client/features/game/stages/evidences/EvidencesStage.dart';
import 'package:v1/client/features/game/stages/judgement/JudgementStage.dart';
import 'package:v1/client/features/game/stages/title/TitleStage.dart';
import 'package:v1/client/features/game/stages/verdict/VerdictStage.dart';
import 'package:v1/common/features/scenario/ScenarioActId.dart';

class GameRouter {
  final router = GoRouter(
    initialLocation: '/title/no',
    routes: [
      GoRoute(
        path: '/title/:direction',
        pageBuilder: (context, state) =>
            createSliderBuilder(context, state, const TitleStage()),
      ),
      GoRoute(
        path: '/defendant/:direction',
        pageBuilder: (context, state) =>
            createSliderBuilder(context, state, const DefendantStage()),
      ),
      GoRoute(
          path: '/act/1/:direction',
          pageBuilder: (context, state) {
            return createSliderBuilder(
                context, state, const ActStage(actId: actOneId));
          }),
      GoRoute(
        path: '/evidences/:direction',
        pageBuilder: (context, state) =>
            createSliderBuilder(context, state, const EvidencesStage()),
      ),
      GoRoute(
          path: '/debates/:direction',
          pageBuilder: (context, state) {
            return createSliderBuilder(context, state, const DebatesStage());
          }),
      GoRoute(
        path: '/judgement/:direction',
        pageBuilder: (context, state) {
          return createSliderBuilder(context, state, const JudgementStage());
        },
      ),
      GoRoute(
        path: '/verdict/:direction',
        pageBuilder: (context, state) {
          return createSliderBuilder(context, state, const VerdictStage());
        },
      ),
    ],
  );
}

final gameRouter = GameRouter().router;
