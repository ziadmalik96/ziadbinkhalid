import 'package:flutter/cupertino.dart';

class ScrollProvider extends ChangeNotifier {
  final scrollController = ScrollController();
  final List<GlobalKey> sectionKeys =
      List.generate(6, (_) => GlobalKey());

  ScrollController get controller => scrollController;

  Future<void> scroll(int index) async {
    if (index < 0 || index >= sectionKeys.length) return;

    final context = sectionKeys[index].currentContext;
    if (context == null) return;

    await Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
      alignment: index == 0 ? 0 : 0.02,
    );
  }

  Future<void> scrollMobile(int index) async {
    await scroll(index);
  }
}
