import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_thai_hotline_app/models/hotline_service.dart';
import 'package:flutter_thai_hotline_app/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class HotlineCategoryUI extends StatelessWidget {
  const HotlineCategoryUI({
    required this.title,
    required this.heroImage,
    required this.services,
    this.accentColor = hotlineNavy,
    super.key,
  });

  final String title;
  final String heroImage;
  final List<HotlineService> services;
  final Color accentColor;

  Future<void> _callService(
    BuildContext context,
    HotlineService service,
  ) async {
    try {
      final launched = await launchUrl(
        Uri(scheme: 'tel', path: service.dialNumber),
        mode: LaunchMode.externalApplication,
      );
      if (!launched && context.mounted) {
        _showCallMessage(context);
      }
    } catch (_) {
      if (context.mounted) _showCallMessage(context);
    }
  }

  void _showCallMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('อุปกรณ์นี้ไม่สามารถเปิดแอปโทรศัพท์ได้')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 18),
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: hotlineInk,
            fontSize: 19,
            fontWeight: FontWeight.w700,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 14),
        Center(
          child: Container(
            width: 140,
            height: 112,
            decoration: BoxDecoration(
              color: hotlineBackground,
              border: Border.all(color: hotlineBorder),
            ),
            child: Image.asset(
              heroImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 14),
        for (final service in services) _serviceCard(context, service),
      ],
    );
  }

  Widget _serviceCard(BuildContext context, HotlineService service) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      color: Colors.white,
      elevation: 1,
      shadowColor: const Color(0x14000000),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: hotlineBorder),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        leading: Container(
          width: 48,
          height: 48,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: hotlineInk, width: 1.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.asset(service.logoPath, fit: BoxFit.contain),
        ),
        title: Text(
          service.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          service.phone,
          style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
        ),
        trailing: Tooltip(
          message: 'โทร ${service.name} ${service.phone}',
          child: ElevatedButton(
          onPressed: () => _callService(context, service),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(40, 40),
            fixedSize: const Size(40, 40),
            padding: EdgeInsets.zero,
            elevation: 1,
            shape: const CircleBorder(),
            backgroundColor: accentColor,
            foregroundColor: Colors.white,
          ),
          child: const FaIcon(FontAwesomeIcons.phone, size: 16),
          ),
        ),
      ),
    );
  }
}
