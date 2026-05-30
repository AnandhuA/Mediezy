import 'package:flutter/material.dart';

import '../model/route_model.dart';
import 'route_card.dart';

class RouteList extends StatelessWidget {
  final List<RouteModel> routes;

  const RouteList({
    super.key,
    required this.routes,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: routes.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (_, _) =>
          const SizedBox(height: 10),
      itemBuilder: (_, index) {
        return RouteCard(
          route: routes[index],
        );
      },
    );
  }
}