import 'package:flutter/material.dart';

import 'package:crud_api_with_bloc/ui/widget/custome_textfield.dart';

class HomeAddEditScreen extends StatelessWidget {
  final bool newPerson;
  const HomeAddEditScreen({
    Key? key,
    required this.newPerson,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _firsName = TextEditingController();
    TextEditingController _lastName = TextEditingController();
    TextEditingController _email = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(newPerson ? "Add Data" : 'Edit Data'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                controller: _firsName,
                action: TextInputAction.done,
                type: TextInputType.text,
                hintText: "Masukan First Name",
                onValidator: (value) =>
                    (value?.isEmpty ?? "Masukan First Name").toString(),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _lastName,
                action: TextInputAction.done,
                type: TextInputType.text,
                hintText: "Masukan Last Name",
                onValidator: (value) =>
                    (value?.isEmpty ?? "Masukan Last Name").toString(),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                  controller: _email,
                  action: TextInputAction.done,
                  type: TextInputType.text,
                  hintText: "Masukan Email",
                  onValidator: (value) =>
                      (value?.isEmpty ?? "Masukan Email").toString()),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.add),
                label: Text(newPerson ? "Add" : "Update"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
