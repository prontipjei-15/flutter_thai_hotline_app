import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/data/hotline_data.dart';
import 'package:flutter_thai_hotline_app/theme/app_colors.dart';
import 'package:flutter_thai_hotline_app/views/shared/hotline_category_ui.dart';

class BankUI extends StatelessWidget {
  const BankUI({super.key});

  @override
  Widget build(BuildContext context) => const HotlineCategoryUI(
    title: 'สายด่วน\nธนาคาร',
    heroImage: 'assets/images/bank/bank_0.png',
    services: bankHotlines,
    accentColor: hotlineBankGreen,
  );
}
