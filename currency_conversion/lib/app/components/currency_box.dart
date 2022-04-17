import 'package:currency_conversion/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  final List<CurrencyModel> itemsList;
  final CurrencyModel selectedItem;
  final TextEditingController controller;
  final void Function(CurrencyModel? model)? onChanged;
  final TextInputType keyBoardType;
  final double cursorWidth;

  const CurrencyBox({
    Key? key,
    required this.itemsList,
    required this.controller,
    required this.onChanged,
    required this.selectedItem,
    required this.keyBoardType,
    required this.cursorWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 56,
            child: DropdownButton<CurrencyModel>(
              iconSize: 40.0,
              hint: const Text('data'),
              iconEnabledColor: Colors.amber,
              isExpanded: true,
              value: selectedItem,
              underline: Container(
                height: 2,
                color: Colors.amber,
              ),
              items: itemsList
                  .map<DropdownMenuItem<CurrencyModel>>(
                    (item) => DropdownMenuItem<CurrencyModel>(
                      value: item,
                      child: Center(child: Text(item.name)),
                    ),
                  )
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: TextField(
            cursorColor: Colors.amber,
            cursorWidth: cursorWidth,
            keyboardType: keyBoardType,
            controller: controller,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.amber,
                  width: 2.0,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.amber,
                  width: 2.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
