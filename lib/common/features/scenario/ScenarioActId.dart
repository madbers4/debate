enum ActId { One, Two, Three, Four }

String getActTitleByActId(ActId actId) {
  switch (actId) {
    case ActId.One:
      return 'АКТ I';
    case ActId.Two:
      return 'АКТ II';
    case ActId.Three:
      return 'АКТ III';
    case ActId.Four:
      return 'АКТ IV';
    default:
      return 'Не верный акт';
  }
}

ActId? getNextActId(ActId actId) {
  switch (actId) {
    case ActId.One:
      return ActId.Two;
    case ActId.Two:
      return ActId.Three;
    case ActId.Three:
      return ActId.Four;
    case ActId.Four:
      return null;
    default:
      return null;
  }
}

ActId? getPrevActId(ActId actId) {
  switch (actId) {
    case ActId.One:
      return null;
    case ActId.Two:
      return ActId.One;
    case ActId.Three:
      return ActId.Two;
    case ActId.Four:
      return ActId.Three;
    default:
      return null;
  }
}
