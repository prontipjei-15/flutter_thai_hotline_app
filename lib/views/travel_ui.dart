import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/data/hotline_data.dart';
import 'package:flutter_thai_hotline_app/views/shared/hotline_category_ui.dart';

class TravelUI extends StatelessWidget {
  const TravelUI({super.key});

  @override
  Widget build(BuildContext context) => const HotlineCategoryUI(
    title: 'สายด่วน\nการเดินทาง',
    heroImage: 'assets/images/travel/travel_0.png',
    services: travelHotlines,
  );
}
