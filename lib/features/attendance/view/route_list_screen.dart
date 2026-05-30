import 'package:flutter/material.dart';
import 'package:mediezy/core/constants/app_assets.dart';
import 'package:mediezy/core/responsive/responsive.dart';
import 'package:mediezy/core/style/app_text_styles.dart';
import 'package:mediezy/core/widgets/app_scaffold.dart';


import '../model/route_model.dart';
import '../widgets/route_list.dart';
import '../widgets/route_search_bar.dart';

class MyRouteListScreen extends StatefulWidget {
  const MyRouteListScreen({super.key});

  @override
  State<MyRouteListScreen> createState() => _MyRouteScreenListState();
}

class _MyRouteScreenListState extends State<MyRouteListScreen> {
  final searchController = TextEditingController();

  final List<RouteModel> routes = [
    RouteModel(date: "23 Aug 2026", markIn: "9:30", markOut: "6:30"),
    RouteModel(date: "22 Aug 2026", markIn: "9:30", markOut: "6:30"),
    RouteModel(date: "21 Aug 2026", markIn: "9:30", markOut: "6:30"),
    RouteModel(date: "20 Aug 2026", markIn: "9:30", markOut: "6:30"),
    RouteModel(date: "19 Aug 2026", markIn: "9:30", markOut: "6:30"),
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        actions: [
          CircleAvatar(child: Image.asset(AppAssets.profileImage)),
          SizedBox(width: context.res.wmd),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text("My Route", style: AppTextStyles.headlineMedium),
            SizedBox(height: context.res.hsm),
            RouteSearchBar(controller: searchController),

            const SizedBox(height: 16),

            Expanded(
              child: SingleChildScrollView(child: RouteList(routes: routes)),
            ),
          ],
        ),
      ),
    );
  }
}
