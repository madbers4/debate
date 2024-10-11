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

final Scenario yellowPress = Scenario(
    id: generateUID(),
    description: ScenarioDescription(
      id: generateUID(),
      background: 'test-brown-background.png',
      title: 'Модный приговор',
      description:
          'Золотое сечение — новый модный дом, недавно открывшийся в Фонтейне, позиционирующий себя как чуть более простая, но доступная каждому одежда. Он подал в суд на Дом Тиори, заявляя о незаконном использовании товарного знака, эмблемы Золотого Сечения, в текстуре ткани.',
    ),
    defendant: ScenarioDefendant(
        id: generateUID(),
        background: 'test-brown-background.png',
        name: 'Дизайнер',
        description:
            'Вы — один из дизайнеров Дома Тиори. Вы создали множество костюмов, на которых использовалась ткань с так называемым товарным знаком. Вы были разгневаны и удивлены данным обвинением, потому что узор ткани содержал всего лишь геометрические фигуры.',
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
          title: 'Обвинение',
          description:
              'Сегодня я буду представлять юридическое лицо, модный дом Золотое Сечение. Оно заявляет, что в указанных костюмах используется официально зарегистрированная эмблема. В нижеуказанных костюмах именно подкладка содержит элементы, нарушающие закон.',
          events: [
            ScenarioFalsyEvent(
                id: 'Подкладка',
                title: 'Подкладка',
                description:
                    'Имеет узор, состоящий множества квадратов разных размеров.'),
            ScenarioFalsyEvent(
                id: 'Эмблема',
                title: 'Эмблема',
                description:
                    'Это золотая спираль, вписанная в прямоугольники, вписанные в прямоугольники с соотношением в 1,618.'),
            ScenarioEvent(
                id: 'Костюмы',
                title: 'Костюмы',
                description:
                    'Используя подобные текстуры, было создано несколько костюмов на заказ.'),
          ]),
      ScenarioAct(
          id: actTwoId,
          title: 'Пропорции',
          description:
              'Хорошо, если для вас этого не достаточно... Дом Тиори использует пропорции золотого сечения для создания гармоничного силуэта, также и в подкладках с прямоугольниками, это нарушение авторских прав.',
          events: [
            ScenarioEvent(
                id: '1.618',
                title: '1.618',
                description: '1,618 — пропорции Золотого Сечения.'),
            ScenarioEvent(
                id: 'Контекст',
                title: 'Контекст',
                description: 'В этот раз сразу несколько совпадений...'),
            ScenarioFalsyEvent(
                id: 'Пропорции',
                title: 'Пропорции',
                description:
                    'Одним из оснований для обвинения являются пропорции. Костюмы Дома Тиори часто используют пропорции золотого сечения.'),
          ]),
      ScenarioAct(
          id: actThreeId,
          title: 'Весомая улика',
          description:
              'Вот я и загнал вас в угол, когда вы признали достоверность наличия квадратов и пропорций, наступило время представить суду самую весомую улику, фотографию сразу двух изделий, содержащих логотип нашего модного дома.',
          events: [
            ScenarioFalsyEvent(
                id: 'Изделия',
                title: 'Изделия',
                description:
                    'Вышеупомянутые изделия — это два почти одинаковых костюма, различающихся только размером и цветом подкладки.'),
            ScenarioEvent(
                id: 'Фарузан',
                title: 'Фарузан',
                description:
                    'Фарузан заказала костюмы в качестве поощрения для двух учеников с самой высокой успеваемостью.'),
            ScenarioFalsyEvent(
                id: 'Эмблема2',
                title: 'Эмблема',
                description:
                    'Эмблема модного дома Золотое Сечение представляет собой золотое сечение золотого цвета.'),
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
          falsyEventIds: ['Подкладка', 'Эмблема'],
          falsyDescription: 'Можно ли владеть идеей квадрата?',
          triggeredTransitionId: 'Концепт квадрата',
          description: 'Можно ли владеть идеей квадрата?'),
      ScenarioEvedence(
          id: 'Фонтейнопедия',
          title: 'Фонтейнопедия',
          description:
              'Согласно информации, полученной в справочнике Фонтейнопедии, квадрат — это частный случай прямоугольника.'),
    ],
    transitionEvents: [
      TransitionEvent(id: 'Концепт квадрата', nextActId: actTwoId, effects: [
        TransitionEventRemoveEvedenceEffect(
            id: generateUID(),
            evedenceIds: ['Фонтейнопедия', 'Концепт квадрата']),
        TransitionEventAddEvedencesEffect(
          id: generateUID(),
          evedences: [
            ScenarioTruthyEvedence(
                id: 'Фибоначчи',
                title: 'Фибоначчи',
                falsyEventIds: ['Пропорции'],
                falsyDescription:
                    'Прямоугольники, вписанные в прямоугольники, с этими пропорциями по отдельности не являются нарушением авторских прав, так как это было открыто еще Фибоначчи.',
                triggeredTransitionId: 'Все живое',
                description:
                    'Согласно Фонтейнопедии, древний кэнриархский ученый, открывший золотое сечение.'),
            ScenarioTruthyEvedence(
                id: 'Все живое',
                title: 'Все живое',
                falsyEventIds: ['Пропорции'],
                falsyDescription:
                    'Прямоугольники, вписанные в прямоугольники, с этими пропорциями по отдельности не являются нарушением авторских прав, так как это было открыто еще Фибоначчи.',
                triggeredTransitionId: 'Все живое',
                description:
                    'Все живое следует пропорциям золотого сечения, в том числе клиенты Дома Тиори.'),
            ScenarioEvedence(
                id: 'Отличия',
                title: 'Отличия',
                description:
                    'Измерены ли пропорции с нужной точностью, чтобы подтвердить соответствие?'),
          ],
        ),
      ]),
      TransitionEvent(id: 'Все живое', nextActId: actThreeId, effects: [
        TransitionEventRemoveEvedenceEffect(
            id: generateUID(),
            evedenceIds: ['Фибоначчи', 'Отличия', 'Все живое']),
        TransitionEventAddEvedencesEffect(
          id: generateUID(),
          evedences: [
            ScenarioEvedence(
                id: 'Любовь',
                title: 'Любовь',
                description:
                    'Фарузан очень любит своих учеников. Навряд ли она бы стала дарить контрафактные костюмы.'),
            ScenarioEvedence(
                id: 'Кутюрье',
                title: 'Кутюрье',
                description:
                    'У Дома Тиори нет причин покушаться на чужую интеллектуальную собственность.'),
            ScenarioTruthyEvedence(
                id: 'Каталог',
                title: 'Каталог',
                falsyEventIds: ['Эмблема2', 'Изделия'],
                falsyDescription:
                    'Цвета на используемых подкладках отличаются от эмблемы.',
                triggeredTransitionId: 'Игра завершается невиновностью игрока.',
                description:
                    'Каталог модного дома золотого сечения, где каждая эмблема выполнена из золота или материала, или его имитирующего.'),
            ScenarioEvedence(
                id: 'Дело',
                title: 'Дело',
                description:
                    'Кажется, Золотое Сечение просто хочет устроить шоу, чтобы повысить продажи...'),
          ],
        ),
      ]),
      TransitionEvent(
          id: 'Игра завершается невиновностью игрока.',
          endGame: true,
          effects: []),
    ]);
