import 'package:v1/common/features/scenario/Scenario.dart';
import 'package:v1/common/features/scenario/ScenarioDescription.dart';
import 'package:v1/common/features/scenario/ScenarioAct.dart';
import 'package:v1/common/features/scenario/defendant/ScenarioDefendant.dart';
import 'package:v1/common/features/scenario/defendant/ScenarioDefendantOrigin.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioEvedence.dart';
import 'package:v1/common/features/scenario/event/ScenarioEvent.dart';
import 'package:v1/common/utils/generateUID.dart';

final Scenario mysteryOfTheHeavenlyLyre = Scenario(
    id: generateUID(),
    description: ScenarioDescription(
      id: generateUID(),
      title: 'Тайна Небесной Лиры',
      description:
          'События разворачиваются в Мондштадте, где пропадает Небесная Лира Барбатоса, символ и страж магической силы города. Внезапно обвинения в адрес Путешественника, героя и спасителя Мондштадта, оглашаются в ходе торжественного судебного заседания.',
    ),
    acts: [
      ScenarioAct(
          id: generateUID(),
          title: 'Присутсвие путешественника на месте преступления',
          description:
              'Во время расследования преступления, были обнаружены доказательства',
          events: [
            ScenarioEvent(
                id: generateUID(),
                title: 'Следы у храма',
                cardType: 'Улика',
                description:
                    'Прокурор представляет доказательства следов боевых навыков Ветра на месте преступления.'),
            ScenarioEvent(
                id: generateUID(),
                title: 'Показания свидетеля',
                cardType: 'Событие',
                description:
                    'Свидетель утверждает, что видел Путешественника возле храма в момент кражи.'),
            ScenarioEvent(
                id: generateUID(),
                title: 'Отсутствие алиби',
                cardType: 'Факт',
                description:
                    'Обвинение указывает на отсутствие у Путешественника алиби.'),
          ]),
      ScenarioAct(
          id: generateUID(),
          title: 'Поиски истины',
          description:
              'Путешественник получает слово для представления своих улик и версии событий.',
          events: [
            ScenarioEvent(
                id: generateUID(),
                title: 'Загадочный амулет',
                cardType: 'Факт',
                description:
                    'Путешественник предъявляет амулет с символикой древней секты, найденный недалеко от храма, указывая на их возможное участие в краже.'),
            ScenarioEvent(
                id: generateUID(),
                title: 'Запечатанный пакет',
                cardType: 'Факт',
                description:
                    'Путешественник описывает находку запечатанного пакета у члена совета города и раскрывает, что это было сделано для отвлечения внимания.'),
            ScenarioEvent(
                id: generateUID(),
                title: 'Тайная встреча',
                cardType: 'Собитие',
                description:
                    'Путешественник делится информацией о тайной встрече влиятельных лиц Мондштадта, предполагая их сговор.'),
          ]),
      ScenarioAct(
          id: generateUID(),
          title: 'Опрос свидетелей',
          description:
              'Путешественник получает слово для представления своих улик и версии событий.',
          events: [
            ScenarioEvent(
                id: generateUID(),
                title: 'Священник Бэн',
                cardType: 'Свидетель',
                description:
                    'Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum.'),
            ScenarioEvent(
                id: generateUID(),
                title: 'Рыцари ордена Фавониус',
                cardType: 'Свидетели',
                description:
                    'Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum.'),
            ScenarioEvent(
                id: generateUID(),
                title: 'Тайный свидетель',
                cardType: 'Свидетели',
                description:
                    'Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum.'),
          ]),
      ScenarioAct(
          id: generateUID(),
          title: 'Завершение',
          description:
              'Путешественник получает слово для представления своих улик и версии событий.',
          events: [
            ScenarioEvent(
                id: generateUID(),
                title: 'Окрававленный нож',
                cardType: 'Факт',
                description:
                    'Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum.'),
            ScenarioEvent(
                id: generateUID(),
                title: 'Перевернутый шкаф',
                cardType: 'Улика',
                description:
                    'Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum.'),
            ScenarioEvent(
                id: generateUID(),
                title: 'Бутылка рома',
                cardType: 'Улика',
                description:
                    'Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum.'),
          ]),
    ],
    evedences: [
      ScenarioEvedence(
          id: generateUID(),
          title: 'Свидетельства Барбары',
          description:
              '"Подтасованные доказательства", включая фальсифицированные следы и искажённые показания свидетелей.'),
      ScenarioEvedence(
          id: generateUID(),
          title: 'Лира Барбатоса',
          description:
              '"Подтасованные доказательства", включая фальсифицированные следы и искажённые показания свидетелей.'),
      ScenarioEvedence(
          id: generateUID(),
          title: 'Окрававленный нож',
          description:
              '"Подтасованные доказательства", включая фальсифицированные следы и искажённые показания свидетелей.'),
    ],
    defendant: ScenarioDefendant(
        id: generateUID(),
        name: '',
        description:
            'Путешественник стоит перед собранием ведущих лидеров и горожан Мондштадта, чтобы доказать свою невиновность.',
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
