import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/data/hotline_data.dart';
import 'package:flutter_thai_hotline_app/theme/app_colors.dart';
import 'package:flutter_thai_hotline_app/views/shared/hotline_category_ui.dart';

class PubUI extends StatelessWidget {
  const PubUI({super.key});

  @override
  Widget build(BuildContext context) => const HotlineCategoryUI(
    title: 'สายด่วน\nสาธารณูปโภค',
    heroImage: 'assets/images/pubutil/pub_0.png',
    services: utilityHotlines,
    accentColor: hotlineUtilityYellow,
  );
}
