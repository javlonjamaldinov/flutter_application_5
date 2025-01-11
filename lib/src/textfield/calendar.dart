import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final TextEditingController _controller = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blueAccent, // Цвет основного элемента
              onPrimary: Colors.white,   // Цвет текста в основных элементах
              onSurface: Colors.black,   // Цвет текста в календаре
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _controller.text = DateFormat('dd/MM/yyyy').format(_selectedDate!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Календарь"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              readOnly: true,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                labelText: "Выберите дату",
                labelStyle: const TextStyle(fontSize: 18),
                prefixIcon: const Icon(Icons.calendar_today, color: Colors.blueAccent),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
                ),
              ),
              onTap: () => _selectDate(context),
            ),
            const SizedBox(height: 20),
            if (_selectedDate != null)
              Text(
                "Вы выбрали: ${DateFormat('dd MMMM yyyy', 'ru').format(_selectedDate!)}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
          ],
        ),
      ),
    );
  }
}