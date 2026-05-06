import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:liquid_glass_nav/liquid_glass_nav.dart';

Widget _buildTestWidget({
  int currentIndex = 0,
  ValueChanged<int>? onTap,
  LiquidGlassNavTheme? theme,
}) {
  return MaterialApp(
    home: Scaffold(
      bottomNavigationBar: LiquidGlassNavWidget(
        currentIndex: currentIndex,
        onTap: onTap ?? (_) {},
        theme: theme,
        items: const [
          LiquidGlassNavItem(label: 'Home', icon: Icon(Icons.home)),
          LiquidGlassNavItem(label: 'Search', icon: Icon(Icons.search)),
          LiquidGlassNavItem(label: 'Profile', icon: Icon(Icons.person)),
        ],
      ),
    ),
  );
}

void main() {
  group('LiquidGlassNavWidget', () {
    testWidgets('renders all item labels', (tester) async {
      await tester.pumpWidget(_buildTestWidget());
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
    });

    testWidgets('calls onTap with correct index', (tester) async {
      int tappedIndex = -1;
      await tester.pumpWidget(
        _buildTestWidget(onTap: (i) => tappedIndex = i),
      );
      await tester.tap(find.text('Search'));
      expect(tappedIndex, 1);
    });

    testWidgets('shows badge when badgeCount > 0', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: LiquidGlassNavWidget(
              currentIndex: 0,
              onTap: (_) {},
              items: const [
                LiquidGlassNavItem(label: 'Home', icon: Icon(Icons.home)),
                LiquidGlassNavItem(
                  label: 'Inbox',
                  icon: Icon(Icons.inbox),
                  badgeCount: 5,
                ),
              ],
            ),
          ),
        ),
      );
      expect(find.text('5'), findsOneWidget);
    });

    testWidgets('shows 99+ when badgeCount exceeds 99', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: LiquidGlassNavWidget(
              currentIndex: 0,
              onTap: (_) {},
              items: const [
                LiquidGlassNavItem(label: 'Home', icon: Icon(Icons.home)),
                LiquidGlassNavItem(
                  label: 'Inbox',
                  icon: Icon(Icons.inbox),
                  badgeCount: 120,
                ),
              ],
            ),
          ),
        ),
      );
      expect(find.text('99+'), findsOneWidget);
    });

    testWidgets('applies light theme without error', (tester) async {
      await tester.pumpWidget(
        _buildTestWidget(theme: LiquidGlassNavTheme.light()),
      );
      expect(find.byType(LiquidGlassNavWidget), findsOneWidget);
    });

    testWidgets('applies dark theme without error', (tester) async {
      await tester.pumpWidget(
        _buildTestWidget(theme: LiquidGlassNavTheme.dark()),
      );
      expect(find.byType(LiquidGlassNavWidget), findsOneWidget);
    });

    testWidgets('renders floating action when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: LiquidGlassNavWidget(
              currentIndex: 0,
              onTap: (_) {},
              floatingAction: LiquidGlassNavAction(
                label: 'New',
                icon: const Icon(Icons.add),
                onTap: () {},
              ),
              items: const [
                LiquidGlassNavItem(label: 'Home', icon: Icon(Icons.home)),
                LiquidGlassNavItem(label: 'Feed', icon: Icon(Icons.rss_feed)),
              ],
            ),
          ),
        ),
      );
      expect(find.text('New'), findsOneWidget);
    });

    test('assert fires when item count < 2', () {
      expect(
        () => LiquidGlassNavWidget(
          currentIndex: 0,
          onTap: (_) {},
          items: const [
            LiquidGlassNavItem(label: 'Home', icon: Icon(Icons.home)),
          ],
        ),
        throwsAssertionError,
      );
    });

    test('assert fires when item count > 5', () {
      expect(
        () => LiquidGlassNavWidget(
          currentIndex: 0,
          onTap: (_) {},
          items: const [
            LiquidGlassNavItem(label: 'A', icon: Icon(Icons.home)),
            LiquidGlassNavItem(label: 'B', icon: Icon(Icons.search)),
            LiquidGlassNavItem(label: 'C', icon: Icon(Icons.person)),
            LiquidGlassNavItem(label: 'D', icon: Icon(Icons.settings)),
            LiquidGlassNavItem(label: 'E', icon: Icon(Icons.star)),
            LiquidGlassNavItem(label: 'F', icon: Icon(Icons.favorite)),
          ],
        ),
        throwsAssertionError,
      );
    });
  });
}
