import 'package:v1/common/features/scenario/Scenario.dart';
import 'package:v1/common/features/scenario/ScenarioDescription.dart';
import 'package:v1/common/features/scenario/ScenarioEvent.dart';
import 'package:v1/common/features/scenario/defendant/ScenarioDefendant.dart';
import 'package:v1/common/features/scenario/defendant/ScenarioDefendantOrigin.dart';
import 'package:v1/common/features/scenario/evedence/ScenarioEvedence.dart';
import 'package:v1/common/features/scenario/fact/ScenarioFact.dart';

final Scenario mysteryOfTheHeavenlyLyre = Scenario(
    id: '1',
    description: ScenarioDescription(
      id: '4',
      title: 'Тайна Небесной Лиры',
      description:
          'События разворачиваются в Мондштадте, где пропадает Небесная Лира Барбатоса, символ и страж магической силы города. Внезапно обвинения в адрес Путешественника, героя и спасителя Мондштадта, оглашаются в ходе торжественного судебного заседания.',
    ),
    events: [
      ScenarioEvent(
          id: '1',
          title: 'Присутсвие путешественника на месте преступления',
          description:
              'Во время расследования преступления, были обнаружены доказательства',
          facts: [
            ScenarioFact(
                id: '1',
                title: 'Следы у храма',
                cardType: 'Улика',
                description:
                    'Прокурор представляет доказательства следов боевых навыков Ветра на месте преступления.'),
            ScenarioFact(
                id: '2',
                title: 'Показания свидетеля',
                cardType: 'Событие',
                description:
                    'Свидетель утверждает, что видел Путешественника возле храма в момент кражи.'),
            ScenarioFact(
                id: '3',
                title: 'Отсутствие алиби',
                cardType: 'Факт',
                description:
                    'Обвинение указывает на отсутствие у Путешественника алиби.'),
          ]),
      ScenarioEvent(
          id: '2',
          title: 'Поиски истины',
          description:
              'Путешественник получает слово для представления своих улик и версии событий.',
          facts: [
            ScenarioFact(
                id: '4',
                title: 'Загадочный амулет',
                cardType: 'Факт',
                description:
                    'Путешественник предъявляет амулет с символикой древней секты, найденный недалеко от храма, указывая на их возможное участие в краже.'),
            ScenarioFact(
                id: '5',
                title: 'Запечатанный пакет',
                cardType: 'Факт',
                description:
                    'Путешественник описывает находку запечатанного пакета у члена совета города и раскрывает, что это было сделано для отвлечения внимания.'),
            ScenarioFact(
                id: '6',
                title: 'Тайная встреча',
                cardType: 'Собитие',
                description:
                    'Путешественник делится информацией о тайной встрече влиятельных лиц Мондштадта, предполагая их сговор.'),
          ]),
      ScenarioEvent(
          id: '3',
          title: 'Опрос свидетелей',
          description:
              'Путешественник получает слово для представления своих улик и версии событий.',
          facts: [
            ScenarioFact(
                id: '7',
                title: 'Священник Бэн',
                cardType: 'Свидетель',
                description:
                    'Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum.'),
            ScenarioFact(
                id: '8',
                title: 'Рыцари ордена Фавониус',
                cardType: 'Свидетели',
                description:
                    'Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum.'),
            ScenarioFact(
                id: '9',
                title: 'Тайный свидетель',
                cardType: 'Свидетели',
                description:
                    'Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum.'),
          ]),
      ScenarioEvent(
          id: '4',
          title: 'Завершение',
          description:
              'Путешественник получает слово для представления своих улик и версии событий.',
          facts: [
            ScenarioFact(
                id: '10',
                title: 'Окрававленный нож',
                cardType: 'Факт',
                description:
                    'Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum.'),
            ScenarioFact(
                id: '11',
                title: 'Перевернутый шкаф',
                cardType: 'Улика',
                description:
                    'Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum.'),
            ScenarioFact(
                id: '12',
                title: 'Бутылка рома',
                cardType: 'Улика',
                description:
                    'Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum, Lorem ipsum.'),
          ]),
    ],
    evedences: [
      ScenarioEvedence(
          id: '1',
          title: 'Мега дизадорант',
          description:
              '"Подтасованные доказательства", включая фальсифицированные следы и искажённые показания свидетелей.'),
      ScenarioEvedence(
          id: '2',
          title: 'Лира Барбатоса',
          description:
              '"Подтасованные доказательства", включая фальсифицированные следы и искажённые показания свидетелей.'),
      ScenarioEvedence(
          id: '3',
          title: 'Окрававленный нож',
          description:
              '"Подтасованные доказательства", включая фальсифицированные следы и искажённые показания свидетелей.'),
    ],
    defendant: ScenarioDefendant(
        id: '',
        name: '',
        description:
            'Путешественник стоит перед собранием ведущих лидеров и горожан Мондштадта, чтобы доказать свою невиновность.',
        bornOrigin: ScenarioDefendantOrigin(
          id: '1',
          title: 'Мондштадт',
          description: '',
          additionalTitle: 'Из семьи искателей приключений',
        ),
        professionOrigin: ScenarioDefendantOrigin(
          id: '2',
          title: 'Ученик алхимика',
          description: '',
        ),
        secretOrigin: ScenarioDefendantOrigin(
          id: '3',
          title: 'Скрывает, что из семьи лоуренсов',
          description: '',
        )));
