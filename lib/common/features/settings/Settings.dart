class Settings {
  String username;
  String apiHost;
  int timeousSec;
  String? authToken;

  Settings(
      {required this.username,
      required this.apiHost,
      required this.timeousSec,
      this.authToken});
}
