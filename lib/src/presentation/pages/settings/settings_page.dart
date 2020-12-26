import 'package:base_app/src/blocs/preferences/preferences_bloc.dart';
import 'package:base_app/src/models/theme/theme_model.dart';
import 'package:base_app/src/presentation/widgets/dialogs/simple_dialog.dart';
import 'package:flutter/material.dart' hide SimpleDialog;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsPage extends StatelessWidget {
  static final String routeName = "SettingsPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Configuración')),
        body: SingleChildScrollView(
          child: BlocBuilder<PreferencesBloc, PreferencesState>(
              builder: (BuildContext context, PreferencesState state) {
            if (state is PreferencesLoaded) {
              return Column(
                children: [
                  ListTile(
                    leading: Icon(
                      FontAwesomeIcons.palette,
                      color: Theme.of(context).iconTheme.color,
                      size: 30,
                    ),
                    title: Text("Tema"),
                    subtitle: Text(_showThemeName(state.theme.name)),
                    onTap: () => showDialog(
                        context: context,
                        child: SimpleDialog(
                          title: "Seleccionar tema",
                          child: ThemeSelector(),
                        )),
                  ),
                  ListTile(
                    leading: Icon(
                      FontAwesomeIcons.info,
                      color: Theme.of(context).iconTheme.color,
                      size: 30,
                    ),
                    title: Text("Acerca de"),
                    subtitle: Text("Conoce mas sobre nosotros"),
                  )
                ],
              );
            }
            return Center(
              child: Text("No deberia estar viendo este mensaje"),
            );
          }),
        ));
  }
}

// Selector del tema
class ThemeSelector extends StatelessWidget {
  const ThemeSelector({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        if (state is PreferencesLoaded) {
          return Column(
            children: [
              RadioListTile<ThemeModel>(
                onChanged: (theme) {
                  BlocProvider.of<PreferencesBloc>(context)
                      .add(UpdateTheme(theme: theme));
                  Navigator.pop(context);
                },
                value: ThemeModel.light,
                groupValue: state.theme,
                title: Text(_showThemeName(ThemeModel.light.name)),
              ),
              RadioListTile<ThemeModel>(
                onChanged: (theme) {
                  BlocProvider.of<PreferencesBloc>(context)
                      .add(UpdateTheme(theme: theme));
                  Navigator.pop(context);
                },
                value: ThemeModel.dark,
                groupValue: state.theme,
                title: Text(_showThemeName(ThemeModel.dark.name)),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}

String _showThemeName(String name) {
  switch (name) {
    case "light":
      return "Claro";
      break;
    default:
      return "Oscuro";
  }
}
