// ignore_for_file: non_constant_identifier_names

/// App Environment
///
/// Esta classe define o ambiente e a API de execução do aplicativo.
/// Ao escolher o ambiente, o aplicativo automaticamente define a rota da API.
class AppEnvironment {
  Environment? _environment;

  /// Retorna o ambiente do aplicativo.
  Environment get environment => _environment!;

  String? _API;

  /// Retorna a rota da API do aplicativo.
  String get API => _API!;

  AppEnvironment(Environment environment) {
    switch (environment) {
      case Environment.official:
        _environment = environment;
        _API = "10.0.0.35:90";
        break;

      case Environment.development:
        _environment = environment;
        _API = "localhost:51671";
        break;

      case Environment.test:
        _environment = environment;
        _API = "localhost:65463";
        break;

      default:
        throw "AppEnvironment: Unknown App Environment.";
    }
  }

  String get environmentName => environment.name.toUpperCase();

  bool get isDevelopment => environment == Environment.development;
  bool get isOfficial => environment == Environment.official;
  bool get isTest => environment == Environment.test;
}

/// Ambiente de execução do aplicativo.
///
/// Environment: `development`, `official` e `test`.
enum Environment {
  /// Ambiente para o desenvolvimento do aplicativo.
  development,

  /// Ambiente para uso oficial do aplicativo.
  official,

  /// Ambiente para testar o aplicativo.
  test,
}
