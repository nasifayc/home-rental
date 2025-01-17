import 'package:home_app/model/user_model.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final User user;

  UserLoaded(this.user);
}

class RateLoaded extends UserState {
  num rate;
  RateLoaded({required this.rate});
}

class UserError extends UserState {
  final String message;

  UserError(this.message);
}
