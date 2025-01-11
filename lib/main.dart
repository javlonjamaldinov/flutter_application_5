import 'package:flutter/material.dart';
import 'package:flutter_application_5/src/app/my_app.dart';
import 'package:intl/date_symbol_data_local.dart'; // Используйте этот импорт вместо http_request

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ru'); // Убираем null, так как он не требуется
  runApp(const MyApp());
}
