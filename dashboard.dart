import 'package:flutter/material.dart';
import 'package:pitbiarhive/view/widgets/c_text.dart';
import 'package:pitbiarhive/view/widgets/c_textfield.dart';
import 'package:pitbiarhive/view/widgets/constant.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController year = TextEditingController();
  String selectedValue = "Letter";
  int selectedYear = DateTime.now().year;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.05, vertical: height * 0.05),
          width: width * 5,
          height: height * 5,
          child: Column(
            children: [
              // Logo
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    fontWeight: FontWeight.bold,
                    fontsize: 40,
                    text: "PITBI",
                    color: ColorTheme.oranges,
                  ),
                  CustomText(
                    fontWeight: FontWeight.bold,
                    fontsize: 40,
                    text: "ARCHIVE",
                    color: ColorTheme.blues,
                  ),
                ],
              ),
              //Doc Name
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 250, vertical: 10),
                child: CustomTextField(
                    controller: nameController, hint: "Document Name"),
              ),

              // Drop down
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 250, vertical: 10),
                child: DropdownButtonFormField<String>(
                  value: selectedValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  },
                  items: <String>[
                    'Letter',
                    'Itinerary/Disbursement Voucher',
                    'Travel Order',
                    'OTR',
                    'OPCR',
                    'Purchase Order',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    labelText: 'Document Type',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              //
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showYearPicker(BuildContext context) async {
    int? selectedYear = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return YearPicker(
          initialYear: DateTime.now().year,
          onYearChanged: (year) {
            setState(() {
              selectedYear = year;
            });
            Navigator.pop(context, year);
          },
        );
      },
    );
  }
}
