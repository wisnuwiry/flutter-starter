import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/core.dart';
import '../../../../../l10n/l10n.dart';
import '../../../settings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          _ThemeSection(),
          _LanguageSection(),
        ],
      ),
    );
  }
}

class _ThemeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return ListTile(
          leading: const Icon(Icons.style),
          title: const Text('Theme'),
          onTap: () => _showDialogSelectTheme(context, AppTheme.values),
        );
      },
    );
  }

  void _showDialogSelectTheme(BuildContext context, List<AppTheme> themes) {
    showDialog(
      context: context,
      builder: (_) => SimpleDialog(
        children: themes
            .map(
              (theme) => ListTile(
                title: Text(theme.toText().toUpperCase()),
                onTap: () {
                  BlocProvider.of<ThemeBloc>(context)
                      .add(ChangeThemeEvent(theme));
                  context.router.pop();
                },
              ),
            )
            .toList(),
      ),
    );
  }
}

class _LanguageSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        return ListTile(
          leading: const Icon(Icons.language),
          title: const Text('Language'),
          trailing: Text(state.language?.code ?? context.l10n.localeName),
          onTap: () =>
              _showDialogSelectLanguage(context, state.supportedLanguages),
        );
      },
    );
  }

  void _showDialogSelectLanguage(
      BuildContext context, List<Language> languages) {
    showDialog(
      context: context,
      builder: (_) => SimpleDialog(
        children: languages
            .map(
              (lang) => ListTile(
                title: Text(lang.name),
                trailing: Text(lang.code),
                onTap: () {
                  BlocProvider.of<LanguageBloc>(context)
                      .add(ChangeLanguageEvent(lang));
                  context.router.pop();
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
