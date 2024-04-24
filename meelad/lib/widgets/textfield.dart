import 'package:flutter/material.dart';

Widget buildTextField( TextEditingController controller, String label, String hint, String iconpath){
  return SizedBox(
    width: 317,
    height: 55,
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint, 
        prefixIcon: ImageIcon(AssetImage(iconpath),
        size : 24,),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: constColor.fromRGBO(178, 164, 255, 1))
      ),
    ),
  );
}