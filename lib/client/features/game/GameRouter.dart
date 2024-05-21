import 'package:go_router/go_router.dart';
import 'package:v1/client/Router.dart';
import 'package:v1/client/features/game/stages/act/ActStage.dart';
import 'package:v1/client/features/game/stages/debates/DebatesStage.dart';
import 'package:v1/client/features/game/stages/defendant/DefendantStage.dart';
import 'package:v1/client/features/game/stages/evidences/EvidencesStage.dart';
import 'package:v1/client/features/game/stages/judgement/JudgementStage.dart';
import 'package:v1/client/features/game/stages/title/TitleStage.dart';
import 'package:v1/client/features/game/stages/verdict/VerdictStage.dart';

class GameRouter {
  final router = GoRouter(
    initialLocation: '/title',
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
          path: '/act/:act/:direction',
          pageBuilder: (context, state) {
            final act = state.pathParameters['act']!;
            ActId? actId;

            switch (act) {
              case '1':
                actId = ActId.One;
                break;
              case '2':
                actId = ActId.Two;
                break;
              case '3':
                actId = ActId.Three;
                break;
              case '4':
                actId = ActId.Four;
                break;
              default:
                break;
            }

            return createSliderBuilder(
                context, state, ActStage(actId: actId ?? ActId.One));
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
