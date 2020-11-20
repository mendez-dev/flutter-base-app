part of 'preferences_bloc.dart';

abstract class PreferencesState extends Equatable {
  const PreferencesState();
}

class PreferencesNotLoaded extends PreferencesState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class PreferencesLoaded extends PreferencesState {
  final ThemeModel theme;

  PreferencesLoaded({@required this.theme});

  @override
  String toString() => '$runtimeType { $theme }';

  @override
  List<Object> get props => [theme];
}
