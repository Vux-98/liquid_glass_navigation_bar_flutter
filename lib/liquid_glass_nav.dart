/// A glassmorphism-style bottom navigation bar for Flutter,
/// inspired by iOS 26 liquid glass design.
///
/// ## Usage
///
/// ```dart
/// import 'package:liquid_glass_nav/liquid_glass_nav.dart';
///
/// LiquidGlassNavWidget(
///   items: const [
///     LiquidGlassNavItem(label: 'Home',    icon: Icon(Icons.home_outlined)),
///     LiquidGlassNavItem(label: 'Search',  icon: Icon(Icons.search)),
///     LiquidGlassNavItem(label: 'Profile', icon: Icon(Icons.person_outline)),
///   ],
///   currentIndex: _index,
///   onTap: (i) => setState(() => _index = i),
/// )
/// ```
library;

export 'liquid_glass_nav_widget.dart'
    show
        LiquidGlassNavWidget,
        LiquidGlassNavTheme,
        LiquidGlassNavItem,
        LiquidGlassNavAction;
