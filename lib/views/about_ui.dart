import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/theme/app_colors.dart';

class AboutUI extends StatelessWidget {
  const AboutUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('สายด่วน THAILAND')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 18, 24, 28),
        children: [
          const Text(
            'ผู้จัดทำ',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/aboutme/me.png',
                width: 170,
                height: 170,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Image.asset(
            'assets/images/aboutme/saulogo.png',
            height: 54,
            fit: BoxFit.contain,
          ),
          const Text(
            'มหาวิทยาลัยเอเชียอาคเนย์',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 22),
          const _StudentInfoRow(label: 'รหัสนักศึกษา', value: '6819H10024'),
          const _StudentInfoRow(
            label: 'ชื่อ-สกุลนักศึกษา',
            value: 'ชุติกาญจน์ พรหมปัญญา',
          ),
          const _StudentInfoRow(
            label: 'อีเมลนักศึกษา',
            value: 's6819h10024@sau.ac.th',
          ),
          const _StudentInfoRow(
            label: 'ชื่อสาขาวิชา',
            value: 'วิศวกรรมคอมพิวเตอร์',
          ),
          const _StudentInfoRow(
            label: 'ชื่อคณะ',
            value: 'คณะวิศวกรรมศาสตร์',
          ),
        ],
      ),
    );
  }
}

class _StudentInfoRow extends StatelessWidget {
  const _StudentInfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.person_outline, color: hotlineNavy, size: 19),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
