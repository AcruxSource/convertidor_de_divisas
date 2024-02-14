import 'package:convertidor_de_divisas/utils/variables.utils.dart';
import 'package:convertidor_de_divisas/widgets/ConversionsDisplay.widgets.dart';
import 'package:convertidor_de_divisas/widgets/CurrencySelector.widgets.dart';
import 'package:convertidor_de_divisas/widgets/KeyPad.widgets.dart';
import 'package:flutter/material.dart';

class ConverterPage extends StatefulWidget {
  const ConverterPage({super.key});

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  void updateOnChaged() {
    setState(() {
      currencyValue[0] = 0;
      currencyValue[1] = 0;
      counter = 0;
    });
  }

  void updateOnPressed() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 10,
        shadowColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Currency Converter',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
//----------------------------------------------------------------------------------

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CurrencySelector(index: 0, callback: updateOnChaged),
                  const Icon(Icons.arrow_forward_sharp),
                  CurrencySelector(index: 1, callback: updateOnChaged),
                ]),
          ),

//----------------------------------------------------------------------------------

          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: ConversionsDisplay(
                  indexCurrency1: currencyType[0],
                  indexCurrency2: currencyType[1],
                  rate: rates[currencyType[0]][currencyType[1]])),
          const Divider(
            color: Color.fromARGB(144, 244, 67, 54),
            height: 30,
            thickness: 1,
            endIndent: 40,
            indent: 40,
          ),
//----------------------------------------------------------------------------------

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                KeyPad(number: 7, callback: updateOnPressed),
                KeyPad(number: 8, callback: updateOnPressed),
                KeyPad(number: 9, callback: updateOnPressed),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                KeyPad(number: 4, callback: updateOnPressed),
                KeyPad(number: 5, callback: updateOnPressed),
                KeyPad(number: 6, callback: updateOnPressed),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                KeyPad(number: 1, callback: updateOnPressed),
                KeyPad(number: 2, callback: updateOnPressed),
                KeyPad(number: 2, callback: updateOnPressed),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  KeyZero(callback: updateOnPressed),
                  KeyReset(callback: updateOnPressed)
                ]),
          ),
//----------------------------------------------------------------------------------
        ],
      ),
    );
  }
}
