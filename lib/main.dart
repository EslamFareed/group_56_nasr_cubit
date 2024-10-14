import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:group_56_nasr_cubit/cubits/home/home_cubit.dart';
import 'package:group_56_nasr_cubit/cubits/theme/theme_cubit.dart';
import 'package:group_56_nasr_cubit/screens/login_screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('en'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => HomeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            home: LoginScreen(),
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: ThemeCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
          );
        },
      ),
    );
  }
}
