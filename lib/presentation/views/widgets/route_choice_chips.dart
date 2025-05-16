import 'package:flutter/material.dart';

class RouteChoiceChips extends StatelessWidget {
  final List<String> routes;
  final String? selectedRoute;
  final ValueChanged<String> onSelected;

  const RouteChoiceChips({
    super.key,
    required this.routes,
    required this.selectedRoute,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        spacing: 10,
        children: routes.map((route) {
          return ChoiceChip(
            label: Text(route),
            selected: selectedRoute == route,
            onSelected: (_) => onSelected(route),
          );
        }).toList(),
      ),
    );
  }
}
