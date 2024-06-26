import 'package:flutter/material.dart';

import 'bar_item.dart';
import 'build_icon_button.dart';
import 'build_running_drop.dart';

typedef OnButtonPressCallback = void Function(int index);

class WaterDropNavBar extends StatefulWidget {
  /// Background Color of the bar.
  final Color backgroundColor;

  /// Callback When individual barItem is pressed.
  final OnButtonPressCallback onItemSelected;

  /// Current selected index of the bar item.
  final int selectedIndex;

  /// List of bar items that shows horizontally, Minimum 2 and maximum 4 items.
  final List<BarItem> barItems;

  /// Color of water drop which is also the active icon color.
  final Color waterDropColor;

  /// Inactive icon color by default it will use water drop color.
  final Color inactiveIconColor;

  /// Each active & inactive icon size, default value is 30 don't make it too big or small.
  final double iconSize;

  /// Bottom padding of the bar. If nothing is provided the it will use
  /// [MediaQuery.of(context).padding.bottom] value.
  final double? bottomPadding;
  final double? topPadding;
  final double padding;
  const WaterDropNavBar({
    required this.barItems,
    required this.selectedIndex,
    required this.onItemSelected,
    this.bottomPadding,
    this.backgroundColor = Colors.white,
    this.waterDropColor = const Color(0xFF5B75F0),
    this.iconSize = 28,
    this.topPadding,
    Color? inactiveIconColor,
    Key? key,
    required this.padding,
  })  : inactiveIconColor = inactiveIconColor ?? waterDropColor,
        assert(barItems.length > 1, 'You must provide minimum 2 bar items'),
        assert(barItems.length < 5, 'Maximum bar items count is 4'),
        super(key: key);

  @override
  WaterDropNavBarState createState() => WaterDropNavBarState();
}

class WaterDropNavBarState extends State<WaterDropNavBar>
    with TickerProviderStateMixin {
  int _previousIndex = 0;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      //milliseconds: 800
      duration: const Duration(milliseconds: 800),
    )..forward(from: 0.0);
  }

  void _onTap(int index) {
    final int selectedIndex = widget.selectedIndex;

    if (selectedIndex == index || _controller.isAnimating) {
      return;
    } else {
      widget.onItemSelected(index);
      _controller.forward(from: 0.0);
      _previousIndex = widget.selectedIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    final int selectedIndex = widget.selectedIndex;
    final Color backgroundColor = widget.backgroundColor;
    final Color dropColor = widget.waterDropColor;
    final List<BarItem> items = widget.barItems;
    final double iconSize = widget.iconSize;
    final Color inactiveIconColor = widget.inactiveIconColor;
    final double bottomPadding =
        widget.bottomPadding ?? MediaQuery.of(context).padding.bottom;
    final double barHeight = 60 + bottomPadding;
    return Container(
      height: barHeight,
      color: backgroundColor,
      child: Stack(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: widget.topPadding ?? 0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (_, __) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: items.map(
                      (BarItem item) {
                        final int index = items.indexOf(item);
                        return BuildIconButton(
                          bottomPadding: bottomPadding,
                          barHeight: barHeight,
                          barColor: backgroundColor,
                          inactiveColor: inactiveIconColor,
                          color: dropColor,
                          index: index,
                          iconSize: iconSize,
                          seletedIndex: selectedIndex.toInt(),
                          controller: _controller,
                          selectedIcon: item.filledIcon,
                          unslectedIcon: item.outlinedIcon,
                          text: item.text,
                          textStyle: item.textStyle,
                          onPressed: () => _onTap(index),
                          padding: widget.padding,
                        );
                      },
                    ).toList(),
                  ),
                ),
              )),
          BuildRunningDrop(
              itemCount: items.length,
              controller: _controller,
              selectedIndex: selectedIndex,
              previousIndex: _previousIndex,
              color: dropColor,
              padding: widget.padding)
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
