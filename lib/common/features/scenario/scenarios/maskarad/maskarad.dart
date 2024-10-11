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

final Scenario maskarad = Scenario(
    id: generateUID(),
    description: ScenarioDescription(
      id: generateUID(),
      background: 'test-brown-background.png',
      title: 'Бал-маскарад',
      description:
          'Недавно состоявшийся бал-маскарад Маркизы Роуз, который должен был стать главным светским событием года, омрачился утратой исторической вазы. Вазу разбил неизвестный в костюме хиличурла, и его личность так и не была установлена, поскольку костюм полностью закрывал лицо.',
    ),
    defendant: ScenarioDefendant(
        id: generateUID(),
        background: 'test-brown-background.png',
        name: 'Мелюзина',
        description:
            'По словам свидетелей, вазу разбил один из «хиличурлов».  Обвиняемый посетил бал в костюме хиличурла. Тут все очевидно.',
        bornOrigin: ScenarioDefendantOrigin(
          id: generateUID(),
          title: 'Происхождение',
          description: 'Наследник знатного рода.',
          additionalTitle: '',
        ),
        professionOrigin: ScenarioDefendantOrigin(
          id: generateUID(),
          title: 'Профессия',
          description: 'Член клуба любителей хиличурлов.',
        ),
        secretOrigin: ScenarioDefendantOrigin(
          id: generateUID(),
          title: 'Секрет',
          description:
              'Вы не очень любите второго члена клуба любителей хиличурлов, который пошел с вами на бал.',
        )),
    acts: [
      ScenarioAct(
          id: actOneId,
          title: 'Очевидное обвинение',
          description:
              'По словам свидетелей, вазу разбил хиличурл, а обвиняемый посетил бал в костюме хиличурла. Тут все очевидно.',
          events: [
            ScenarioEvent(
                id: 'Профессиональный пошив',
                title: 'Профессиональный пошив',
                description: 'Костюмы были заказаны у модного дома Тиори.'),
            ScenarioFalsyEvent(
                id: 'Подождите-ка…',
                title: 'Подождите-ка...',
                description:
                    'На балу-маскараде точно было больше одного хиличурла.'),
            ScenarioEvent(
                id: 'Вторая эко-кожа',
                title: 'Вторая эко-кожа',
                description:
                    'При обыске в вашем поместье обнаружили достоверный костюм хиличурла.'),
          ]),
      ScenarioAct(
          id: actTwoId,
          title: 'Эх, не получилось',
          description:
              'Во время допроса обвиняемый заявил, что не заходил в комнату, где стояла разбившаяся ваза. Он якобы провел весь вечер у стола с закусками в компании другого хиличурла. Но при этом он не хочет называть имя того, кто может это подтвердить. Это выглядит так, как будто вы все выдумали.  Как вы можете это объяснить?',
          events: [
            ScenarioEvent(
                id: 'Одной крови',
                title: 'Одной крови',
                description:
                    'Обвиняемый утверждает, что весь вечер провел с другим гостем в костюме хиличурла за светской беседой на хиличурловом языке.'),
            ScenarioEvent(
                id: 'Бал-маскарад',
                title: 'Бал-маскарад',
                description:
                    'Смысл бала маскарада в том, чтобы остаться неузнанным.'),
            ScenarioFalsyEvent(
              id: 'Я глух и слеп',
              title: 'Я глух и слеп',
              description:
                  'Следственный эксперимент показал, что маска позволяет видеть только ноги, а меховой капюшон приглушает все звуки.',
            ),
          ]),
      ScenarioAct(
          id: actThreeId,
          title: 'Защита',
          description:
              'Пожалуйста, воздержитесь от безосновательных нападок на моего подзащитного. Давайте рассмотрим всех подозреваемых. Может ли подзащитный идентифицировать себя на фото? Что кажется вам подозрительным?',
          events: [
            ScenarioEvent(
                id: 'Вот они, справа налево',
                title: 'Вот они, справа налево',
                description:
                    'Шарлотта сфотографировала всех трех хиличурлов на балу: электро, пиро и обычного хиличурлов.'),
            ScenarioFalsyEvent(
                id: 'Как настоящий',
                title: 'Как настоящий',
                description:
                    'Гости бала жаловались на странный запах, который исходил от фиолетового хиличурла. По словам гостей, которые часто пересекались с хиличурлами, запах был передан очень точно.'),
            ScenarioFalsyEvent(
                id: 'Слипнется',
                title: 'Слипнется',
                description:
                    'Хиличурл запачкал мех на своем костюме кремом от пирожного, пока пытался просунуть его под маску.'),
          ]),
      ScenarioAct(
          id: actFourId,
          title: 'Весь вечер...',
          description:
              'Предположим, что на бал и правда пробрался настоящий хиличурл. Но что это доказывает? Преступником может быть кто угодно из вас. Свидетель утверждает, что кто-то из хиличурлов повздорил с остальными и убежал в комнату, где была выставлена ваза, врезавшись по пути в дверной проем. Это точно были вы!',
          events: [
            ScenarioEvent(
                id: 'Мита!',
                title: 'Мита!',
                description:
                    'Вы провели весь вечер в компании другого хиличурла и стола с закусками.'),
            ScenarioFalsyEvent(
                id: 'Гуша!',
                title: 'Гуша!',
                description:
                    'Ваш товарищ из клуба любителей хиличурлов кажется случайно оскорбил настоящего хиличурла, и чуть не получил по шапке.'),
            ScenarioEvent(
                id: 'Словарный запас',
                title: 'Словарный запас',
                description:
                    'В отличие от некоторых, вы можете бегло говорить на хиличурлском, и даже немного различать региональные акценты.'),
          ]),
    ],
    evedences: [
      ScenarioEvedence(
          id: 'Технологии',
          title: 'Технологии',
          description: 'Дом Тиори разработал материал, напоминающий кожу.'),
      ScenarioTruthyEvedence(
          id: 'Заголовок в газете',
          title: 'Заголовок в газете',
          falsyEventIds: ['Подождите-ка…'],
          falsyDescription:
              '«Хиличурлов» было несколько, поэтому нельзя безосновательно обвинять просто одного из них.',
          triggeredTransitionId: 'Подождите-ка…',
          description: '«Бал маркизы Роуз посетило три хиличурла...»'),
      ScenarioEvedence(
          id: 'Маска хиличурла',
          title: 'Маска хиличурла',
          description: 'Сделана из папье-маше.'),
    ],
    transitionEvents: [
      TransitionEvent(id: 'Подождите-ка…', nextActId: actTwoId, effects: []),
      TransitionEvent(
          id: 'fdsdf',
          afterNoEvedenceLeft: true,
          nextActId: actTwoId,
          effects: [
            TransitionEventRemoveEvedenceEffect(
                id: generateUID(),
                evedenceIds: ['Технологии', 'Маска хиличурла']),
            TransitionEventAddEvedencesEffect(
              id: generateUID(),
              evedences: [
                ScenarioEvedence(
                    id: 'Ми домо',
                    title: 'Ми домо',
                    description:
                        'Самоучитель танцев хиличурлов, написанный Эллой Маск.'),
                ScenarioTruthyEvedence(
                    id: 'Костюм',
                    title: 'Костюм',
                    falsyEventIds: ['Я глух и слеп'],
                    falsyDescription:
                        'Обвиняемый почти ничего не видел и не слышал. Его собеседник был в таком же костюме, покрывающим все тело.',
                    triggeredTransitionId: 'Я глух и слеп',
                    description:
                        'В нем и правда почти ничего не видно и не слышно.'),
                ScenarioEvedence(
                    id: 'Плоский круассан',
                    title: 'Плоский круассан',
                    description: 'Был на столе закусок.'),
              ],
            ),
          ]),
      TransitionEvent(id: 'Я глух и слеп', nextActId: actThreeId, effects: []),
      TransitionEvent(
          id: 'fsddf',
          afterNoEvedenceLeft: true,
          nextActId: actThreeId,
          effects: [
            TransitionEventRemoveEvedenceEffect(
                id: generateUID(),
                evedenceIds: ['Ми домо', 'Плоский круассан']),
            TransitionEventAddEvedencesEffect(
              id: generateUID(),
              evedences: [
                ScenarioTruthyEvedence(
                    id: 'Нечеловеческие пропорции',
                    title: 'Нечеловеческие пропорции',
                    falsyEventIds: ['Как настоящий'],
                    falsyDescription:
                        'Получается, что на бал-маскарад пробрался настоящий хиличурл?',
                    triggeredTransitionId: 'Как настоящий',
                    description:
                        'У одного из хиличурлов на фото руки до колен.'),
                ScenarioTruthyEvedence(
                    id: 'Крем',
                    title: 'Крем',
                    falsyEventIds: ['Слипнется'],
                    falsyDescription:
                        'Подсудимый это хиличурл посередине с кремом на костюме.',
                    triggeredTransitionId: 'Слипнется',
                    description: 'На костюме подсудимого есть следы от крема.'),
                ScenarioEvedence(
                    id: 'Обломали',
                    title: 'Обломали',
                    description: 'У другого хиличурла сломан рог на маске.'),
              ],
            ),
          ]),
      TransitionEvent(id: 'Как настоящий', effects: []),
      TransitionEvent(id: 'Слипнется', effects: []),
      TransitionEvent(
          id: '123',
          afterNoEvedenceLeft: true,
          nextActId: actFourId,
          effects: [
            TransitionEventRemoveEvedenceEffect(
                id: generateUID(), evedenceIds: ['Обломали']),
            TransitionEventAddEvedencesEffect(
              id: generateUID(),
              evedences: [
                ScenarioTruthyEvedence(
                    id: 'Крафт поломался',
                    title: 'Крафт поломался',
                    falsyEventIds: ['Гуша!'],
                    falsyDescription:
                        'Ваш товарищ по хобби (?) убежал, испугавшись гнева настоящего хиличурла, но из-за того, что в костюме ничего не видно, он врезался в дверной косяк и отбил рог по пути.',
                    triggeredTransitionId:
                        'Игра завершается невиновностью игрока.',
                    description:
                        'Кусочек рога рядом с залой, где разбили вазу.'),
                ScenarioEvedence(
                    id: 'Хиличурлский разговорник',
                    title: 'Хиличурлский разговорник',
                    description: 'Выпал из-за пояса вашего товарища.'),
                ScenarioEvedence(
                    id: 'Фиолетовые ноги',
                    title: 'Фиолетовые ноги',
                    description:
                        'Вашего собеседника это все, что вы видели весь вечер.'),
              ],
            ),
          ]),
      TransitionEvent(
          id: 'Игра завершается невиновностью игрока.',
          endGame: true,
          effects: []),
    ]);
