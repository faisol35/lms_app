import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithNavBar({required this.navigationShell, Key? key})
    : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: BottomNavigationBar(
            currentIndex: navigationShell.currentIndex,
            onTap: (int index) {
              navigationShell.goBranch(
                index,
                initialLocation: index == navigationShell.currentIndex,
              );
            },
            backgroundColor: Theme.of(context).primaryColor,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withValues(alpha: 0.6),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(PhosphorIcons.house()),
                activeIcon: Icon(PhosphorIcons.house(PhosphorIconsStyle.fill)),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(PhosphorIcons.student()),
                activeIcon: Icon(
                  PhosphorIcons.student(PhosphorIconsStyle.fill),
                ),
                label: 'Kelas Saya',
              ),
              BottomNavigationBarItem(
                icon: Icon(PhosphorIcons.bell()),
                activeIcon: Icon(PhosphorIcons.bell(PhosphorIconsStyle.fill)),
                label: 'Notifikasi',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
