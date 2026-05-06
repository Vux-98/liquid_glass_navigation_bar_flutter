import 'dart:ui';

import 'package:flutter/material.dart';

// ---------------------------------------------------------------------------
// Theme
// ---------------------------------------------------------------------------

/// Defines the visual appearance of [LiquidGlassNavWidget].
///
/// Use [LiquidGlassNavTheme.light] or [LiquidGlassNavTheme.dark] for
/// predefined iOS-style glass presets, or [LiquidGlassNavTheme.custom] for
/// full control.
class LiquidGlassNavTheme {
  final Color barBackground;
  final Color barBorder;
  final double barBorderWidth;
  final Color indicatorBackground;
  final Color indicatorBorder;
  final double indicatorBorderWidth;
  final List<BoxShadow> indicatorShadow;
  final Color selectedLabelColor;
  final Color unselectedLabelColor;

  /// Tint applied to unselected item icons.
  final Color iconColor;

  /// Tint applied to the selected item icon.
  final Color selectedIconColor;
  final double blurSigma;
  final double barHeight;
  final double barBorderRadius;
  final double indicatorBorderRadius;

  /// Horizontal inset from each item slot edge to the indicator.
  /// indicatorWidth = itemWidth - 2 * indicatorHorizontalPadding
  final double indicatorHorizontalPadding;

  /// Vertical inset from the bar top/bottom to the indicator.
  /// indicatorHeight = barHeight - 2 * indicatorVerticalPadding
  final double indicatorVerticalPadding;

  /// Optional font family for labels. Defaults to the system font when null.
  final String? fontFamily;

  const LiquidGlassNavTheme({
    required this.barBackground,
    required this.barBorder,
    this.barBorderWidth = 1.5,
    required this.indicatorBackground,
    required this.indicatorBorder,
    this.indicatorBorderWidth = 1.0,
    required this.indicatorShadow,
    required this.selectedLabelColor,
    required this.unselectedLabelColor,
    required this.iconColor,
    required this.selectedIconColor,
    required this.blurSigma,
    this.barHeight = 72,
    required this.barBorderRadius,
    required this.indicatorBorderRadius,
    this.indicatorHorizontalPadding = 6,
    this.indicatorVerticalPadding = 7,
    this.fontFamily,
  });

  /// Light glass preset — inspired by iOS 26 glassmorphism design.
  static LiquidGlassNavTheme light({
    Color accentColor = const Color(0xFFB32B2F),
    String? fontFamily,
  }) {
    return LiquidGlassNavTheme(
      barBackground: const Color(0xFFFFFFFF).withValues(alpha: 0.68),
      barBorder: const Color(0xFFFFFFFF).withValues(alpha: 0.85),
      barBorderWidth: 1.5,
      indicatorBackground: const Color(0xFFFFFFFF).withValues(alpha: 0.96),
      indicatorBorder: const Color(0xFFFFFFFF),
      indicatorBorderWidth: 1.0,
      indicatorShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.10),
          blurRadius: 12,
          offset: const Offset(0, 3),
        ),
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.04),
          blurRadius: 4,
          offset: const Offset(0, 1),
        ),
      ],
      selectedLabelColor: accentColor,
      unselectedLabelColor: const Color(0xFF1C1C1E).withValues(alpha: 0.55),
      iconColor: const Color(0xFF1C1C1E).withValues(alpha: 0.50),
      selectedIconColor: accentColor,
      blurSigma: 18,
      barHeight: 72,
      barBorderRadius: 32,
      indicatorBorderRadius: 24,
      indicatorHorizontalPadding: 6,
      indicatorVerticalPadding: 7,
      fontFamily: fontFamily,
    );
  }

  /// Dark glass preset — inspired by iOS 26 glassmorphism design.
  static LiquidGlassNavTheme dark({
    Color accentColor = Colors.white,
    String? fontFamily,
  }) {
    return LiquidGlassNavTheme(
      barBackground: const Color(0xFF1A1A1A).withValues(alpha: 0.80),
      barBorder: Colors.white.withValues(alpha: 0.14),
      barBorderWidth: 1.5,
      indicatorBackground: Colors.white.withValues(alpha: 0.16),
      indicatorBorder: Colors.white.withValues(alpha: 0.22),
      indicatorBorderWidth: 1.0,
      indicatorShadow: [
        BoxShadow(
          color: Colors.white.withValues(alpha: 0.06),
          blurRadius: 16,
          spreadRadius: 1,
        ),
      ],
      selectedLabelColor: Colors.white,
      unselectedLabelColor: Colors.white.withValues(alpha: 0.50),
      iconColor: Colors.white.withValues(alpha: 0.50),
      selectedIconColor: Colors.white,
      blurSigma: 24,
      barHeight: 72,
      barBorderRadius: 32,
      indicatorBorderRadius: 20,
      indicatorHorizontalPadding: 6,
      indicatorVerticalPadding: 7,
      fontFamily: fontFamily,
    );
  }

  /// Fully custom theme for brand-specific styling.
  factory LiquidGlassNavTheme.custom({
    required Color barBackground,
    required Color barBorder,
    double barBorderWidth = 1.5,
    required Color indicatorBackground,
    Color indicatorBorder = Colors.transparent,
    double indicatorBorderWidth = 1.0,
    List<BoxShadow> indicatorShadow = const [],
    required Color selectedLabelColor,
    required Color unselectedLabelColor,
    required Color iconColor,
    required Color selectedIconColor,
    double blurSigma = 20,
    double barHeight = 72,
    double barBorderRadius = 32,
    double indicatorBorderRadius = 22,
    double indicatorHorizontalPadding = 6,
    double indicatorVerticalPadding = 7,
    String? fontFamily,
  }) {
    return LiquidGlassNavTheme(
      barBackground: barBackground,
      barBorder: barBorder,
      barBorderWidth: barBorderWidth,
      indicatorBackground: indicatorBackground,
      indicatorBorder: indicatorBorder,
      indicatorBorderWidth: indicatorBorderWidth,
      indicatorShadow: indicatorShadow,
      selectedLabelColor: selectedLabelColor,
      unselectedLabelColor: unselectedLabelColor,
      iconColor: iconColor,
      selectedIconColor: selectedIconColor,
      blurSigma: blurSigma,
      barHeight: barHeight,
      barBorderRadius: barBorderRadius,
      indicatorBorderRadius: indicatorBorderRadius,
      indicatorHorizontalPadding: indicatorHorizontalPadding,
      indicatorVerticalPadding: indicatorVerticalPadding,
      fontFamily: fontFamily,
    );
  }
}

