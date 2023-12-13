// ignore_for_file: prefer_function_declarations_over_variables

import 'package:advance_water_drop_nav_bar/advance_water_drop_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

OnButtonPressCallback onItemSelected = (_) {};

void main() {
  testWidgets('expecting default values', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: WaterDropNavBar(barItems: <BarItem>[
            BarItem(
                filledIcon: Icons.home_filled,
                outlinedIcon: Icons.home_outlined,  text: "Home"),
            BarItem(
                filledIcon: Icons.bookmark_rounded,
                outlinedIcon: Icons.bookmark_outline_rounded,  text: "Home")
          ], selectedIndex: 0, onItemSelected: onItemSelected),
        ),
      ),
    );
    expect(
      tester.widget<WaterDropNavBar>(find.byType(WaterDropNavBar)).iconSize,
      28.0,
    );
    expect(
      tester
          .widget<WaterDropNavBar>(find.byType(WaterDropNavBar))
          .backgroundColor,
      Colors.white,
    );
    expect(
      tester
          .widget<WaterDropNavBar>(find.byType(WaterDropNavBar))
          .waterDropColor,
      const Color(0xFF5B75F0),
    );
  });

  testWidgets(
      'throws assertion error if items are less than two or greater than four',
      (WidgetTester tester) async {
    /// base widget
    Widget boilerplate(List<BarItem> items) {
      return MaterialApp(
        home: Material(
          child: WaterDropNavBar(
            selectedIndex: 0,
            onItemSelected: onItemSelected,
            barItems: items,
          ),
        ),
      );
    }

    // Less than two items, throw exception
    expect(() async {
      await tester.pumpWidget(boilerplate(<BarItem>[
        BarItem(
          filledIcon: Icons.bookmark_rounded,
          outlinedIcon: Icons.bookmark_border_rounded,
            text: "Home"
        ),
      ]));
    }, throwsAssertionError);

    // More than four items, throw exception
    expect(() async {
      await tester.pumpWidget(boilerplate(<BarItem>[
        BarItem(
          filledIcon: Icons.bookmark_rounded,
          outlinedIcon: Icons.bookmark_border_rounded,
            text: "Home"
        ),
        BarItem(
            filledIcon: Icons.favorite_rounded,
            outlinedIcon: Icons.favorite_border_rounded,  text: "Home"),
        BarItem(
          filledIcon: Icons.email_rounded,
          outlinedIcon: Icons.email_outlined,
            text: "Home"
        ),
        BarItem(
          filledIcon: Icons.folder_rounded,
          outlinedIcon: Icons.folder_outlined,
            text: "Home"
        ),
        BarItem(
          filledIcon: Icons.home_filled,
          outlinedIcon: Icons.home_outlined,
            text: "Home"
        ),
      ]));
    }, throwsAssertionError);
  });
}
