import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../data_sources/api_service.dart';

class UserRepositoryImpl implements UserRepository {
  final ApiService apiService;

  UserRepositoryImpl(this.apiService);

  @override
  Future<User> getUser() async {
    final userModel = await apiService.fetchUser();

    // Convert UserModel to User entity
    return User(
      id: userModel.id,
      name: userModel.name
    );
  }
}
