import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/data/hotline_data.dart';
import 'package:flutter_thai_hotline_app/theme/app_colors.dart';
import 'package:flutter_thai_hotline_app/views/shared/hotline_category_ui.dart';

class EmgUI extends StatelessWidget {
  const EmgUI({super.key});

  @override
  Widget build(BuildContext context) => const HotlineCategoryUI(
    title: 'สายด่วน\nอุบัติเหตุ-เหตุฉุกเฉิน',
    heroImage: 'assets/images/emergency/emg_0.png',
    services: emergencyHotlines,
    accentColor: emergencyRed,
  );
}
