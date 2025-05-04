import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double bmi = ModalRoute.of(context)!.settings.arguments as double;
    String category = _getBMICategory(bmi);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF121212),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Results', style: TextStyle(fontSize: 20)),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 2),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0x2E738547),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Your BMI is ', style: TextStyle(fontSize: 18)),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Color(0x33C40000),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            category,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFF0000),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Text(
                        bmi.toStringAsFixed(1),
                        style: TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 7),
                    Text.rich(
                      // وظيفتها انها بتختار كلمه ونغير في خصائصها ف خليت الكلمه بتاعت الوزن بولد
                      _getBMIMainMessage(category),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),

              SizedBox(height: 10),
              Text(
                'What is $category?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                _getBMIDescription(category),
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              Text(
                '⚠  Health Risks of Being Overweight:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• High blood pressure'),
                  SizedBox(height: 8),
                  Text('• Heart disease'),
                  SizedBox(height: 8),
                  Text('• Type 2 diabetes'),
                  SizedBox(height: 8),
                  Text('• Joint pain and inflammation'),
                  SizedBox(height: 8),
                  Text('• Sleep disorders'),
                  SizedBox(height: 8),
                  Text('• Low self-confidence'),
                ],
              ),

              SizedBox(height: 30), // بدل ال Spacer

              Center(
                child: SizedBox(
                  width: 342,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD9FE7F),
                      foregroundColor: Colors.black,
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Re-calculate'),
                        SizedBox(width: 12),
                        Icon(Icons.refresh),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  String _getBMICategory(double bmi) {
    if (bmi < 18.5) return 'Underweight';
    if (bmi >= 18.5 && bmi <= 24.9) return 'Normal weight';
    if (bmi >= 25.0 && bmi <= 29.9) return 'Overweight';
    return 'Obese';
  }
}

String _getBMIDescription(String category) {
  switch (category) {
    case 'Underweight':
      return 'Being underweight means you have less body fat than is considered healthy for your height. A BMI less than 18.5 is considered underweight.';
    case 'Normal weight':
      return 'Having a normal weight means your body fat is in a healthy range for your height. A BMI between 18.5 and 24.9 is considered normal.';
    case 'Overweight':
      return 'Being overweight means having more body fat than is considered healthy for your height. A BMI between 25.0 and 29.9 is considered overweight.';
    case 'Obese':
      return 'Obesity means having a high amount of body fat, which can increase the risk of health problems. A BMI of 30.0 or more is considered obese.';
    default:
      return '';
  }
}

TextSpan _getBMIMainMessage(String category) {
  switch (category) {
    case 'Underweight':
      return TextSpan(
        children: [
          TextSpan(
            text: 'Your BMI result indicates that you are ',
            style: TextStyle(fontSize: 16),
          ),
          TextSpan(
            text: 'underweight',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text:
                '.\n\nTry to eat more nutritious food and follow a healthy lifestyle to gain weight safely.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      );
    case 'Normal weight':
      return TextSpan(
        children: [
          TextSpan(
            text: 'Your BMI result indicates that your weight is ',
            style: TextStyle(fontSize: 16),
          ),
          TextSpan(
            text: 'normal',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text:
                '.\n\nKeep up your healthy lifestyle to maintain your ideal weight.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      );
    case 'Overweight':
      return TextSpan(
        children: [
          TextSpan(
            text: 'Your BMI result indicates that you are ',
            style: TextStyle(fontSize: 16),
          ),
          TextSpan(
            text: 'overweight',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text:
                '.\n\nTry a healthy diet and regular exercise to lose weight and feel better.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      );
    case 'Obese':
      return TextSpan(
        children: [
          TextSpan(
            text: 'Your BMI result indicates that you are ',
            style: TextStyle(fontSize: 16),
          ),
          TextSpan(
            text: 'obese',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text:
                '.\n\nIt’s recommended to follow a balanced diet and stay active to reduce weight and improve your health.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      );
    default:
      return TextSpan(text: '', style: TextStyle(fontSize: 16));
  }
}//\n\n عشان يضيف سطر بين الجملتين
// الصفحه فيها اسكرول

