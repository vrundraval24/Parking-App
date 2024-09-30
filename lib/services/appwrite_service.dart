import 'package:appwrite/appwrite.dart';

class AppwriteService {
  static Client? _client;
  static Account? _account;

  static Client getClient() {
    _client ??= Client()
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('66f7b1cf0009511a13e0')
        .setSelfSigned(status: true);

    return _client!;
  }

  static Account getAccount() {
    _account ??= Account(getClient());

    return _account!;
  }
}
