const String actOneId = 'АКТ I';
const String actTwoId = 'АКТ II';
const String actThreeId = 'АКТ III';
const String actFourId = 'АКТ IV';
const String actFiveId = 'АКТ V';

String? getNextActId(String actId) {
  switch (actId) {
    case actOneId:
      return actTwoId;
    case actTwoId:
      return actThreeId;
    case actThreeId:
      return actFourId;
    case actFourId:
      return actFiveId;
    case actFiveId:
      return null;
    default:
      return null;
  }
}

String? getPrevActId(String actId) {
  switch (actId) {
    case actOneId:
      return null;
    case actTwoId:
      return actOneId;
    case actThreeId:
      return actTwoId;
    case actFourId:
      return actThreeId;
    case actFiveId:
      return actFourId;
    default:
      return null;
  }
}
