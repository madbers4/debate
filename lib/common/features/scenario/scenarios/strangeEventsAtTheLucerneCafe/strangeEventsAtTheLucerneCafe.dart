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
    title: 'Шпионская Тень: кафе «Лютес»',
    description:
        'В залитом полуденным солнцем городе Кур-де-Фонтейн, на территории кафе "Лютес", был пойман широко известный преступник - Шпионская Тень. Он был пойман с поличным, когда пытался разместить шпионские жучки прямо в новый бестселлер Фонтейна - клубничный торт, известный создателя которого, Лиония, собиралась дать интервью "Паровой Птице", главной газете Фонтейна.',
  ),
  defendant: ScenarioDefendant(
      id: generateUID(),
      name: 'Мелюзина',
      description:
          'Вы – Мелюзина. Действительно находились в кафе, и Вас действительно поймали практически с поличным. Находясь на утреннем патруле, вы заметили шикарный торт. Вас пленил клубничный запах, и Вы, пользуясь моментом, моментально приблизились к торту поближе, чтобы присмотреться к нему внимательней. Приблизившивсь, показалось, что грани торта начали таять, превращаясь в жидкость, Вы не раздумывая принимаете решение как-то спасти торт и ваши не руки оказываются на подставке для торта, чтобы переместить его с жаркого места.',
      bornOrigin: ScenarioDefendantOrigin(
        id: generateUID(),
        title: 'Происхождение',
        description:
            'Мелюзина, которая принимает решение жить вместе с людьми в Кур-де-Фонтейне',
        additionalTitle: '',
      ),
      professionOrigin: ScenarioDefendantOrigin(
        id: generateUID(),
        title: 'Профессия',
        description: 'Жандарм',
      ),
      secretOrigin: ScenarioDefendantOrigin(
        id: generateUID(),
        title: 'Секрет',
        description:
            'Секрет полишинеля. Скрывает, что очень любит крубнику и торты.',
      )),
  acts: [
    ScenarioAct(
        id: generateUID(),
        title: 'Место преступление - кафе «Лютес»',
        description:
            'В тот прекрасный день, Шарлотта должна была взять интервью у известного кондитера - Лионии, темой был новый хит Кур-де-Фонтейна, клубничный торт и разнообразные способы его приготовления.',
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
                  'Кафе «Лютес», модное кофейное заведение Кур-де-Фонтейн.'),
          ScenarioEvent(
              id: generateUID(),
              title: 'Торт',
              cardType: '',
              description:
                  'Он был идеален, в нём нет ни единого изъяна и кажется, будто он вовсе игрушечный.'),
        ]),
    ScenarioAct(
        id: generateUID(),
        title: 'Еще один день, еще один патруль',
        description:
            'В середине дня, жандарм Миллюзина, остановилась во время своего патруля, после чего, прямо на глазах у клиента внезапно растворилась. Клиенты удтверждают, что видели промчавшеюся, между столиками, тень. Когда Лиония с Шарлоттой подошли к забронированному столику, они увидели макушку головы миллюзины.',
        events: [
          ScenarioEvent(
              id: generateUID(),
              title: 'Патруль',
              cardType: '',
              description:
                  'Обычно, в это время суток, Миллюзина находится в патруле'),
          ScenarioEvent(
              id: 'Дедуля',
              title: 'Свидетельства',
              cardType: '',
              description:
                  'Дедуля, не успел сделать и глоток, как Мелюзина пропала из виду'),
          ScenarioFalsyEvent(
              id: generateUID(),
              title: 'Тень',
              cardType: '',
              description: 'Тень, которая промчалась между столиками кофейни',
              falsyDescription:
                  'Мелюзина, воспользовавшись своим ростом, промчалась между столиками кофейни'),
        ]),
    ScenarioAct(
        id: generateUID(),
        title: 'Интервью',
        description:
            'Когда Шарлотта и Лиония земетили мелюзину, а мелюзина заметила их, она перепугалась и подняла руки вверх, торт упал и разрушился, раскидав кусочки вокруг. Окружающие были удивлены, но никто и не думал злится на мелюзину. Когда Лиония подошла поближе, заметив механических жучков, разбросанных вокруг торта, она крикнула и упала в обморок.',
        events: [
          ScenarioEvent(
              id: generateUID(),
              title: 'Задержание',
              cardType: '',
              description: 'Миллюзина просто сдалась, поднявши руки вверх'),
          ScenarioEvent(
              id: generateUID(),
              title: 'Жучки',
              cardType: '',
              description:
                  'Как удтверждает Лиония, в торту было размещено дюжена шпионских жучков'),
          ScenarioEvent(
              id: generateUID(),
              title: 'Обморок',
              cardType: '',
              description:
                  'Лиония запаниковала и потеряла сознания, как только увидела жучков'),
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
              description: 'Преступник, промышляющий продажей сплетней'),
          ScenarioEvent(
              id: generateUID(),
              title: 'Обвинение',
              cardType: '',
              description: 'Лиония поспешила довести дело до суда'),
          ScenarioEvent(
              id: generateUID(),
              title: 'Мелюзины',
              cardType: '',
              description: 'Разве миллюзина может быть Шпионской Тенью?',
              isHidden: true),
        ]),
  ],
  evedences: [
    ScenarioTruthyEvedence(
        id: generateUID(),
        title: 'Мелюзина',
        falsyEventId: '',
        description:
            'Не большие обитатели Фонтейна с ушками или небольшими рожки на голове, имеющими длинный хвост с кисточкой на конце'),
    ScenarioEvedence(
        id: generateUID(),
        title: 'Фотосъемка',
        description: 'Лиония, собиралась дать интервью паровой птице.'),
    ScenarioEvedence(
        id: generateUID(),
        title: 'Солнечный день',
        description: 'Мог ли торт растаять в такой солнечный день?'),
  ],
);
