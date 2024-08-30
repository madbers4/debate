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
import 'package:v1/common/features/scenario/transitionEvent/TransitionEventEffect.dart';
import 'package:v1/common/features/scenario/transitionEvent/effects/TransitionEventAddEvedenceEffect.dart';
import 'package:v1/common/features/scenario/transitionEvent/effects/TransitionEventChangeActEffect.dart';
import 'package:v1/common/features/scenario/transitionEvent/effects/TransitionEventChangeEventEffect.dart';
import 'package:v1/common/features/scenario/transitionEvent/effects/TransitionEventRemoveEvedenceEffect.dart';
import 'package:v1/common/utils/generateUID.dart';

final Scenario strangeEventsAtTheLucerneCafe = Scenario(
    id: generateUID(),
    description: ScenarioDescription(
      id: generateUID(),
      background: 'test-brown-background.png',
      title: 'Модный приговор',
      description:
          'Золотое сечение - новый модный дом, недавно открывшийся в Фонтейне, позиционировавший себя как чуть более простая, но доступная каждому одежда. Использовав закон о защите авторского права, он подал в суд на Дом Тиори, заявляя о незаконном использовании товарного знака, эмблемы Золотого Сечения в текстуре ткани.',
    ),
    defendant: ScenarioDefendant(
        id: generateUID(),
        background: 'test-brown-background.png',
        name: 'Мелюзина',
        description:
            'Вы - один из действующих дизайнеров Дома Тиори, создавший множество костюмов на которых использовалась вышеупомянутую ткань с товарным знаком. Вы были разгневанны и удивлены данным обвинением, потому, что узор ткани содержал всего лишь геометрические фигуры.',
        bornOrigin: ScenarioDefendantOrigin(
          id: generateUID(),
          title: 'Происхождение',
          description: 'Сумеру, наследник мудрецов академии',
          additionalTitle: '',
        ),
        professionOrigin: ScenarioDefendantOrigin(
          id: generateUID(),
          title: 'Профессия',
          description: 'Дизайнер одежды',
        ),
        secretOrigin: ScenarioDefendantOrigin(
          id: generateUID(),
          title: 'Секрет',
          description: 'Вы никогда не шили костюмы',
        )),
    acts: [
      ScenarioAct(
          id: actOneId,
          title: 'Место преступление - кафе «Лютес»',
          description:
              'Согодня я буду преставлять юридическое лицо, модный дом Золотое Сечение. Оно заявляет, что в указанных костюмах, используется официально зарегистрированная эмблема. В нижеуказанных костюмах, именно подкладка содержит элементы, нарушающие закон.',
          events: [
            ScenarioEvent(
                id: generateUID(),
                title: 'Подкладка',
                description:
                    'Имеет узор, состоящий множества квадратов разных размеров.'),
            ScenarioEvent(
                id: generateUID(),
                title: 'Эмблема',
                description:
                    'Это золотая спираль вписанная в прямоугольники, вписанные в прямоугольники с соотношением в 1,61.'),
            ScenarioFalsyEvent(
                id: 'Торт',
                title: 'Костюмы',
                description:
                    'Используя подобные текстуры, была созданна целая серия костюмов.'),
          ]),
    ],
    evedences: [
      ScenarioEvedence(
          id: 'Концепт квадрата',
          title: 'Концепт квадрата',
          description:
              'Квадрат.. это четырехугольник, у которого все стороны равны...'),
      ScenarioTruthyEvedence(
          id: 'И шишки в лесу твои?',
          title: 'И шишки в лесу твои?',
          falsyEventIds: ['Подкладка, эмблема'],
          falsyDescription: 'Можно ли владеть идеей квадрата?',
          triggeredTransitionId: 'Концепт квадрата',
          description: 'Можно ли владеть идеей квадрата?'),
      ScenarioEvedence(
          id: 'Фонтейнопедия',
          title: 'Фонтейнопедия',
          description:
              'Согласно информации, полученной в справочнику фонтейнопедии, квадрат это частный случай прямоугольника.'),
    ],
    transitionEvents: [
      TransitionEvent(
          id: 'Мелюзна хотела переставить торт в тень',
          nextActId: actTwoId,
          effects: [
            TransitionEventRemoveEvedenceEffect(
                id: generateUID(),
                evedenceIds: ['И шишки в лесу твои?', 'Концепт квадрата']),
          ]),
      TransitionEvent(
          id: 'Игра завершается невиновностью игрока.',
          endGame: true,
          effects: []),
    ]);
