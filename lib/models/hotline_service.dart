class HotlineService {
  const HotlineService({
    required this.name,
    required this.phone,
    required this.logoPath,
  });

  final String name;
  final String phone;
  final String logoPath;

  String get dialNumber => phone.replaceAll(RegExp(r'[^0-9+]'), '');
}
