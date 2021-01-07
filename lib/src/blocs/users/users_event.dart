part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}

class GetUsersEvent implements UsersEvent {
  /// Obtener Usuarios
  ///
  /// Realiza una petición a la [API] para obtener la primera pagina de
  /// Usuarios.
  GetUsersEvent();
  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class RefreshUsersEvent implements UsersEvent {
  /// Recargar Usuarios
  ///
  /// Realiza una petición a la [API] para obtener la primera pagina de
  /// Usuarios.
  RefreshUsersEvent();
  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class LoadMoreUsersEvent implements UsersEvent {
  /// Cargar mas Usuarios
  ///
  /// Realiza una petición a la [API] para obtener la siguinte pagina de
  /// Usuarios y la agrega a la lista actual.
  LoadMoreUsersEvent();
  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class ClearUsersEvent implements UsersEvent {
  /// Limpiar bloc
  ///
  /// Reinicia el [UsersBloc] a su estado inicial
  ClearUsersEvent();
  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}
