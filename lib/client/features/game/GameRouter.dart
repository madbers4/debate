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
    // TODO: REPLACE THIS
    // initialLocation: '/debates/no',
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
                context, state, const ActStage(actId: ActId.One));
          }),
      GoRoute(
          path: '/act/2/:direction',
          pageBuilder: (context, state) {
            return createSliderBuilder(
                context, state, const ActStage(actId: ActId.Two));
          }),
      GoRoute(
          path: '/act/3/:direction',
          pageBuilder: (context, state) {
            return createSliderBuilder(
                context, state, const ActStage(actId: ActId.Three));
          }),
      GoRoute(
          path: '/act/4/:direction',
          pageBuilder: (context, state) {
            return createSliderBuilder(
                context, state, const ActStage(actId: ActId.Four));
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
