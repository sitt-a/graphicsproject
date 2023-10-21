import 'package:students_voice/domain/User_model/user.dart';
import '../../domain/auth_model/auth.dart';
import '../data_provider/auth_data_provider.dart';

class AuthRepository {
  final AuthDataProvider dataProvider;
  AuthRepository(this.dataProvider);

  Future<User> login(Auth auth) async {
    
    return await dataProvider.post_login(auth);
  }

  Future<User> signup(User user) async {
    return await dataProvider.post_signup(user);
  }

  // ignore: non_constant_identifier_names
  Future<Future<String>> get_user() async {
    return dataProvider.get();
  }
}