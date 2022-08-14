import 'package:events_digital14/helper_class/colors.dart';
import 'package:flutter/material.dart';

class SearchTextFieldWidget extends StatelessWidget {

  final TextEditingController txtController;

  final String? hintText;
  final String? labelText;

  const SearchTextFieldWidget({
    Key? key,
    required this.txtController,
    this.hintText,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search, color: AppColors.whiteColor,),
        suffixIcon: txtController.text.isNotEmpty ? IconButton(
          onPressed: () {
            txtController.text = "";
          },
          icon: const Icon(Icons.cancel, color: AppColors.whiteColor,),
        ) : const Text(""),
        border: InputBorder.none,
        hintText: "Search",
        hintStyle: TextStyle(color: AppColors.whiteColor.withOpacity(0.5),),
      ),
      cursorColor: AppColors.whiteColor,
      style: const TextStyle(
        color: AppColors.whiteColor,
      ),
      controller: txtController,
    );
  }

}