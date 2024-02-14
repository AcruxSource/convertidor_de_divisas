import 'package:convertidor_de_divisas/utils/variables.utils.dart';
import 'package:flutter/material.dart';

class KeyPad extends StatefulWidget {
  const KeyPad({super.key, required this.number, required this.callback});
  final int number;
  final Function() callback;

  @override
  State<KeyPad> createState() => _KeyPadStates();
}

class _KeyPadStates extends State<KeyPad> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: const Color.fromARGB(255, 255, 77, 77),
      elevation: 5,
      height: 65,
      minWidth: 100,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Text(
        widget.number.toString(),
        style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(122, 0, 0, 0)),
      ),
      onPressed: () {
        setState(() {
          if (counter <= 9) {
            currencyValue[0] = currencyValue[0] * placeValue + widget.number;
            currencyValue[1] =
                currencyValue[0] * rates[currencyType[0]][currencyType[1]];
          }
          counter = counter + 1;
        });
        widget.callback();
      },
    );
  }
}

class KeyZero extends StatefulWidget {
  const KeyZero({super.key, required this.callback});
  final Function() callback;

  @override
  State<KeyZero> createState() => _KeyzeroStates();
}

class _KeyzeroStates extends State<KeyZero> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: const Color.fromARGB(255, 255, 77, 77),
      elevation: 5,
      height: 65,
      minWidth: 220,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: const Text(
        '0',
        style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(122, 0, 0, 0)),
      ),
      onPressed: () {
        setState(() {
          if (counter <= 9) {
            currencyValue[0] = currencyValue[0] * placeValue + 0;
            currencyValue[1] =
                currencyValue[0] * rates[currencyType[0]][currencyType[1]];
          }
          counter = counter + 1;
        });
        widget.callback();
      },
    );
  }
}

class KeyReset extends StatefulWidget {
  const KeyReset({super.key, required this.callback});
  final Function() callback;

  @override
  State<KeyReset> createState() => _KeyResetStates();
}

class _KeyResetStates extends State<KeyReset> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Color.fromARGB(255, 128, 128, 128),
      elevation: 5,
      height: 65,
      minWidth: 100,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: const Text(
        'AC',
        style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(122, 0, 0, 0)),
      ),
      onPressed: () {
        setState(() {
          currencyValue[0] = 0;
          currencyValue[1] = 0;
          counter = 0;
        });
        widget.callback();
      },
    );
  }
}
