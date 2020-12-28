part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  AuthEvent();
  @override
  List<Object> get props => [];
}

class LoginEvent implements AuthEvent {
  final String user;
  final String password;

  LoginEvent({@required this.user, @required this.password});
  @override
  List<Object> get props => [this.user, this.password];

  @override
  bool get stringify => true;
}

class GetUserEvent implements AuthEvent {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class SetVerifyUserEvent implements AuthEvent {
  final UserModel user;

  SetVerifyUserEvent({@required this.user});

  @override
  List<Object> get props => [this.user];

  @override
  bool get stringify => true;
}

class SingOutEvent implements AuthEvent {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class ClearEvent implements AuthEvent {
  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}
