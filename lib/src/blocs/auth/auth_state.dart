part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final bool loading;
  final ErrorType error;
  final UserModel user;
  final bool loginSucces;

  AuthState(
      {@required this.loading,
      @required this.error,
      @required this.user,
      @required this.loginSucces});

  factory AuthState.initial() {
    return AuthState(
        loading: false,
        error: ErrorType.noError,
        user: null,
        loginSucces: false);
  }

  AuthState copyWith({
    bool loading,
    ErrorType error,
    UserModel user,
    bool loginSucces,
  }) {
    return AuthState(
        loading: loading ?? this.loading,
        error: error ?? this.error,
        user: user ?? this.user,
        loginSucces: loginSucces ?? this.loginSucces);
  }

  @override
  List<Object> get props => [loading, error, user, loginSucces];
}