// ---------------------------------------------------------------------------
// Data models
// ---------------------------------------------------------------------------

/// A single navigation destination for [LiquidGlassNavWidget].
class LiquidGlassNavItem {
  final String label;
  final Widget icon;

  /// Icon shown when this item is selected. Falls back to [icon] when null.
  final Widget? selectedIcon;

  /// Badge count displayed on the item. Hidden when zero.
  final int badgeCount;

  const LiquidGlassNavItem({
    required this.label,
    required this.icon,
    this.selectedIcon,
    this.badgeCount = 0,
  });
}

/// An optional floating action chip shown above the navigation bar.
class LiquidGlassNavAction {
  final String label;
  final Widget icon;
  final VoidCallback onTap;

  const LiquidGlassNavAction({
    required this.label,
    required this.icon,
    required this.onTap,
  });
}

// ---------------------------------------------------------------------------
// Widget
// ---------------------------------------------------------------------------

/// A glassmorphism-style bottom navigation bar inspired by iOS 26 design.
///
/// Supports 2–5 navigation items, an optional floating action chip, badge
/// counts, animated sliding indicator, and fully customisable theming.
///
/// ```dart
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
class LiquidGlassNavWidget extends StatefulWidget {
  final List<LiquidGlassNavItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  /// Optional floating action chip displayed above the bar.
  final LiquidGlassNavAction? floatingAction;

  /// Visual theme. Defaults to [LiquidGlassNavTheme.light] when null.
  final LiquidGlassNavTheme? theme;

  /// Force tablet-style centered layout. Also auto-detected via screen width.
  final bool isTablet;

  const LiquidGlassNavWidget({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.floatingAction,
    this.theme,
    this.isTablet = false,
  }) : assert(
          items.length >= 2 && items.length <= 5,
          'LiquidGlassNavWidget requires between 2 and 5 items.',
        );

  @override
  State<LiquidGlassNavWidget> createState() => _LiquidGlassNavWidgetState();
}

