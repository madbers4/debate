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
          'В залитом полуденным солнцем городе Кур-де-Фонтейн, на территории кафе "Лютес", был пойман широко известный преступник - Шпионская Тень. Он был пойман с поличным, когда пытался установить шпионские жучки в новый товар, взорвавший рейтинги продаж в Фонтейне - клубничный торт. Небезызвестный создатель сладости, Лиония, собиралась дать интервью "Паровой Птице", чтобы диковинку запечатлели на страницах главной газеты страны правосудия.',
    ),
    defendant: ScenarioDefendant(
        id: generateUID(),
        background: 'miluzina-background.png',
        name: 'Мелюзина',
        description:
            'Вы — Мелюзина. На момент событий Вы действительно находились в кафе и были пойманы практически с поличным. Находясь на утреннем патруле, вы обратили внимание на шикарный торт. Вас пленил клубничный запах, и вы, воспользовавшись моментом, моментально приблизились к торту, чтобы рассмотреть его поближе. Когда вы приблизились, вам показалось, что грани торта начали таять. Вы, не раздумывая, решили как-то спасти торт, и ваши руки оказались на подставке для торта, чтобы переместить его с жаркого места в тень, во избежании плавления.',
        bornOrigin: ScenarioDefendantOrigin(
          id: generateUID(),
          title: 'Происхождение',
          description:
              'Мелюзина, которая решила жить вместе с людьми в Кур-де-Фонтейне.',
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
          description: 'Скрывает свою страсть к клубнике и тортам.',
        )),
    acts: [
      ScenarioAct(
          id: '1',
          title: 'Место преступление - кафе «Лютес»',
          description:
              'В тот прекрасный солнечный день Шарлотта должна была взять интервью у Лионии, известного кондитера. Темой разговора был новый хит Кур-де-Фонтейна - клубничный торт и способы его приготовления.',
          events: [
            ScenarioEvent(
                id: generateUID(),
                title: 'Погода',
                description:
                    'Преступление произошло в полуденный жаркий день.'),
            ScenarioEvent(
                id: generateUID(),
                title: 'Место',
                description:
                    'Кафе "Лютес", модное кофейное заведение Кур-де-Фонтейна.'),
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
              'В середине дня жандарм Мелюзина остановилась во время своего патруля, после чего неожиданно исчезла на глазах у клиента. Посетители утверждают, что видели промчавшуюся между столиками тень. Когда Лиония с Шарлоттой подошли к столу, служащему центром презентации экспозиции, они увидели макушку головы Мелюзины.',
          events: [
            ScenarioEvent(
                id: generateUID(),
                title: 'Патруль',
                description:
                    'Обычно в это время суток Мелюзина находилась в патруле.'),
            ScenarioEvent(
                id: 'Дедуля',
                title: 'Свидетельства',
                description:
                    'Дедушка не успел сделать и глоток, как Мелюзина пропала из виду.'),
            ScenarioFalsyEvent(
              id: 'Тень',
              title: 'Тень',
              description: 'Тень, которая промчалась между столиками кофейни',
            ),
          ]),
      ScenarioAct(
          id: '3',
          title: 'Интервью',
          description:
              'Когда Шарлотта и Лиония заметили Мелюзину, а та, в свою очередь, заметила их, она испугалась и подняла руки вверх. В это время торт упал, разлетевшись на мелкие кусочки, которые тут же начали плавиться от горячего асфальта. Эти брызги испачкали близлежащие предметы, в том числе и ноги посетителей. Окружающие были удивлены, но никто не стал злиться на Мелюзину. Когда Лиония подошла поближе и заметила механических жучков, разбросанных вокруг торта, она испуганно закричала и потеряла сознание.',
          events: [
            ScenarioEvent(
                id: generateUID(),
                title: 'Задержание',
                description:
                    'Мелюзина, увидев Шарлотту и Лионию, испугалась и уронила торт.'),
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
              'После того, как Лиония пришла в себя, она постарась довести данное событие до дела, а после и до суда. Лиония удтверждает, что она регулярно находила у себя в доме различные устройства для слежения, которые, по слухам, размещает Шпионская Тень, таинственный преступник, регулярно следящий за местной знатью и промышляющий продажей сплетней.',
          events: [
            ScenarioFalsyEvent(
                id: 'Шпионская тень',
                title: 'Шпионская тень',
                description:
                    'Преступник, промышляющий продажей сплетен. Его никто, никогда не видел.'),
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
              'Мелюзина, воспользовавшись своим низким ростом, промчалась мимо столиков.',
          triggeredTransitionId: 'Мелюзина с низким ростом',
          description:
              'Небольшие обитатели Фонтейна с ушками или небольшими рожками на голове. Имеют длинный хвост с кисточкой на конце.'),
      ScenarioEvedence(
          id: 'Фотосъемка',
          title: 'Фотосъемка',
          description: 'Лиония собиралась дать интервью паровой птице.'),
      ScenarioTruthyEvedence(
          id: generateUID(),
          title: 'Солнечный день',
          falsyEventId: 'Торт',
          falsyDescription:
              'Торт не был в идеальном состоянии и частично растаял, из-за чего испачкал гостей при падении. Мелюзина просто хотела переставить его в тень.',
          triggeredTransitionId: 'Мелюзна хотела переставить торт в тень',
          description: 'Мог ли торт растаять в такой солнечный день?'),
      ScenarioEvedence(
          id: 'Клубника и тортики',
          title: 'Клубника и тортики',
          description: 'Вообще-то я не люблю клубнику и тортики'),
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
                    'Мелюзина, воспользовавшись своим низким ростом, промчалась мимо столиков.'))
      ]),
      TransitionEvent(id: generateUID(), afterNoEvedenceLeft: true, effects: [
        TransitionEventChangeActEffect(
            id: generateUID(),
            actId: '2',
            description:
                'В середине дня жандарм Мелюзина, находясь во время своего патруля, промчалась мимо столиков прямо к торту. Когда Лиония с Шарлоттой подошли к месту инсталляции, они увидели макушку головы Мелюзины.'),
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
                  'Факт того, что обнаруженные жучки являются шпионскими устройствами, не доказан.',
              falsyEventId: 'Остатки торта',
              triggeredTransitionId:
                  'В остатках торта обнаружены механические жучки.'),
          ScenarioEvedence(
              id: 'Фото разбитого торта',
              title: 'Фото разбитого торта',
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
                        'Преступник, известный торговлей сплетнями. Но разве он мог так просто сдаться?')),
          ]),
      TransitionEvent(id: generateUID(), afterNoEvedenceLeft: true, effects: [
        TransitionEventRemoveEvedenceEffect(
            id: generateUID(),
            evedenceIds: ['Торговля сплетнями', 'Фото разбитого торта']),
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
                  'В городе все хорошо знают Мелюзину, она просто находилась посреди своей повседневной рутины и хотела помочь.',
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
