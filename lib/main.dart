import 'package:blocs_app/presentation/blocs/01-simple-cubit/username_cubit.dart';
import 'package:blocs_app/presentation/blocs/02-counter/counter-cubit.dart';
import 'package:blocs_app/presentation/blocs/03-theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:blocs_app/config/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const BlocsProvider());

class BlocsProvider extends StatelessWidget {
  const BlocsProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UsernameCubit(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => RouterSimpleCubit(),
        ),
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>().state;
    final appRouterCubit = context.watch<RouterSimpleCubit>();
    return MaterialApp.router(
      title: 'Flutter BLoC',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouterCubit.state,
      theme:
          AppTheme(isDarkmode: themeCubit.isDarkMode ? true : false).getTheme(),
    );
  }
}
