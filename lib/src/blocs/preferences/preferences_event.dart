part of 'preferences_bloc.dart';

abstract class PreferencesEvent extends Equatable {
  const PreferencesEvent();
}

class LoadPreferences extends PreferencesEvent {
  @override
  List<Object> get props => throw UnimplementedError();
}

class UpdateTheme extends PreferencesEvent {
  final ThemeModel theme;

  UpdateTheme({this.theme});

  @override
  List<Object> get props => [theme];

  @override
  String toString() => '$runtimeType { $theme }';
}
