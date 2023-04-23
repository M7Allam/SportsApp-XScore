class App{
  final String version;

  const App({
    required this.version,
  });

  Map<String, dynamic> toMap() {
    return {
      'version': version,
    };
  }

  factory App.fromMap(Map<String, dynamic> map) {
    return App(
      version: map['version'] as String,
    );
  }
}