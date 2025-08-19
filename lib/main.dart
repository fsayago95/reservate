import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservate/presentation/authentication/cubit/authentication/authentication_cubit.dart';
import 'package:reservate/presentation/authentication/sign_in_page.dart';
import 'package:reservate/presentation/authentication/sign_up_page.dart';
import 'package:reservate/presentation/booking/booking_page.dart';
import 'package:reservate/presentation/booking/cubit/booking_cubit.dart';
import 'package:reservate/presentation/home/cubit/home_cubit.dart';
import 'package:reservate/presentation/home/home_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationCubit>(
          create: (context) => AuthenticationCubit(),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => BookingCubit(),
        ),
      ],
      child: MaterialApp(home: const LoginPage(), routes: {
        '/sign_up': (context) => const RegisterPage(),
        '/sign_in': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/booking': (context) => const BookingPage(),
      }),
    );
  }
}
