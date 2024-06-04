import 'package:v1/common/features/scenario/Scenario.dart';
import 'package:v1/common/features/scenario/ScenarioAct.dart';
import 'package:v1/common/features/scenario/ScenarioDescription.dart';
import 'package:v1/common/features/scenario/defendant/ScenarioDefendant.dart';
import 'package:v1/common/features/scenario/defendant/ScenarioDefendantOrigin.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioEvedence.dart';
import 'package:v1/common/features/scenario/event/ScenarioEvent.dart';
import 'package:v1/common/utils/generateUID.dart';

final Scenario strangeEventsAtTheLucerneCafe = Scenario(
  id: generateUID(),
  description: ScenarioDescription(
    id: generateUID(),
    title: 'Шпионская Тень: кафе «Лютес»',
    description:
        'В залитом полуденным солнцем городе Кур-де-Фонтейн, на территории кафе "Лютес", был пойман широко известный преступник - Шпионская Тень. Он был пойман с поличным, когда пытался разместить шпионские жучки прямо в клубничный торт, нового бестселлера Фонтейна, известного создателя которого - Лиония, собиралась дать интервью паровой птице. Из-за настойчивости Лионии, казалось бы, провальное дело дошло до суда.',
  ),
  defendant: ScenarioDefendant(
      id: generateUID(),
      name: 'Мизулина',
      description:
          'Вы – Мелюзина. Действительно находились в кафе, где вас поймали с поличным Шарлотта и Лиония. Находясь на утреннем патруле, вы заметили клубничный торт, идеальный, в котором нет ни единого изъяна, казалось, будто он вовсе игрушечный. Вас пленил клубничный запах, и вы, пользуясь своим низким ростом, скрытно приблизились к торту поближе, как тут же заметили, как он прямо у вас на глазах начал превращаться в желе. Прошло меньше секунды, как вы принимаете решение спасти форму торта, и ваши руки оказываются на его гранях.',
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
            'Секрет полишинеля, скрывает, что очень любит крубнику и торты',
      )),
  acts: [
    ScenarioAct(id: generateUID(), title: '', description: '', events: [
      ScenarioEvent(
          id: generateUID(), title: '', cardType: '', description: ''),
      ScenarioEvent(
          id: generateUID(), title: '', cardType: '', description: ''),
      ScenarioEvent(
          id: generateUID(), title: '', cardType: '', description: ''),
    ]),
    ScenarioAct(id: generateUID(), title: '', description: '', events: [
      ScenarioEvent(
          id: generateUID(), title: '', cardType: '', description: ''),
      ScenarioEvent(
          id: generateUID(), title: '', cardType: '', description: ''),
      ScenarioEvent(
          id: generateUID(), title: '', cardType: '', description: ''),
    ]),
    ScenarioAct(id: generateUID(), title: '', description: '', events: [
      ScenarioEvent(
          id: generateUID(), title: '', cardType: '', description: ''),
      ScenarioEvent(
          id: generateUID(), title: '', cardType: '', description: ''),
      ScenarioEvent(
          id: generateUID(), title: '', cardType: '', description: ''),
    ]),
    ScenarioAct(id: generateUID(), title: '', description: '', events: [
      ScenarioEvent(
          id: generateUID(), title: '', cardType: '', description: ''),
      ScenarioEvent(
          id: generateUID(), title: '', cardType: '', description: ''),
      ScenarioEvent(
          id: generateUID(), title: '', cardType: '', description: ''),
    ]),
  ],
  evedences: [
    ScenarioEvedence(id: generateUID(), title: '', description: ''),
    ScenarioEvedence(id: generateUID(), title: '', description: ''),
    ScenarioEvedence(id: generateUID(), title: '', description: ''),
  ],
);
