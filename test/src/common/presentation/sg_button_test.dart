import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sys_gallery/src/common/presentation/sg_button.dart';
import 'package:sys_gallery/src/constants/sg_icons.dart';

import '../../../components/base/base_component_app.dart';

void main() {
  testWidgets('SGButton displays label and icon', (WidgetTester tester) async {
    // Arrange
    const String label = 'Click Me';
    const Icon icon = kAddIcon;
    final Widget button = SGButton(
      txtLabel: label,
      onPressed: () {},
      icon: icon,
    );

    // Act
    await tester.pumpWidget(baseComponentApp(button));

    // Assert
    expect(find.text(label), findsOneWidget);
    expect(find.byWidget(icon), findsOneWidget);
  });

  testWidgets('SGButton without icon displays only label', (WidgetTester tester) async {
    // Arrange
    const String label = 'Click Me';
    final Widget button = SGButton(
      txtLabel: label,
      onPressed: () {},
    );

    // Act
    await tester.pumpWidget(baseComponentApp(button));

    // Assert
    expect(find.text(label), findsOneWidget);
    expect(find.byType(Icon), findsNothing);
  });

  testWidgets('SGButton triggers onPressed when tapped', (WidgetTester tester) async {
    // Arrange
    bool wasPressed = false;
    const String label = 'Click Me';
    final Widget button = SGButton(
      txtLabel: label,
      onPressed: () {
        wasPressed = true;
      },
    );

    // Act
    await tester.pumpWidget(baseComponentApp(button));
    await tester.tap(find.text(label));
    await tester.pump();

    // Assert
    expect(wasPressed, true);
  });
}