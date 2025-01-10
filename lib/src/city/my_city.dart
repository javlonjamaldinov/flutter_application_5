import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class MyTown extends StatefulWidget {
  const MyTown({super.key});

  @override
  State<MyTown> createState() => _MyTownState();
}

class _MyTownState extends State<MyTown> {
  String selectedCity = "Ош";
  final List<String> cities = [
    "Ош",
    "Бишкек",
    "Нарын",
    "Джалал-Абад",
    "Каракол"
  ];

  Future<void> determineLocation() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Ваше местоположение"),
              content: Text(
                  "Широта: ${position.latitude}, Долгота: ${position.longitude}"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("ОК"),
                ),
              ],
            );
          },
        );
      } catch (e) {
        _showError("Не удалось определить местоположение.");
      }
    } else if (status.isDenied) {
      _showError("Разрешение на доступ к геолокации было отклонено.");
    } else if (status.isPermanentlyDenied) {
      _showError("Разрешение на доступ к геолокации отключено навсегда.");
      await openAppSettings();
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Colors.white;
    final Color subTextColor = Colors.black.withOpacity(0.7);
    const Color accentColor = Color(0xFF4C4DDC);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Мой город",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 4.h),

                  Text("Укажите город",
                      style: TextStyle(color: subTextColor, fontSize: 4.w)),
                  SizedBox(height: 1.h),

                  // Autocomplete виджет
                  Autocomplete<String>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text.isEmpty) {
                        return const Iterable<String>.empty();
                      }
                      return cities.where((String city) => city
                          .toLowerCase()
                          .contains(textEditingValue.text.toLowerCase()));
                    },
                    onSelected: (String selection) {
                      setState(() {
                        selectedCity = selection;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Вы выбрали: $selection"),
                        ),
                      );
                    },
                    fieldViewBuilder:
                        (context, controller, focusNode, onFieldSubmitted) {
                      return TextField(
                        
                        controller: controller,
                        focusNode: focusNode,
                        decoration: InputDecoration(
                          hintText: "Введите город...",
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.search),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 4.h),
                  GestureDetector(
                    onTap: determineLocation,
                    child: Row(
                      children: [
                        Icon(Icons.location_on, color: accentColor, size: 6.w),
                        SizedBox(width: 3.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Мое местоположение",
                                style: TextStyle(
                                    color: accentColor,
                                    fontSize: 4.w,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 0.5.h),
                            Text("Определить мое местоположение",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 3.5.w)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
