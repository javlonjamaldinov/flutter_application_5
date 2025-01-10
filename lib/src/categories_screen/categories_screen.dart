import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final _searchController = TextEditingController();

  final items = List.generate(
    20,
    (index) => {
      "title": index % 2 == 0
          ? "Mango кофейня"
          : "Sierra", // Названия кафе
      "subtitle": index % 2 == 0
          ? "50 приветственных баллов"
          : "30 приветственных баллов", // Тексты для кафе
      "cashback": index % 2 == 0 ? "7%" : "5%", // Кэшбэк для кафе
      "type": index % 2 == 0 ? "Кофейня" : "Ресторан", // Типы заведений
      "image": index % 2 == 0
          ? 'assets/images/mango.png'
          : 'assets/images/sierra.png', // Изображения для кафе
    },
  );

  Map<String, bool> _activeFilters = {
    "Все": true,
    "Кофейня": false,
    "Ресторан": false,
    "Магазин": false,
  };

  Map<String, bool> _tempFilters = {};
  List<Map<String, String>> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _applyFilters();
  }

  void _applyFilters() {
    setState(() {
      if (_activeFilters["Все"] == true) {
        _filteredItems = List.from(items);
      } else {
        _filteredItems = items.where((item) {
          for (var key in _activeFilters.keys) {
            if (_activeFilters[key]! && item["type"] == key) {
              return true;
            }
          }
          return false;
        }).toList();
      }
    });
  }

  void _showFilterModal() {
    _tempFilters = Map.from(_activeFilters);

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 10.w,
                    height: 0.7.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Фильтры",
                        style: TextStyle(
                          fontSize: 5.w,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setModalState(() {
                            _tempFilters.forEach((key, value) {
                              _tempFilters[key] = key == "Все";
                            });
                          });
                        },
                        child: Text(
                          "Сбросить все",
                          style: TextStyle(
                            fontSize: 3.8.w,
                            color: const Color(0xFF4C4DDC),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Column(
                    children: _tempFilters.keys.map((filter) {
                      return Row(
                        children: [
                          Expanded(
                            child: Text(
                              filter,
                              style: TextStyle(
                                fontSize: 4.w,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Checkbox(
                            value: _tempFilters[filter],
                            onChanged: (value) {
                              setModalState(() {
                                if (filter == "Все") {
                                  _tempFilters.forEach((key, _) {
                                    _tempFilters[key] = value!;
                                  });
                                } else {
                                  _tempFilters["Все"] = false;
                                  _tempFilters[filter] = value!;
                                }
                              });
                            },
                            activeColor: const Color(0xFF4C4DDC),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 9.h),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _activeFilters = Map.from(_tempFilters);
                            _applyFilters();
                          });
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF4C4DDC),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 1.8.h),
                          alignment: Alignment.center,
                          child: Text(
                            "Применить",
                            style: TextStyle(
                              fontSize: 4.w,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xFF4C4DDC), width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 1.8.h),
                          alignment: Alignment.center,
                          child: Text(
                            "Отмена",
                            style: TextStyle(
                              fontSize: 4.w,
                              color: const Color(0xFF4C4DDC),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color accentColor = Color(0xFF4C4DDC);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _searchController,
                        style: TextStyle(fontSize: 3.5.w),
                        decoration: InputDecoration(
                          icon: Icon(Icons.search,
                              color: const Color(0x2D4C4DDC), size: 4.5.w),
                          hintText: "Search",
                          border: InputBorder.none,
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 3.5.w),
                        ),
                        onChanged: (text) {
                          setState(() {
                            _filteredItems = items.where((item) {
                              return item["title"]!
                                  .toLowerCase()
                                  .contains(text.toLowerCase()) ||
                                  item["subtitle"]!
                                      .toLowerCase()
                                      .contains(text.toLowerCase());
                            }).toList();
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 3.5.w),
                  GestureDetector(
                    onTap: _showFilterModal,
                    child: Container(
                      width: 9.8.w,
                      height: 9.8.w,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0x2D4C4DDC),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: SvgPicture.asset(
                          'assets/svg/Filter.svg',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1.5.h),
              GridView.builder(
                itemCount: _filteredItems.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 3.w,
                  crossAxisSpacing: 3.w,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  final item = _filteredItems[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(16, 76, 76, 220),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 13.sp, vertical: 10.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            item["cashback"]!,
                            style: TextStyle(
                              color: accentColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            width: 25.w,
                            height: 12.h,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(item["image"]!),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(height: 1.5.h),
                        Text(
                          item["title"]!,
                          style: TextStyle(
                            fontSize: 4.w,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 0.5.h),
                        Text(
                          item["subtitle"]!,
                          style: TextStyle(
                            fontSize: 3.5.w,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
