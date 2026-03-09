import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Esta es la línea clave que ahora sí coincidirá con tu pubspec.yaml:
import 'package:informe_instalacion_flutter/main.dart';

void main() {
  testWidgets('Prueba de carga básica', (WidgetTester tester) async {
    // 1. Construye la aplicación.
    await tester.pumpWidget(const MyApp());

    // 2. Busca si existe el widget principal (MaterialApp).
    // Esto es suficiente para confirmar que la app arranca sin errores graves.
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
