import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/theme/app_colors.dart';
import 'package:flutter_thai_hotline_app/views/about_ui.dart';
import 'package:flutter_thai_hotline_app/views/bank_ui.dart';
import 'package:flutter_thai_hotline_app/views/emg_ui.dart';
import 'package:flutter_thai_hotline_app/views/pub_ui.dart';
import 'package:flutter_thai_hotline_app/views/travel_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [TravelUI(), EmgUI(), BankUI(), PubUI()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'สายด่วน THAILAND',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            tooltip: 'เกี่ยวกับแอป',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(builder: (context) => const AboutUI()),
              );
            },
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: switch (_selectedIndex) {
          1 => emergencyRed,
          2 => hotlineBankGreen,
          3 => hotlineUtilityYellow,
          _ => hotlineNavy,
        },
        unselectedItemColor: hotlineMuted,
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(
          fontSize: 8,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(fontSize: 8),
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus_outlined),
            activeIcon: Icon(Icons.directions_bus),
            label: 'การเดินทาง',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety_outlined),
            activeIcon: Icon(Icons.health_and_safety),
            label: 'อุบัติเหตุ-เหตุฉุกเฉิน',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_outlined),
            activeIcon: Icon(Icons.account_balance),
            label: 'ธนาคาร',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.electrical_services_outlined),
            activeIcon: Icon(Icons.electrical_services),
            label: 'สาธารณูปโภค',
          ),
        ],
      ),
    );
  }
}
