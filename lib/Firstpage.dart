import 'package:bmi/secondpage.dart';
import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  const Bmi({super.key});

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();
final TextEditingController result = TextEditingController();

  late List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem? _selectedItem;
  final List<ListItem> _dropdownItems = [
    ListItem(1, 'วิทยาศาสตร์'),
    ListItem(2, 'นิติศาสตร์'),
    ListItem(3, 'ศึกษาศาสตร์'),
    ListItem(4, 'วิศวกรรมศาสตร์'),
    ListItem(5, 'เทคโนโลยีเเละการพัฒนาสิ่งเเวดล้อม'),
    ListItem(6, 'วิทยาศาสตร์การกีฬา'),

  ];

  bool isCheck = false;
  @override
  void initState() {
    super.initState();

    _dropdownMenuItems = buildDropdownMenuItem(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<ListItem>> buildDropdownMenuItem(
      List<ListItem> dropdownItems) {
    List<DropdownMenuItem<ListItem>> items = [];
    for (ListItem listItem in dropdownItems) {
      items.add(DropdownMenuItem(
        child: Text(listItem.name),
        value: listItem,
      ));
    }
    return items;
  }

  String? gender;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('BMI calculator '),
            backgroundColor: Color.fromARGB(255, 190, 189, 189)),
        body: SafeArea(
          child: SizedBox(
              child: Form(
            child: ListView(
              children: [
                Text("Height"),
                TextFormField(
                  controller: _height,
                  keyboardType: TextInputType.number,
                  decoration:
                      new InputDecoration.collapsed(hintText: 'ส่วนสูง'),
                ),
                Text("Weight"),
                TextFormField(
                  controller: _weight,
                  keyboardType: TextInputType.number,
                  decoration:
                      new InputDecoration.collapsed(hintText: 'น้ำหนัก'),
                ),
                Text("\n"),
                RadioListTile(
                  title: Text("Male"),
                  value: "Male",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text("Female"),
                  value: "Female",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text("Other"),
                  value: "Other",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                
                DropdownButton(
                  value: _selectedItem,
                  items: _dropdownMenuItems,
                  onChanged: (value) {
                    setState(() {
                      _selectedItem = value;
                    });
                  },
                ),



     ElevatedButton(
      child: Text('Calculate'),
      onPressed: () {
       Navigator.push(
context,
MaterialPageRoute(
builder: (context) => SecondRoute(height: '123', result: '12', weight: '55',),
),
);
      },),
      
    
                
              ],
            ),
          )),
        ));
  }
}

class ListItem {
  int value;
  String name;
  ListItem(this.value, this.name);
}




