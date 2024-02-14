import 'package:convertidor_de_divisas/utils/variables.utils.dart';
import 'package:flutter/material.dart';

class CurrencySelector extends StatefulWidget {
  const CurrencySelector(
      {super.key, required this.index, required this.callback});
  final int index;
  final Function() callback;

  @override
  State<CurrencySelector> createState() => _DropDownBttState();
}

class _DropDownBttState extends State<CurrencySelector> {
  String data = currencies.first;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromARGB(43, 255, 0, 0), width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(40))),
            child: DropdownButton<String>(
                iconSize: 40,
                style: const TextStyle(fontSize: 22, color: Colors.black),
                value: data,
                items: currencies.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  widget.callback();
                  setState(() {
                    data = value!;
                    currencyType[widget.index] = currencies.indexOf(value);
                  });
                })));
  }
}
