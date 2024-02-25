import 'package:bloc_example_app/blocs/auth/login/login_bloc.dart';
import 'package:bloc_example_app/blocs/auth/register/register_bloc.dart';
import 'package:bloc_example_app/blocs/home/home_bloc.dart';
import 'package:bloc_example_app/network/repository/repository_store.dart';
import 'package:bloc_example_app/src/app_colors.dart';
import 'package:bloc_example_app/views/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
            create: (_) => LoginBloc(authRepo: RepositoryStore.authRepository)),
        BlocProvider<RegisterBloc>(
            create: (context) =>
                RegisterBloc(authRepo: RepositoryStore.authRepository)),
        BlocProvider<HomeBloc>(
            create: (context) =>
                HomeBloc(homeRepo: RepositoryStore.homeRepository)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          primarySwatch: AppColors.primarySwatch,
          // Customize ElevatedButton theme
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: AppColors.primaryColor, // Text color
            ),
          ),
          // textTheme: const TextTheme(
          //   bodyLarge: TextStyle(color: Colors.black), // Example
          //   bodyMedium: TextStyle(color: Colors.black), // Specify your desired color
          //   // Define other text styles as needed
          // ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: AppColors.primaryColor, // Text color
            ),
          )
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
