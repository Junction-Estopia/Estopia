import 'package:estopia/core/lang/generated/l10n.dart';
import 'package:estopia/src/data/repositories/lecture_repository.dart';
import 'package:estopia/src/presentations/home/home_view.dart';
import 'package:estopia/src/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => LectureRepository()),
      ],
      child: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => ThemeService())],
        child: const App(),
      ),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: context.themeData,
      home: HomeView(),
    );
  }
}
