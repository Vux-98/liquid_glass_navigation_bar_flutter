import 'package:flutter/material.dart';
import 'package:liquid_glass_nav/liquid_glass_nav.dart';

void main() => runApp(const ExampleApp());

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LiquidGlassNav Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo),
      home: const DemoPage(),
    );
  }
}

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  int _index = 0;
  bool _darkMode = false;

  static const _pages = [
    _PlaceholderPage(label: 'Home', icon: Icons.home),
    _PlaceholderPage(label: 'Search', icon: Icons.search),
    _PlaceholderPage(label: 'Notifications', icon: Icons.notifications),
    _PlaceholderPage(label: 'Profile', icon: Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = _darkMode
        ? LiquidGlassNavTheme.dark()
        : LiquidGlassNavTheme.light(accentColor: Colors.indigo);

    return Scaffold(
      extendBody: true,
      backgroundColor: _darkMode ? const Color(0xFF121212) : const Color(0xFFF2F2F7),
      appBar: AppBar(
        title: const Text('LiquidGlassNav Demo'),
        actions: [
          IconButton(
            icon: Icon(_darkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => setState(() => _darkMode = !_darkMode),
            tooltip: 'Toggle theme',
          ),
        ],
      ),
      body: _pages[_index],
      bottomNavigationBar: LiquidGlassNavWidget(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        theme: theme,
        floatingAction: LiquidGlassNavAction(
          label: 'New post',
          icon: Icon(
            Icons.add,
            size: 18,
            color: theme.selectedLabelColor,
          ),
          onTap: () => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Floating action tapped')),
          ),
        ),
        items: const [
          LiquidGlassNavItem(
            label: 'Home',
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
          ),
          LiquidGlassNavItem(
            label: 'Search',
            icon: Icon(Icons.search_outlined),
            badgeCount: 3,
          ),
          LiquidGlassNavItem(
            label: 'Alerts',
            icon: Icon(Icons.notifications_outlined),
            selectedIcon: Icon(Icons.notifications),
            badgeCount: 12,
          ),
          LiquidGlassNavItem(
            label: 'Profile',
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}

class _PlaceholderPage extends StatelessWidget {
  final String label;
  final IconData icon;

  const _PlaceholderPage({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 64, color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: 16),
          Text(label, style: Theme.of(context).textTheme.headlineSmall),
        ],
      ),
    );
  }
}
