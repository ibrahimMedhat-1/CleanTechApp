import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/feature/salary_details/presentation/screens/salary_details_screen.dart';
import 'package:ct_clean/src/feature/task_details/presentation/screens/task_details_screens.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case Routes.layoutScreen:
        return MaterialPageRoute(
          builder: (context) => LayoutScreen(),
        );
      case Routes.taskDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => TaskDetailsScreen(),
        );case Routes.salaryDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => SalaryDetailsScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text("No route define for ${settings.name}"),
            ),
          ),
        );
    }
  }
}

Route animateWidget(Widget myWidget) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => myWidget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1, 0);
      const end = Offset.zero;
      const curve = Curves.easeInOutQuad;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class Routes {
  static const String loginScreen = "loginScreen";
  static const String layoutScreen = "layoutScreen";
  static const String taskDetailsScreen = "TaskDetailsScreen";
  static const String salaryDetailsScreen = "SalaryDetailsScreen";
}
