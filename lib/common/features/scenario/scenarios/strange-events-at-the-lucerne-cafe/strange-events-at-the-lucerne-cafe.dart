import 'package:v1/common/features/scenario/Scenario.dart';
import 'package:v1/common/features/scenario/ScenarioAct.dart';
import 'package:v1/common/features/scenario/ScenarioDescription.dart';
import 'package:v1/common/features/scenario/defendant/ScenarioDefendant.dart';
import 'package:v1/common/features/scenario/defendant/ScenarioDefendantOrigin.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioEvedence.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioTruthyEvedence.dart';
import 'package:v1/common/features/scenario/event/ScenarioEvent.dart';
import 'package:v1/common/features/scenario/event/ScenarioFalsyEvent.dart';
import 'package:v1/common/features/scenario/transitionEvent/TransitionEvent.dart';
import 'package:v1/common/features/scenario/transitionEvent/effects/TransitionEventAddEvedenceEffect.dart';
import 'package:v1/common/features/scenario/transitionEvent/effects/TransitionEventChangeActEffect.dart';
import 'package:v1/common/features/scenario/transitionEvent/effects/TransitionEventChangeEventEffect.dart';
import 'package:v1/common/features/scenario/transitionEvent/effects/TransitionEventRemoveEvedenceEffect.dart';
import 'package:v1/common/utils/generateUID.dart';

