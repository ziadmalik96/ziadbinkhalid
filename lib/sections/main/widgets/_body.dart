part of '../main_section.dart';

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);

    return SingleChildScrollView(
      controller: scrollProvider.controller,
      child: Column(
        children: BodyUtils.views
            .asMap()
            .entries
            .map(
              (entry) => KeyedSubtree(
                key: scrollProvider.sectionKeys[entry.key],
                child: entry.value,
              ),
            )
            .toList(),
      ),
    );
  }
}
