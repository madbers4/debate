import 'package:v1/common/features/scenario/Scenario.dart';
import 'package:v1/common/features/scenario/ScenarioDescription.dart';
import 'package:v1/common/features/scenario/ScenarioAct.dart';
import 'package:v1/common/features/scenario/defendant/ScenarioDefendant.dart';
import 'package:v1/common/features/scenario/defendant/ScenarioDefendantOrigin.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioEvedence.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioFalsyEvedence.dart';
import 'package:v1/common/features/scenario/event/ScenarioEvent.dart';
import 'package:v1/common/features/scenario/event/ScenarioFalsyEvent.dart';
import 'package:v1/common/utils/generateUID.dart';

final Scenario testScenario = Scenario(
    id: generateUID(),
    description: ScenarioDescription(
      id: generateUID(),
      title: 'Тестовый Сценарий',
      description: 'Основное описание тестового сценария',
    ),
    acts: [
      ScenarioAct(
          id: generateUID(),
          title: 'Тайтл Акта 1',
          description: 'Описание Акта 1',
          events: [
            ScenarioEvent(
                id: generateUID(),
                title: '1 Событие 1 Акта',
                cardType: 'Улика',
                description: 'Описание 1 События 1 Акта'),
            ScenarioEvent(
                id: generateUID(),
                title: '2 Событие 1 Акта',
                cardType: 'Событие',
                description: 'Описание 2 События 1 Акта'),
            ScenarioEvent(
                id: generateUID(),
                title: '3 Событие 1 Акта',
                cardType: 'Факт',
                description: 'Описание 3 События 1 Акта'),
          ]),
      ScenarioAct(
          id: generateUID(),
          title: 'Тайтл Акта 2',
          description: 'Описание Акта 2',
          events: [
            ScenarioEvent(
                id: generateUID(),
                title: '1 Событие 2 Акта',
                cardType: 'Улика',
                description: 'Описание 1 События 2 Акта'),
            ScenarioEvent(
                id: 'Не основное',
                title: 'Не основное',
                cardType: 'Событие',
                description: 'Не основное ложное событие'),
            ScenarioEvent(
                id: generateUID(),
                title: '3 Событие 2 Акта',
                cardType: 'Факт',
                description: 'Описание 3 События 2 Акта'),
          ]),
      ScenarioAct(
          id: generateUID(),
          title: 'Тайтл Акта 3',
          description: 'Описание Акта 3',
          events: [
            ScenarioEvent(
                id: generateUID(),
                title: '1 Событие 3 Акта',
                cardType: 'Улика',
                description: 'Описание 1 События 3 Акта'),
            ScenarioEvent(
                id: generateUID(),
                title: '2 Событие 3 Акта',
                cardType: 'Событие',
                description: 'Описание 2 События 3 Акта'),
            ScenarioEvent(
                id: generateUID(),
                title: '3 Событие 3 Акта',
                cardType: 'Факт',
                description: 'Описание 3 События 3 Акта'),
          ]),
      ScenarioAct(
          id: generateUID(),
          title: 'Тайтл Акта 4',
          description: 'Описание Акта 4',
          events: [
            ScenarioFalsyEvent(
                id: 'Основное ложное событие',
                title: 'Основное ложное событие',
                cardType: 'Улика',
                description: 'Основное ложное событие',
                falsyDescription: 'Это событие явно ложное',
                confirmsInnocence: true),
            ScenarioEvent(
                id: generateUID(),
                title: '2 Событие 4 Акта',
                cardType: 'Событие',
                description: 'Описание 4 События 4 Акта'),
            ScenarioEvent(
                id: generateUID(),
                title: '3 Событие 4 Акта',
                cardType: 'Факт',
                description: 'Описание 3 События 4 Акта'),
          ]),
    ],
    evedences: [
      ScenarioEvedence(
          id: generateUID(), title: 'Улика 1', description: 'Описание улики 1'),
      ScenarioTruthyEvedence(
          id: generateUID(),
          title: 'Улика 2',
          falsyEventId: 'Не основное',
          description: 'Опровергающее ложное'),
      ScenarioTruthyEvedence(
          id: generateUID(),
          title: 'Улика 3',
          falsyEventId: 'Основное ложное событие',
          description: 'Опровергающее основное ложное'),
    ],
    defendant: ScenarioDefendant(
        id: generateUID(),
        name: '',
        description: 'Описание обвиняемого',
        bornOrigin: ScenarioDefendantOrigin(
          id: generateUID(),
          title: 'Мондштадт',
          description: '',
          additionalTitle: 'Из семьи искателей приключений',
        ),
        professionOrigin: ScenarioDefendantOrigin(
          id: generateUID(),
          title: 'Ученик алхимика',
          description: '',
        ),
        secretOrigin: ScenarioDefendantOrigin(
          id: generateUID(),
          title: 'Скрывает, что из семьи лоуренсов',
          description: '',
        )));
