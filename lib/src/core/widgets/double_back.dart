import 'package:ct_clean/src/core/config/routes/app_imports.dart';
import 'package:ct_clean/src/core/utils/pop_up.dart';

class DoubleBackToCloseWidget extends StatelessWidget {
  DoubleBackToCloseWidget({super.key, required this.child});

  final Widget child;
  int? _lastTimeBackButtonWasTapped;
  static const exitTimeInMillis = 2000;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) => _handleWillPop(),
      child: child,
    );
  }

  Future<bool> _handleWillPop() async {
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    if (_lastTimeBackButtonWasTapped != null &&
        (currentTime - (_lastTimeBackButtonWasTapped ?? 0)) <
            exitTimeInMillis) {
      return true;
    } else {
      _lastTimeBackButtonWasTapped = DateTime.now().millisecondsSinceEpoch;
      flutterToast(msg: 'Press BACK again to exit!');
      return false;
    }
  }
}
