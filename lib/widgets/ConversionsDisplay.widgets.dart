import 'package:convertidor_de_divisas/utils/variables.utils.dart';
import 'package:flutter/material.dart';

class ConversionsDisplay extends StatefulWidget {
  const ConversionsDisplay(
      {super.key,
      required this.indexCurrency1,
      required this.indexCurrency2,
      required this.rate});
  final int indexCurrency1;
  final int indexCurrency2;
  final double rate;

  @override
  State<ConversionsDisplay> createState() => _DisplayState();
}

class _DisplayState extends State<ConversionsDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: const Color.fromARGB(52, 255, 159, 159),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(60, 20, 0, 0),
            child: Row(
              children: [
                Text(
                  '${currencies[widget.indexCurrency1]}:',
                  style: const TextStyle(
                      fontSize: 20, color: Color.fromRGBO(0, 0, 0, 0.589)),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 0, 10),
            child: Text(
              currencyValue[0].toString(),
              style: const TextStyle(
                  fontSize: 35, color: Color.fromRGBO(0, 0, 0, 0.425)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
            child: Row(
              children: [
                Text(
                  '${currencies[widget.indexCurrency2]}:',
                  style: const TextStyle(
                      fontSize: 20, color: Color.fromRGBO(0, 0, 0, 0.589)),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 0, 10),
            child: Text(
              currencyValue[1].toStringAsFixed(1),
              maxLines: 1,
              style: const TextStyle(
                  fontSize: 35, color: Color.fromRGBO(0, 0, 0, 0.425)),
            ),
          ),
        ],
      ),
    );
  }
}
