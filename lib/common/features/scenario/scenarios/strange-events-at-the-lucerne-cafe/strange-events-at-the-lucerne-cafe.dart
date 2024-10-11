import 'package:v1/common/features/scenario/Scenario.dart';
import 'package:v1/common/features/scenario/ScenarioAct.dart';
import 'package:v1/common/features/scenario/ScenarioActId.dart';
import 'package:v1/common/features/scenario/ScenarioDescription.dart';
import 'package:v1/common/features/scenario/defendant/ScenarioDefendant.dart';
import 'package:v1/common/features/scenario/defendant/ScenarioDefendantOrigin.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioEvedence.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioTruthyEvedence.dart';
import 'package:v1/common/features/scenario/event/ScenarioEvent.dart';
import 'package:v1/common/features/scenario/event/ScenarioFalsyEvent.dart';
import 'package:v1/common/features/scenario/transitionEvent/TransitionEvent.dart';
import 'package:v1/common/features/scenario/transitionEvent/effects/TransitionEventAddEvedenceEffect.dart';

import 'package:v1/common/features/scenario/transitionEvent/effects/TransitionEventRemoveEvedenceEffect.dart';
import 'package:v1/common/utils/generateUID.dart';

final Scenario strangeEventsAtTheLucerneCafe = Scenario(
    id: generateUID(),
    description: ScenarioDescription(
      id: generateUID(),
      background: 'cafe-backgound.png',
      title: 'Шпионская тень: Кафе «Лютес»',
      description:
          'Срочные новости! Мелюзина-жандарм была задержана по подозрению в том, что она является Шпионской тенью. Ее поймали с поличным, когда она пыталась установить прослушивающие устройства в клубничный торт около кафе «Лютес».',
    ),
    defendant: ScenarioDefendant(
        id: generateUID(),
        background: 'miluzina-background.png',
        name: 'Мелюзина',
        description:
            'Вы — Мелюзина-жандарм.\n\nНа утреннем патруле вы проходили мимо кафе «Лютес» и краем глаза увидели восхитительный клубничный торт. Вы подошли к нему поближе, чтобы рассмотреть, но заметили, что он тает на солнце! Вы попытались перенести его в тень, но металлический поднос, на котором он стоял, сильно нагрелся и чуть не обжег вас. От неожиданности вы выронили его из рук вместе с тортом, стоящем на нем.',
        bornOrigin: ScenarioDefendantOrigin(
          id: generateUID(),
          title: 'Происхождение',
          description: 'Мелюзина, живущая среди людей в Кур-де-Фонтейне.',
          additionalTitle: '',
        ),
        professionOrigin: ScenarioDefendantOrigin(
          id: generateUID(),
          title: 'Профессия',
          description: 'Жандарм.',
        ),
        secretOrigin: ScenarioDefendantOrigin(
          id: generateUID(),
          title: 'Секрет',
          description: 'Любит клубничные торты больше всего на свете.',
        )),
    acts: [
      ScenarioAct(
          id: actOneId,
          title: 'Как гром среди ясного неба',
          description:
              'Шарлотта сфотографировала упавший торт и растерянную мелюзину.',
          events: [
            ScenarioEvent(
                id: 'Торт',
                title: 'Торт',
                description: 'Новый популярный десерт — клубничный торт.'),
            ScenarioEvent(
                id: 'Сила гравитации',
                title: 'Сила гравитации',
                description:
                    'Торт упал, разлетевшись на мелкие кусочки и запачкав все вокруг кремом.'),
            ScenarioFalsyEvent(
                id: 'Докопаться до мелочей',
                title: 'Докопаться до мелочей',
                description:
                    'Если присмотреться, то на фотографии заметны жучки, измазанные в торте.'),
          ]),
      ScenarioAct(
          id: actTwoId,
          title: 'Жучки? В моем торте?',
          description:
              'Действительно, спрятать прослушивающие устройства в торте, не испачкавшись при этом в креме, было бы сложно. Однако факт остается фактом, и подсудимая была несомненно поймана за установкой жучков! У шпионской тени наверняка ',
          events: [
            ScenarioEvent(
                id: 'Шпионская тень',
                title: 'Шпионская тень',
                description: 'Преступник, промышлявший продажей сплетен.'),
            ScenarioFalsyEvent(
                id: 'Внимание к деталям',
                title: 'Внимание к деталям',
                description:
                    'На фотографии Шарлотты можно увидеть, что жучки запечены в бисквите торта.'),
            ScenarioEvent(
              id: 'Шедевр кондитера.',
              title: 'Шедевр кондитера',
              description:
                  'Торт был украшен аккуратными пастельно-розовыми цветочками клубники, сделанными из ванильного крема.',
            ),
          ]),
      ScenarioAct(
          id: actThreeId,
          title: 'Страх',
          description:
              'Лиония предусмотрела этот вопрос и считает, что мелюзина, явно будучи злостным преступником, который держит в страхе весь город, могла бы проникнуть на кухню кафе и подбросить жучки в муку или само тесто.',
          events: [
            ScenarioEvent(
                id: generateUID(),
                title: 'Отсейте всё невозможное',
                description:
                    'Мука обычно просеивается перед добавлением в тесто.'),
            ScenarioEvent(
                id: 'Мания преследования',
                title: 'Мания преследования',
                description:
                    'В последнее время Лиония жаловалась на то, что она постоянно находит везде жучки.'),
            ScenarioFalsyEvent(
                id: 'Алиби?',
                title: 'Алиби?',
                description:
                    'Вечером, за день до своего ареста, мелюзина была в патруле.'),
          ]),
    ],
    evedences: [
      ScenarioTruthyEvedence(
          id: 'Руки',
          title: 'Руки',
          falsyEventIds: ['Докопаться до мелочей'],
          falsyDescription:
              'Руки мелюзины чисты, как и её совесть. Она не могла установить жучки в торт, не запачкав руки в подтаявшем креме торта. ',
          triggeredTransitionId: 'Руки мелюзины чисты',
          description: 'На фото видно, что руки мелюзины чистые. '),
      ScenarioEvedence(
          id: 'Расстояние',
          title: 'Расстояние',
          description:
              'На фото видно, что мелюзина стоит достаточно далеко от торта.'),
      ScenarioEvedence(
          id: 'Блик',
          title: 'Блик',
          description:
              'Часть фото было испорчено из-за блика солнца, отраженного от подноса.'),
    ],
    transitionEvents: [
      TransitionEvent(id: 'Руки мелюзины чисты', nextActId: actTwoId, effects: [
        TransitionEventRemoveEvedenceEffect(
            id: generateUID(), evedenceIds: ['Расстояние', 'Блик']),
        TransitionEventAddEvedencesEffect(
          id: generateUID(),
          evedences: [
            ScenarioTruthyEvedence(
                id: 'Технология приготовления',
                title: 'Технология приготовления',
                falsyEventIds: ['Внимание к деталям'],
                falsyDescription:
                    'Чтобы жучки запеклись в бисквите, мелюзина должна была положить их в тесто за день до того, как она случайно уронила торт.',
                triggeredTransitionId: 'Технология приготовления',
                description:
                    'По рецепту торта бисквит должен остывать 2 часа и пропитываться сиропом всю ночь перед подачей.'),
          ],
        ),
      ]),
      TransitionEvent(
          id: 'Технология приготовления',
          nextActId: actThreeId,
          effects: [
            TransitionEventAddEvedencesEffect(
              id: generateUID(),
              evedences: [
                ScenarioTruthyEvedence(
                    id: 'Отчет',
                    title: 'Отчет',
                    falsyEventIds: ['Алиби?'],
                    falsyDescription:
                        'Отчет является алиби к тому, что во время приготовления торта мелюзина не могла подложить жучки.',
                    triggeredTransitionId:
                        'Игра завершается невиновностью игрока.',
                    description:
                        'Мелюзина весь вечер вместе со своим коллегой снимала котенка с дерева на (…) улице, которая находится на другом конце города.'),
              ],
            ),
          ]),
      TransitionEvent(
          id: 'Игра завершается невиновностью игрока.',
          endGame: true,
          effects: []),
    ]);
