import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mister_app/cubit/auth/register_cubit.dart';
import 'package:mister_app/services/auth_service.dart';
import 'package:mister_app/utils/app_routes.dart';
import 'utils/app_theme.dart';

void main() {
  runApp(ScreenUtilInit(
    designSize: const Size(375, 812), // مقاس تصميمك الأساسي (iPhone X مثلاً)
    builder: (context, child) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => RegisterCubit(RegisterService()),
            // BlocProvider(create: (_) => LoginCubit(LoginService())),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Mr. App',
          theme: AppTheme.lightTheme,
          onGenerateRoute: AppRoutes.generateRoute,
          initialRoute: AppRoutes.login,
        ));
  }
}
