// ترتيب الويدجيتات حسب الشاشة مع توضيح التعليقات
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  //  لما بنقفل ونشغل بيبقي مترجت علي الاحاجات دي وبنغير بقا وبنعرف نوع الفيربول بقا
  String selectedGender = 'MALE';
  double height = 170;
  double weight = 80;
  int age = 20;
  String selectedUnit = 'Cm';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF121212),
        foregroundColor: Colors.white,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ايقونة التطبيق
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: Color(0xFFD9FE7F),
                borderRadius: BorderRadius.circular(11),
              ),
              child: Icon(
                Icons.hourglass_bottom,
                color: Colors.black,
                size: 25,
              ),
            ),
            SizedBox(width: 8),
            Text(
              'BMI Calculator',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // اختيار الجنس
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildGenderCard('MALE', Icons.male),
                _buildGenderCard('FEMALE', Icons.female),
              ],
            ),
            SizedBox(height: 10),

            // اختيار الطول
            _buildSliderCard(
              'Height',
              _convertHeight(height),
              selectedUnit,
              Slider(
                value: height,
                min: 100,
                max: 200,
                onChanged: (value) {
                  setState(() {
                    height = value;
                  });
                },
                activeColor: Color(0x48D9FE7F),
                thumbColor: Color(0xFFD9FE7F),
                inactiveColor: Color(0xFF121212),
              ),
            ),
            SizedBox(height: 13),

            // الوزن والعمر
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCounterCard(
                  'Weight',
                  '${weight.toInt()}',
                  'Kg',
                  () {
                    setState(() {
                      weight--;
                    });
                  },
                  () {
                    setState(() {
                      weight++;
                    });
                  },
                ),
                _buildCounterCard(
                  'Age',
                  '$age',
                  'Year',
                  () {
                    setState(() {
                      age--;
                    });
                  },
                  () {
                    setState(() {
                      age++;
                    });
                  },
                ),
              ],
            ),
            Spacer(),

            // زر الحساب
            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                color: Color(0xFFD9FE7F),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ElevatedButton(
                onPressed: () {
                  double heightInMeters =
                      selectedUnit == 'Cm'
                          ? height / 100
                          : (selectedUnit == 'Ft'
                              ? height * 0.3048
                              : height * 0.0254);
                  double bmi = weight / (heightInMeters * heightInMeters);
                  Navigator.pushNamed(context, '/results', arguments: bmi);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFD9FE7F),
                  shadowColor: Color(0xFFD9FE7F),
                  foregroundColor: Colors.black,
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Calculate'),
                    SizedBox(width: 12),
                    Icon(Icons.calculate),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // كارد الجنس
  Widget _buildGenderCard(String gender, IconData icon) {
    bool isSelected = selectedGender == gender;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
      },
      child: Container(
        width: 175,
        height: 190,
        decoration: BoxDecoration(
          color: isSelected ? Color(0x48D9FE7F) : Color(0x2E738547),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Color(0xFFD9FE7F) : Colors.transparent,
            width: 4,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: Color(0xFFD9FE7F)),
            SizedBox(height: 10),
            Text(
              gender,
              style: TextStyle(fontSize: 18, color: Color(0xFFD9FE7F)),
            ),
          ],
        ),
      ),
    );
  }

  // كارد الطول والسلايدر والوحدات
  Widget _buildSliderCard(
    String title,
    String value,
    String unit,
    Widget slider,
  ) {
    return Container(
      width: 342,
      padding: EdgeInsets.all(20),
      height: 220,
      decoration: BoxDecoration(
        color: Color(0x2E738547),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontSize: 18, color: Colors.white)),
              Row(
                children: [
                  _buildUnitCircle('In', unit == 'In'),
                  SizedBox(width: 5),
                  _buildUnitCircle('Ft', unit == 'Ft'),
                  SizedBox(width: 5),
                  _buildUnitCircle('Cm', unit == 'Cm'),
                ],
              ),
            ],
          ),
          SizedBox(height: 30),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          slider,
        ],
      ),
    );
  }

  // دائرة اختيار الوحدة (cm، in، ft)
  Widget _buildUnitCircle(String unit, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedUnit = unit;
        });
      },
      child: Container(
        width: 35,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Color(0xFFD9FE7F) : Colors.grey[600],
        ),
        child: Center(
          child: Text(
            unit,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  // كارد الوزن أو العمر
  Widget _buildCounterCard(
    String title,
    String value,
    String unit,
    VoidCallback onDecrement,
    VoidCallback onIncrement,
  ) {
    return Container(
      width: 170,
      height: 160,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0x2E738547),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(title, style: TextStyle(fontSize: 20, color: Colors.white)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: Color(0xFFD9FE7F),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: onDecrement,
                    icon: Icon(Icons.remove, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: Color(0xFFD9FE7F),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: IconButton(
                    padding:
                        EdgeInsets
                            .zero, //  دي بتشيل المسافات اللي جوا عشان الايقون تبقي في النص بظبط
                    onPressed: onIncrement,
                    icon: Icon(Icons.add, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(unit, style: TextStyle(fontSize: 18, color: Color(0xFAFAFACCC))),
          // kg,year
        ],
      ),
    );
  }

  // تحويل الطول للوحدة المختارة
  String _convertHeight(double height) {
    if (selectedUnit == 'Cm') {
      return '${height.toInt()}';
    } else if (selectedUnit == 'Ft') {
      double feet = height / 30.48;
      return '${feet.toStringAsFixed(1)}';
    } else {
      double inches = height / 2.54;
      return '${inches.toStringAsFixed(1)}';
    }
  }
}
