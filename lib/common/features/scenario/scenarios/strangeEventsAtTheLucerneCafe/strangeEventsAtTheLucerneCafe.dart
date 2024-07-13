import 'package:v1/common/features/scenario/Scenario.dart';
import 'package:v1/common/features/scenario/ScenarioAct.dart';
import 'package:v1/common/features/scenario/ScenarioDescription.dart';
import 'package:v1/common/features/scenario/defendant/ScenarioDefendant.dart';
import 'package:v1/common/features/scenario/defendant/ScenarioDefendantOrigin.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioEvedence.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioFalsyEvedence.dart';
import 'package:v1/common/features/scenario/event/ScenarioEvent.dart';
import 'package:v1/common/features/scenario/event/ScenarioFalsyEvent.dart';
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
        id: generateUID(),
        title: 'Место преступление - кафе «Лютес»',
        description:
            'В тот прекрасный солнечный день Шарлотта должна была взять интервью у Лионии, известного кондитера. Темой разговора был новый хит Кур-де-Фонтейна - клубничный торт и способы его приготовления.',
        events: [
          ScenarioEvent(
              id: generateUID(),
              title: 'Погода',
              cardType: '',
              description: 'Преступление произошло в полуденный жаркий день.'),
          ScenarioEvent(
              id: generateUID(),
              title: 'Место',
              cardType: '',
              description:
                  'Кафе "Лютес", модное кофейное заведение Кур-де-Фонтейна.'),
          ScenarioEvent(
              id: generateUID(),
              title: 'Торт',
              cardType: '',
              description:
                  'Он был идеален, в нем не было ни единого изъяна, и казалось, что он вовсе игрушечный.'),
        ]),
    ScenarioAct(
        id: generateUID(),
        title: 'Еще один день, еще один патруль',
        description:
            'В середине дня жандарм Мелюзина остановилась во время своего патруля, после чего неожиданно исчезла на глазах у клиента. Посетители утверждают, что видели промчавшуюся между столиками тень. Когда Лиония с Шарлоттой подошли к столу, служащему центром презентации экспозиции, они увидели макушку головы Мелюзины.',
        events: [
          ScenarioEvent(
              id: generateUID(),
              title: 'Патруль',
              cardType: '',
              description:
                  'Обычно в это время суток Мелюзина находилась в патруле.'),
          ScenarioEvent(
              id: 'Дедуля',
              title: 'Свидетельства',
              cardType: '',
              description:
                  'Дедушка не успел сделать и глоток, как Мелюзина пропала из виду.'),
          ScenarioFalsyEvent(
              id: generateUID(),
              title: 'Тень',
              cardType: '',
              description: 'Тень, которая промчалась между столиками кофейни',
              falsyDescription:
                  'Тень, которая промчалась между столиками кофейни.'),
        ]),
    ScenarioAct(
        id: generateUID(),
        title: 'Интервью',
        description:
            'Когда Шарлотта и Лиония заметили Мелюзину, а та, в свою очередь, заметила их, она испугалась и подняла руки вверх. В это время торт упал, разлетевшись на мелкие кусочки, которые тут же начали плавиться от горячего асфальта. Эти брызги испачкали близлежащие предметы, в том числе и ноги посетителей. Окружающие были удивлены, но никто не стал злиться на Мелюзину. Когда Лиония подошла поближе и заметила механических жучков, разбросанных вокруг торта, она испуганно закричала и потеряла сознание.',
        events: [
          ScenarioEvent(
              id: generateUID(),
              title: 'Задержание',
              cardType: '',
              description:
                  'Мелюзина, увидев Шарлотту и Лионию, испугалась и уронила торт.'),
          ScenarioEvent(
              id: generateUID(),
              title: 'Остатки торта',
              cardType: '',
              description:
                  'Как утверждает Лиония, в торте были размещены дюжина шпионских жучков.'),
          ScenarioEvent(
              id: generateUID(),
              title: 'Обморок',
              cardType: '',
              description:
                  'Лиония запаниковала и потеряла сознание, как только увидела жучков.'),
        ]),
    ScenarioAct(
        id: generateUID(),
        title: 'Шпионская тень',
        description:
            'После того, как Лиония пришла в себя, она постарась довести данное событие до дела, а после и до суда. Лиония удтверждает, что она регулярно находила у себя в доме различные устройства для слежения, которые, по слухам, размещает Шпионская Тень, таинственный преступник, регулярно следящий за местной знатью и промышляющий продажей сплетней.',
        events: [
          ScenarioEvent(
              id: generateUID(),
              title: 'Шпионская тень',
              cardType: '',
              description: 'Преступник, промышляющий продажей сплетен.'),
          ScenarioEvent(
              id: generateUID(),
              title: 'Обвинение',
              cardType: '',
              description:
                  'Лиония обвиняет Шпионскую Тень в размещении жучков.'),
          ScenarioEvent(
              id: generateUID(),
              title: 'Мелюзина',
              cardType: '',
              description: 'Разве Мелюзина может быть Шпионской Тенью?',
              isHidden: true),
        ]),
  ],
  evedences: [
    ScenarioTruthyEvedence(
        id: generateUID(),
        title: 'Мелюзина',
        falsyEventId: '',
        description:
            'Небольшие обитатели Фонтейна с ушками или небольшими рожками на голове. Имеют длинный хвост с кисточкой на конце.'),
    ScenarioEvedence(
        id: generateUID(),
        title: 'Обвинение',
        description: 'Лиония собиралась дать интервью паровой птице.'),
    ScenarioEvedence(
        id: generateUID(),
        title: 'Солнечный день',
        description: 'Мог ли торт растаять в такой солнечный день?'),
    ScenarioEvedence(
        id: generateUID(),
        title: 'Клубника и тортики',
        description: 'Вообще-то я не люблю клубнику и тортики'),
  ],
);
