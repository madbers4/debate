class Settings {
  String? username;
  String? apiHost;
  int timeoutMs;

  Settings(
      {this.username,
      this.apiHost = 'http://localhost:3000',
      this.timeoutMs = 300000}) {}
}
