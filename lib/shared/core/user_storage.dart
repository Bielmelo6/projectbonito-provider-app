import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserStorage {
  final storage = const FlutterSecureStorage();
  Future saveUserCredentials({
    required String id,
    required String nome,
    required String token,
    required String email,
    required String papel,
  }) async {
    await storage.write(key: 'id', value: id);
    await storage.write(key: 'nome', value: nome);
    await storage.write(key: 'token', value: token);
    await storage.write(key: 'email', value: email);
    await storage.write(key: 'papel', value: papel);
  }

  Future<String> getUserName() async {
    String? nome = await storage.read(key: 'nome');
    return nome ?? '';
  }

  Future<String> getUserToken() async {
    String? token = await storage.read(key: 'token');
    return token ?? '';
  }

  Future<bool> userHasCredentials() async {
    log('Checking if user has credentials');
    String? token = await storage.read(key: 'token');
    if (token != null) {
      log('User has credentials. Returning true');
      return true;
    } else {
      log('User doesnt have any credentials. Returning false');
      return false;
    }
  }

  Future<void> clearUserCredentials() async {
    await storage.deleteAll();
  }
}
