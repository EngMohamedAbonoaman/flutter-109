import 'dart:io';

import 'package:flutter/material.dart';

import 'package:store_app_project/widgets/build_text_field.dart';



class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

var idController = TextEditingController();
String dropDownValue = "";
var priceController = TextEditingController();
var titleController = TextEditingController();
var descriptionController = TextEditingController();
File? _imgFile;

// void takeSnapshot() async {
//   // final ImagePicker picker = ImagePicker();
//   // final XFile? img = await picker.pickImage(
//   //   source: ImageSource.gallery, // alternatively, use ImageSource.gallery
//   //   maxWidth: 400,
//   // );
//   if (img == null) return;
//   _imgFile = File(img.path);
//   print(_imgFile); // convert it to a Dart:io file
// }

class _AddProductScreenState extends State<AddProductScreen> {
  bool isLoading = false;
  List<String> categories = [];
  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
  //get product here
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 50,
          title: const Text(
            "Add Product",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 2,
                            child: BuildTextField(
                              title: "ID",
                              controller: idController,
                              hint: "Enter product id...",
                            )),
                        Expanded(child: SizedBox()),
                        Expanded(
                            flex: 2,
                            child: BuildTextField(
                              controller: priceController,
                              title: "Price",
                              hint: "Enter product price...",
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: BuildTextField(
                          title: "Title",
                          controller: titleController,
                          hint: "Enter product title"),
                    ),
                    BuildTextField(
                        title: "description",
                        controller: descriptionController,
                        hint: "Enter product description"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .5,
                          child: DropdownButton<String>(
                              value: dropDownValue,
                              hint: Text("Please select category"),
                              items: categories.map((String category) {
                                return DropdownMenuItem<String>(
                                  child: Text(category),
                                  value: category,
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  dropDownValue = value!;
                                });
                              }),
                        ),
                        const Text(
                          "Categories",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // takeSnapshot();
          },
        ));
  }
}