final Scenario strangeEventsAtTheLucerneCafe = Scenario(
    id: generateUID(),
    description: ScenarioDescription(
      id: generateUID(),
      background: 'cafe-backgound.png',
      title: 'Шпионская Тень: Кафе "Лютес"',
      description:
          'Одним жарким солнечным днем в столице Фонтейна, в кафе "Лютес", был пойман известный преступник - Шпионская Тень. Он был пойман, когда пытался установить шпионские жучки в новый популярный десерт — клубничный торт. Его создательница и владелица кафе, Леонья, собиралась дать интервью "Паровой Птице", чтобы десерт запечатлели на страницах главной газеты страны, но вдруг мимо нее пронеслась какая-то тень, торт упал на пол и развалился на кусочки, являя растерянной публике шпионски жучки, которые скрывались внутри.',
    ),
    defendant: ScenarioDefendant(
        id: generateUID(),
        background: 'miluzina-background.png',
        name: 'Мелюзина',
        description:
            'Вы — Мелюзина-жандарм. Вас обвиняют во всех преступлениях Шпионской тени на основании прослушивающих жучков, которые были в торте. На утреннем патруле вы проходили мимо кафе Лютес, и вас пленил восхитительный аромат дессерта. Вы подошли к нему поближе, чтобы рассмотреть его, но заметили, что он тает на солнце! Вы попытались перенести его в тень, но металлический поднос, на котором он стоял, сильно нагрелся на солнце и чуть не обжег вас. От неожиданности вы выронили его из рук вместе с тортом, стоящем на нем.',
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
          id: '1',
          title: 'Место преступление - кафе «Лютес»',
          description:
              'В тот прекрасный солнечный день Шарлотта должна была взять интервью у Лионии, известного кондитера и владелицы кафе, о ее клубничном торте.',
          events: [
            ScenarioEvent(
                id: generateUID(),
                title: 'Погода',
                description:
                    'Преступление произошло в самый жаркий день года, примерно в полдень.'),
            ScenarioEvent(
                id: generateUID(),
                title: 'Место',
                description:
                    'Кафе "Лютес", популярное среди знати и обычных горожан.'),
            ScenarioFalsyEvent(
                id: 'Торт',
                title: 'Торт',
                description:
                    'Он был идеален, в нем не было ни единого изъяна, и казалось, что он вовсе игрушечный.'),
          ]),
      ScenarioAct(
          id: '2',
          title: 'Еще один день, еще один патруль',
          description:
              'В середине дня жандарм Мелюзина остановилась во время своего патруля, после чего неожиданно исчезла на глазах у опрошенных свидетелей. Посетители утверждают, что видели промчавшуюся между столиками тень. Когда Лиония с Шарлоттой подошли к столу, на котором стоял торт, они увидели макушку головы Мелюзины.',
          events: [
            ScenarioEvent(
                id: generateUID(),
                title: 'Патруль',
                description:
                    'Обычно в это время Мелюзина находилась в патруле.'),
            ScenarioEvent(
                id: 'Дедуля',
                title: 'Свидетельства',
                description:
                    'Дедушка не успел сделать и глоток, как Мелюзина пропала из виду.'),
            ScenarioFalsyEvent(
              id: 'Тень',
              title: 'Тень',
              description: 'Тень промчалась между столиками кофейни к торту.',
            ),
          ]),
      ScenarioAct(
          id: '3',
          title: 'Интервью',
          description:
              'Торт упал, разлетевшись на мелкие кусочки, которые тут же начали плавиться от горячего асфальта. Это привлекло внимание Шарлотты и Лионии. Милюзина испугалась и подняла руки вверх. Лиония подошла поближе к упавшему торту и заметила механических жучков внутри торта. Она испуганно закричала и потеряла сознание.',
          events: [
            ScenarioEvent(
                id: generateUID(),
                title: 'Задержание',
                description:
                    'Мелюзина, увидев Шарлотту и Лионию, испугалась и подняла руки.'),
            ScenarioFalsyEvent(
                id: 'Остатки торта',
                title: 'Остатки торта',
                description:
                    'Как утверждает Лиония, в торте были размещены дюжина шпионских жучков.'),
            ScenarioEvent(
                id: generateUID(),
                title: 'Обморок',
                description:
                    'Лиония запаниковала и потеряла сознание, как только увидела жучков.'),
          ]),
      ScenarioAct(
          id: '4',
          title: 'Шпионская тень',
          description:
              'После того, как Лиония пришла в себя, она постаралась собрать остатки сил в кулак и довести данное событие до суда. Девушка утверждает, что регулярно находила у себя в доме различные устройства для слежения, которые размещает Шпионская Тень, таинственный преступник, который продает сплетни подслушанные у местной знати.',
          events: [
            ScenarioFalsyEvent(
                id: 'Шпионская тень',
                title: 'Шпионская тень',
                description: 'Преступник промышляющий продажей сплетен.'),
            ScenarioEvent(
                id: generateUID(),
                title: 'Обвинение',
                description:
                    'Лиония обвиняет Шпионскую Тень в размещении жучков.'),
            ScenarioFalsyEvent(
              id: 'Мелюзина',
              title: 'Мелюзина',
              description: 'Разве Мелюзина может быть Шпионской Тенью?',
            ),
          ]),
    ],
    evedences: [
      ScenarioTruthyEvedence(
          id: generateUID(),
          title: 'Мелюзина',
          falsyEventId: 'Тень',
          falsyDescription:
              'Мелюзина низкая и проворная, так что она могла быстро добежать до торта, и остаться незамеченной.',
          triggeredTransitionId: 'Мелюзина с низким ростом',
          description:
              'Обитатели Фонтейна с ушками или маленькими рожками и длинным хвостом с кисточкой на конце; обычно невысокого роста.'),
      ScenarioEvedence(
          id: 'Фотосъемка',
          title: 'Фотосъемка',
          description: 'Лиония собиралась дать интервью.'),
      ScenarioTruthyEvedence(
          id: generateUID(),
          title: 'Солнечный день',
          falsyEventId: 'Торт',
          falsyDescription:
              'Торт не был в идеальном состоянии и частично растаял на солнце. Мелюзина просто хотела переставить его в тень.',
          triggeredTransitionId: 'Мелюзна хотела переставить торт в тень',
          description: 'Мог ли торт растаять в такой жаркий солнечный день?'),
      ScenarioEvedence(
          id: 'Клубника и тортики',
          title: 'Клубника и тортики',
          description: 'Вообще-то я не люблю клубнику и тортики. (ложь)'),
    ],
    transitionEvents: [
      TransitionEvent(id: 'Мелюзна хотела переставить торт в тень', effects: [
        TransitionEventChangeEventEffect(
            id: generateUID(),
            actId: '1',
            eventId: 'Торт',
            event: ScenarioEvent(
                id: 'Торт',
                title: 'Растаявший торт',
                description:
                    'Торт уже некоторое время стоял на жарком солнце и начал таять.'))
      ]),
      TransitionEvent(id: 'Мелюзина с низким ростом', effects: [
        TransitionEventChangeEventEffect(
            id: generateUID(),
            actId: '2',
            eventId: 'Тень',
            event: ScenarioEvent(
                id: 'Тень',
                title: 'Тень',
                description:
                    'Мелюзина достаточно низкая и ловкая, чтобы ее не заметили, даже когда она бежала. '))
      ]),
      TransitionEvent(id: generateUID(), afterNoEvedenceLeft: true, effects: [
        TransitionEventChangeActEffect(
            id: generateUID(),
            actId: '2',
            description:
                'В середине дня жандарм Мелюзина, находясь во время своего патруля, промчалась мимо столиков прямо к торту. Когда Лиония с Шарлоттой подошли к упавшему торту, они увидели макушку головы Мелюзины.'),
        TransitionEventRemoveEvedenceEffect(
            id: generateUID(),
            evedenceIds: ['Фотосъемка', 'Клубника и тортики']),
        TransitionEventAddEvedencesEffect(id: generateUID(), evedences: [
          ScenarioTruthyEvedence(
              id: 'Сдача',
              title: 'Сдача',
              description: 'Мелюзина просто сдалась, подняв руки вверх.',
              falsyDescription:
                  'Разве, так называемая, Шпионская Тень так просто сдалась бы?',
              falsyEventId: 'Шпионская тень',
              triggeredTransitionId:
                  'Преступник, известный торговлей сплетнями. Но разве он мог так просто сдаться?'),
          ScenarioTruthyEvedence(
              id: 'Жучки',
              title: 'Жучки',
              description: 'Механические жучки, обнаруженные в торте.',
              falsyDescription:
                  'Нет прямых доказательств тому, что жучки в торте были прослушивающими устройствами.',
              falsyEventId: 'Остатки торта',
              triggeredTransitionId:
                  'В остатках торта обнаружены механические жучки.'),
          ScenarioEvedence(
              id: 'Фото упавшего торта',
              title: 'Фото упавшего торта',
              description: 'Фото остатков торта, сделанное Шарлоттой.'),
          ScenarioEvedence(
              id: 'Торговля сплетнями',
              title: 'Торговля сплетнями',
              description:
                  'Разве Шпионская Тень не занимается торговлей сплетнями?'),
        ]),
      ]),
      TransitionEvent(
          id: 'В остатках торта обнаружены механические жучки.',
          effects: [
            TransitionEventChangeEventEffect(
                id: generateUID(),
                actId: '3',
                eventId: 'Остатки торта',
                event: ScenarioEvent(
                    id: 'Торт',
                    title: 'Растаявший торт',
                    description:
                        'В остатках торта обнаружены механические жучки.')),
          ]),
      TransitionEvent(
          id: 'Преступник, известный торговлей сплетнями. Но разве он мог так просто сдаться?',
          effects: [
            TransitionEventChangeEventEffect(
                id: generateUID(),
                actId: '4',
                eventId: 'Шпионская тень',
                event: ScenarioEvent(
                    id: 'Шпионская тень',
                    title: 'Шпионская тень',
                    description:
                        'Преступник, известный торговлейг сплетнями. Но разве он мог так просто сдаться?')),
          ]),
      TransitionEvent(id: generateUID(), afterNoEvedenceLeft: true, effects: [
        TransitionEventRemoveEvedenceEffect(
            id: generateUID(),
            evedenceIds: ['Торговля сплетнями', 'Фото упавшего торта']),
        TransitionEventAddEvedencesEffect(id: generateUID(), evedences: [
          ScenarioEvedence(
            id: 'Лиония',
            title: 'Лиония',
            description:
                'Если у Лионии были обнаружены жучки в доме, может ли она быть Шпионской Тенью?',
          ),
          ScenarioTruthyEvedence(
              id: 'Алиби',
              title: 'Алиби',
              description:
                  'Все знают, что Милюзина очень серьезно относится к своим обязанностям жандарма и не стала бы нарушать права жителей Фонтейна на частную жизнь, раскладывая везде жучки. Но всегда стремиться всем помочь.',
              falsyDescription: '...',
              falsyEventId: 'Мелюзина',
              triggeredTransitionId: 'Игра завершается невиновностью игрока.'),
          ScenarioEvedence(
              id: 'Приготовление',
              title: 'Приготовление',
              description:
                  'Возможно, во время приготовления кто-то другой подложил жучки в торт.'),
        ]),
      ]),
      TransitionEvent(
          id: 'Игра завершается невиновностью игрока.',
          endGame: true,
          effects: []),
    ]);