class _LiquidGlassNavWidgetState extends State<LiquidGlassNavWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _slideController;
  late Animation<double> _slideAnimation;
  int _previousIndex = 0;

  LiquidGlassNavTheme get _theme => widget.theme ?? LiquidGlassNavTheme.light();

  @override
  void initState() {
    super.initState();
    _previousIndex = widget.currentIndex;
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 320),
    );
    _slideAnimation = CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void didUpdateWidget(LiquidGlassNavWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex) {
      _previousIndex = oldWidget.currentIndex;
      _slideController.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.of(context).padding.bottom;
    final bool useTabletLayout =
        widget.isTablet || MediaQuery.of(context).size.shortestSide > 600;

    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.fromLTRB(
        useTabletLayout ? 0 : 16,
        0,
        useTabletLayout ? 0 : 16,
        bottomPadding > 0 ? bottomPadding + 4 : 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.floatingAction != null) ...[
            useTabletLayout
                ? Center(child: _buildFloatingAction())
                : _buildFloatingAction(),
            const SizedBox(height: 8),
          ],
          useTabletLayout
              ? Center(
                  child: SizedBox(width: 500, child: _buildGlassBar()),
                )
              : _buildGlassBar(),
        ],
      ),
    );
  }

  Widget _buildFloatingAction() {
    final action = widget.floatingAction!;
    final theme = _theme;
    return GestureDetector(
      onTap: action.onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: theme.blurSigma * 0.7,
            sigmaY: theme.blurSigma * 0.7,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            decoration: BoxDecoration(
              color: theme.barBackground,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: theme.barBorder, width: 1),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 20, height: 20, child: action.icon),
                const SizedBox(width: 8),
                Text(
                  action.label,
                  style: TextStyle(
                    fontFamily: theme.fontFamily,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: theme.selectedLabelColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGlassBar() {
    final theme = _theme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(theme.barBorderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: theme.blurSigma,
          sigmaY: theme.blurSigma,
        ),
        child: Container(
          height: theme.barHeight,
          decoration: BoxDecoration(
            color: theme.barBackground,
            borderRadius: BorderRadius.circular(theme.barBorderRadius),
            border: Border.all(
              color: theme.barBorder,
              width: theme.barBorderWidth,
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double itemWidth =
                  constraints.maxWidth / widget.items.length;
              final double indicatorWidth =
                  itemWidth - 2 * theme.indicatorHorizontalPadding;
              final double indicatorHeight =
                  theme.barHeight - 2 * theme.indicatorVerticalPadding;

              return Stack(
                children: [
                  // Sliding selection indicator
                  AnimatedBuilder(
                    animation: _slideAnimation,
                    builder: (context, child) {
                      final double fromLeft =
                          _previousIndex * itemWidth +
                          theme.indicatorHorizontalPadding;
                      final double toLeft =
                          widget.currentIndex * itemWidth +
                          theme.indicatorHorizontalPadding;
                      final double currentLeft = lerpDouble(
                        fromLeft,
                        toLeft,
                        _slideAnimation.value,
                      )!;

                      return Positioned(
                        top: theme.indicatorVerticalPadding,
                        left: currentLeft,
                        child: child!,
                      );
                    },
                    child: Container(
                      width: indicatorWidth,
                      height: indicatorHeight,
                      decoration: BoxDecoration(
                        color: theme.indicatorBackground,
                        borderRadius:
                            BorderRadius.circular(theme.indicatorBorderRadius),
                        border: Border.all(
                          color: theme.indicatorBorder,
                          width: theme.indicatorBorderWidth,
                        ),
                        boxShadow: theme.indicatorShadow,
                      ),
                    ),
                  ),

                  // Navigation items
                  Row(
                    children: List.generate(
                      widget.items.length,
                      (index) => _buildNavItem(
                        item: widget.items[index],
                        index: index,
                        itemWidth: itemWidth,
                        theme: theme,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required LiquidGlassNavItem item,
    required int index,
    required double itemWidth,
    required LiquidGlassNavTheme theme,
  }) {
    final bool isSelected = index == widget.currentIndex;
    final double fontSize = widget.items.length <= 4 ? 11.0 : 9.5;

    return GestureDetector(
      onTap: () => widget.onTap(index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: itemWidth,
        height: theme.barHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: KeyedSubtree(
                      key: ValueKey(isSelected),
                      child: isSelected
                          ? (item.selectedIcon ?? item.icon)
                          : item.icon,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 200),
                  style: TextStyle(
                    fontFamily: theme.fontFamily,
                    fontSize: fontSize,
                    fontWeight:
                        isSelected ? FontWeight.w600 : FontWeight.w500,
                    color: isSelected
                        ? theme.selectedLabelColor
                        : theme.unselectedLabelColor,
                  ),
                  child: Text(
                    item.label,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),

            if (item.badgeCount > 0)
              Positioned(
                top: 8,
                right: (itemWidth / 2) - 18,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEE3439),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                  constraints:
                      const BoxConstraints(minWidth: 16, minHeight: 16),
                  child: Text(
                    item.badgeCount > 99 ? '99+' : item.badgeCount.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      fontFamily: theme.fontFamily,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
