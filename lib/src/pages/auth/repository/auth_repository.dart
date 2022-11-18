import 'package:greengrocer/src/pages/constants/endpoints.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class AuthRepository {
  // Importando o service httpManager
  final HttpManager _httpManager = HttpManager();

  Future signIn({required String email, required String password}) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.signin,
      method: HttpMethods.post,
      body: {
        'email': email,
        'password': password,
      },
    );

    if (result['result'] != null) {
      print('Signin funcionou!');
    } else {
      print('Signin não funcionou!');
    }
  }
}
