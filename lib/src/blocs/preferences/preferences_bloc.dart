import 'dart:async';

import 'package:base_app/src/models/theme/theme_model.dart';
import 'package:base_app/src/repositories/preferences/preferences_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'preferences_event.dart';
part 'preferences_state.dart';

class PreferencesBloc extends Bloc<PreferencesEvent, PreferencesState> {
  PreferencesBloc({PreferencesRepository preferencesRepository})
      : this._preferencesRepository = preferencesRepository,
        super(PreferencesNotLoaded());

  final PreferencesRepository _preferencesRepository;

  @override
  Stream<PreferencesState> mapEventToState(
    PreferencesEvent event,
  ) async* {
    if (event is LoadPreferences) {
      yield* _mapLoadPreferencesToState();
    } else if (event is UpdateTheme) {
      yield* _mapUpdateThemeToState(event);
    }
  }

  Stream<PreferencesState> _mapLoadPreferencesToState() async* {
    final theme = (await _preferencesRepository.getTheme());
    if (theme == null) {
      add(UpdateTheme(theme: ThemeModel.light));
    } else {
      yield PreferencesLoaded(theme: theme);
    }
  }

  Stream<PreferencesState> _mapUpdateThemeToState(UpdateTheme event) async* {
    _preferencesRepository.setTheme(event.theme);
    yield PreferencesLoaded(theme: event.theme);
  }
}
