# liquid_glass_nav

A glassmorphism-style bottom navigation bar for Flutter, inspired by the iOS 26 liquid glass design language.

## Features

- **Animated sliding indicator** — smooth `easeInOutCubic` transition between items (320 ms)
- **Glassmorphism effect** — `BackdropFilter` blur with customisable sigma
- **Light & dark presets** — ready-to-use iOS-style themes with accent colour support
- **Fully custom theme** — control every colour, radius, padding, and blur value
- **Badge counts** — per-item notification badges
- **Floating action chip** — optional pill-shaped action button above the bar
- **Tablet / responsive** — auto-detects wide screens; centres the bar at 500 px width
- **Custom font family** — pass any font via `LiquidGlassNavTheme.fontFamily`
- **2–5 items** — assertion guard prevents misconfiguration

## Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  liquid_glass_nav: ^0.1.0
```

Then run:

```sh
flutter pub get
```

## Basic usage

```dart
import 'package:liquid_glass_nav/liquid_glass_nav.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});
  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_index],
      bottomNavigationBar: LiquidGlassNavWidget(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
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
            label: 'Profile',
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
```

> **Tip:** Use `extendBody: true` on `Scaffold` so the page content renders behind the translucent bar.

## Theming

### Light (default)

```dart
LiquidGlassNavWidget(
  theme: LiquidGlassNavTheme.light(accentColor: Colors.indigo),
  ...
)
```

### Dark

```dart
LiquidGlassNavWidget(
  theme: LiquidGlassNavTheme.dark(accentColor: Colors.white),
  ...
)
```

### Custom

```dart
LiquidGlassNavWidget(
  theme: LiquidGlassNavTheme.custom(
    barBackground: Colors.black.withValues(alpha: 0.6),
    barBorder: Colors.white.withValues(alpha: 0.2),
    indicatorBackground: Colors.white.withValues(alpha: 0.15),
    indicatorBorder: Colors.white.withValues(alpha: 0.3),
    selectedLabelColor: Colors.cyanAccent,
    unselectedLabelColor: Colors.white54,
    iconColor: Colors.white54,
    selectedIconColor: Colors.cyanAccent,
    blurSigma: 30,
    fontFamily: 'Inter',
  ),
  ...
)
```

## Floating action chip

```dart
LiquidGlassNavWidget(
  floatingAction: LiquidGlassNavAction(
    label: 'New post',
    icon: const Icon(Icons.add, size: 18),
    onTap: () { /* ... */ },
  ),
  ...
)
```

## API reference

### `LiquidGlassNavWidget`

| Property        | Type                      | Default | Description                              |
|-----------------|---------------------------|---------|------------------------------------------|
| `items`         | `List<LiquidGlassNavItem>`| —       | 2–5 navigation destinations              |
| `currentIndex`  | `int`                     | —       | Index of the selected item               |
| `onTap`         | `ValueChanged<int>`       | —       | Called when an item is tapped            |
| `theme`         | `LiquidGlassNavTheme?`    | light   | Visual theme                             |
| `floatingAction`| `LiquidGlassNavAction?`   | null    | Optional floating chip above the bar     |
| `isTablet`      | `bool`                    | false   | Force tablet-style centred layout        |

### `LiquidGlassNavItem`

| Property       | Type      | Default | Description                           |
|----------------|-----------|---------|---------------------------------------|
| `label`        | `String`  | —       | Text label                            |
| `icon`         | `Widget`  | —       | Icon widget (unselected)              |
| `selectedIcon` | `Widget?` | null    | Icon widget (selected); falls back to `icon` |
| `badgeCount`   | `int`     | `0`     | Badge number; hidden when 0           |

## License

MIT — see [LICENSE](LICENSE).
