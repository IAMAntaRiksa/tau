import 'package:flutter/material.dart';

class WidgetState {
  static Widget notFound(BuildContext context) {
    return const Center(
      child: Text("DATA TIDAK DITEMUKAN",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black87,
          )),
    );
  }

  static Widget errorLoading(BuildContext context) {
    return Column(
      children: [
        ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
            label: const Text('Refresh'))
      ],
    );
  }

  static Widget loading(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
