import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macdock/presentation/widgets/dock_widget.dart';

void main() {
  testWidgets('DockWidget renders icons', (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DockWidget(
            items: const [
              Icons.person,
              Icons.message,
              Icons.call,
              Icons.camera,
              Icons.photo,
            ],
          ),
        ),
      ),
    );

    // Assert
    expect(find.byIcon(Icons.person), findsOneWidget);
    expect(find.byIcon(Icons.message), findsOneWidget);
    expect(find.byIcon(Icons.call), findsOneWidget);
    expect(find.byIcon(Icons.camera), findsOneWidget);
    expect(find.byIcon(Icons.photo), findsOneWidget);
  });
}