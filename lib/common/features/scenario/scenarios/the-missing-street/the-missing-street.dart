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

final Scenario theMissingStreet = Scenario(
    id: generateUID(),
    description: ScenarioDescription(
      id: generateUID(),
      background: 'test-brown-background.png',
      title: 'Исчезнувшая улица',
      description:
          'Иногда картографы добавляют на карты выдуманные географические объекты, улицы или целые несуществующие города. Это позволяет быстро определить, была ли карта скопирована с уже существующей.\n\nКавеху поручили создать новую карту столицы Фонтейна. Архитектор работал две недели не покладая рук, и как только он закончил, на него тут же подали в суд! Это сделала компания, которая сделала предыдущую карту. Они считают, что Кавех украл у них карту.',
    ),
    defendant: ScenarioDefendant(
        id: generateUID(),
        background: 'test-brown-background.png',
        name: 'Мелюзина',
        description:
            'Вы всегда мечтали о том, чтобы бороться с несправедливостью, поэтому стали адвокатом. Вам предстоит доказать невиновность своего подзащитного, Кавеха из Сумеру.',
        bornOrigin: ScenarioDefendantOrigin(
          id: generateUID(),
          title: 'Происхождение',
          description: 'Коренной фонтейнец',
          additionalTitle: '',
        ),
        professionOrigin: ScenarioDefendantOrigin(
          id: generateUID(),
          title: 'Профессия',
          description:
              'Бесплатный адвокат, предоставляемый Фонтейном для тех, кто не хочет или не может нанять себе адвоката.',
        ),
        secretOrigin: ScenarioDefendantOrigin(
          id: generateUID(),
          title: 'Секрет',
          description:
              'Это ваше первое дело, касающееся защиты интеллектуальной собственности, и третье дело в целом.',
        )),
    acts: [
      ScenarioAct(
          id: actOneId,
          title: 'Обвинение',
          description:
              'Бюро урбанистического развития имеет причины полагать, что ваш подзащитный скопировал нашу карту и выдал за свою. Мы добавили на свою карту поддельную улицу, чтобы сразу было видно, если карту кто-то копирует. Этой улицы просто не существует, на ее месте сейчас находится большой пустырь. Вот фотография пустыря из городского архива, которая это доказывает.',
          events: [
            ScenarioEvent(
                id: 'Пожарная безопасность',
                title: 'Пожарная безопасность',
                description:
                    'Когда-то давно на месте пустыря был склад фейерверков торговца из Ли Юэ.'),
            ScenarioEvent(
                id: 'Место',
                title: 'Место',
                description:
                    'Очень долго на месте сгоревшего склада был пустырь.'),
            ScenarioFalsyEvent(
                id: 'Городской архив',
                title: 'Городской архив',
                description:
                    'Собирает старые фотографии для документации постоянно меняющегося облика столицы.'),
          ]),
      ScenarioAct(
          id: actTwoId,
          title: 'Говорит Защита',
          description:
              'По пути от офиса БУР’а до суда на есть пекарня. Она располагается как раз на месте взорвавшегося склада. Перед судом вы ели плоский круассан из пакета с логотипом этой пекарни.',
          events: [
            ScenarioEvent(
                id: 'БУР пронзающий небеса!',
                title: 'БУР пронзающий небеса!',
                description:
                    'Здание БУР’а после реставрации внезапно стало выше на один этаж.'),
            ScenarioFalsyEvent(
                id: 'Невозможное возможно?',
                title: 'Невозможное возможно?',
                description:
                    'Юрист со стороны обвинения прошел по несуществующей улице и купил на ней круассан.'),
            ScenarioEvent(
                id: 'Да, но зачем?',
                title: 'Да, но зачем?',
                description: 'В этой пекарне изобрели плоские круассаны.'),
          ]),
      ScenarioAct(
          id: actThreeId,
          title: 'Адрес',
          description:
              'Предположим, что это и правда улица, и я правда купил там круассан. Но вы скопировали на свою карту не только расположение, но и название улицы! Как вы можете доказать, что эта улица и в самом деле так называется? На пакете из пекарни адреса нет.',
          events: [
            ScenarioFalsyEvent(
                id: 'Улица',
                title: 'Улица',
                description: 'А действительно ли этой улицы не существует?'),
            ScenarioEvent(
                id: 'Гражданская позиция',
                title: 'Гражданская позиция',
                description:
                    'На второй день протеста гражданам Фонтейна удалось добиться запрета плоских круассанов.'),
            ScenarioEvent(
                id: 'Подражание',
                title: 'Подражание',
                description: 'Это высшая степень похвалы.'),
          ]),
      ScenarioAct(
          id: actFourId,
          title: 'Сговор',
          description:
              'Обвиняемый мог сговориться с владельцами пекарни, чтобы на табличке было написано название улицы-ловушки! Пекарня открылась незадолго до того, как обвиняемый получил заказ на создание карты!',
          events: [
            ScenarioEvent(
                id: 'Роза',
                title: 'Роза',
                description:
                    'Из салфетки можно сложить розу. И подарить ее прокурору.'),
            ScenarioFalsyEvent(
                id: 'Второй багет в подарок',
                title: 'Второй багет в подарок',
                description:
                    'Пекарня недавно отпраздновала свой первый день рождения.'),
            ScenarioEvent(
                id: 'Охота за головами',
                title: 'Охота за головами',
                description:
                    'Каким-то образом человек из администрации выследил архитектора на второй день после прибытия и уговорил его сделать новую карту.'),
          ]),
    ],
    evedences: [
      ScenarioTruthyEvedence(
          id: 'Фотография',
          title: 'Фотография',
          falsyEventIds: ['Городской архив'],
          falsyDescription:
              'Фотография из архива была сделана давно. С тех пор многое могло поменяться.',
          triggeredTransitionId: 'Фотография',
          description:
              'Потрепанная и выцветшая фотография пустыря из архива, сделанная три года назад.'),
      ScenarioEvedence(
          id: 'Чай Те Гуань Инь',
          title: 'Чай Те Гуань Инь',
          description:
              'Пустая коробка из-под тонизирующего чая из Ли Юэ, выпитого в процессе создания карты.'),
      ScenarioEvedence(
          id: 'Архив',
          title: 'Архив',
          description:
              'Согласно Фонтейнопедии, это учреждение, в котором хранятся архивные документы.'),
    ],
    transitionEvents: [
      TransitionEvent(id: 'Фотография', nextActId: actTwoId, effects: [
        TransitionEventRemoveEvedenceEffect(
            id: generateUID(), evedenceIds: ['Чай Те Гуань Инь', 'Архив']),
        TransitionEventAddEvedencesEffect(
          id: generateUID(),
          evedences: [
            ScenarioEvedence(
                id: 'Плоский круассан',
                title: 'Плоский круассан',
                description: 'Уберите его с глаз долой.'),
            ScenarioTruthyEvedence(
              id: 'Пакет с логотипом пекарни',
              title: 'Пакет',
              description: 'Пакет с логотипом пекарни, который оставил судья.',
              falsyEventIds: ['Невозможное возможно?'],
              falsyDescription:
                  'Юрист со стороны обвинения прошел по несуществующей улице и купил на ней круассан.',
              triggeredTransitionId: 'Невозможное возможно?',
            ),
            ScenarioEvedence(
                id: 'Eco friendly wood veneers',
                title: 'Eco friendly wood veneers',
                description: ''),
          ],
        ),
      ]),
      TransitionEvent(
          id: 'Невозможное возможно?',
          nextActId: actThreeId,
          effects: [
            TransitionEventRemoveEvedenceEffect(
                id: generateUID(),
                evedenceIds: ['Плоский круассан', 'Eco friendly wood veneers']),
            TransitionEventAddEvedencesEffect(
              id: generateUID(),
              evedences: [
                ScenarioEvedence(
                    id: 'Плоский багет',
                    title: 'Плоский багет',
                    description: 'Опять?'),
                ScenarioEvedence(
                    id: 'Карта',
                    title: 'Карта',
                    description: 'Для игры в Священный призыв семерых.'),
                ScenarioTruthyEvedence(
                    id: 'Салфетка',
                    title: 'Салфетка',
                    description: 'Бумажная салфетка, купленная обвинением',
                    falsyEventIds: ['Улица'],
                    falsyDescription:
                        'Даже на бумажной салфетке указан адрес несуществующей улицы. Как такое возможно?',
                    triggeredTransitionId: 'Улица'),
              ],
            ),
          ]),
      TransitionEvent(id: 'Улица', nextActId: actFourId, effects: [
        TransitionEventRemoveEvedenceEffect(
            id: generateUID(), evedenceIds: ['Плоский багет', 'Карта']),
        TransitionEventAddEvedencesEffect(
          id: generateUID(),
          evedences: [
            ScenarioTruthyEvedence(
                id: 'Штамп в документах',
                title: 'Штамп в документах',
                description:
                    'Подсудимый въехал на территорию Фонтейна месяц назад.',
                falsyEventIds: ['Второй багет в подарок'],
                falsyDescription:
                    'Подсудимый въехал месяц назад, в момент, когда пекарня праздновала свой первый день рождения.',
                triggeredTransitionId:
                    'Игра завершается невиновностью игрока.'),
            ScenarioEvedence(
                id: 'Плоский круассан',
                title: 'Плоский круассан',
                description: 'Это преступление. Кто его сюда положил?'),
            ScenarioEvedence(
                id: 'Безымянная улица?',
                title: 'Безымянная улица?',
                description: 'Улица там точно есть.'),
          ],
        ),
      ]),
      TransitionEvent(
          id: 'Игра завершается невиновностью игрока.',
          endGame: true,
          effects: []),
    ]);
