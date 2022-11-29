import 'package:calculator_tip/widgets/small_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _billAmount = 0;
  int _tipPercentage = 0;
  int _personCounter = 1;
  final double _tipAmount = 0.0;

  double calculateTotalofPerson(
      double totalTip, double billAmount, int personCounter) {
    return (totalTip + billAmount) / personCounter;
  }

  double calculateTotalTip(double billAmount, int tipPercentage) {
    if (billAmount < 0) {
      return 0;
    }
    return (billAmount * tipPercentage) / 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.height * 0.03,
            vertical: MediaQuery.of(context).size.height * 0.10,
          ),
          scrollDirection: Axis.vertical,
          children: [
            Container(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.03),
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.purple.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Total Per Person',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        color: Colors.purple),
                  ),
                  Text(
                    '\$${calculateTotalofPerson(calculateTotalTip(_billAmount, _tipPercentage), _billAmount, _personCounter).toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.43,
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height * 0.02,
                  vertical: MediaQuery.of(context).size.height * 0.04),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.blueGrey.shade100),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    style: const TextStyle(color: Colors.purple),
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      prefixText: 'Bill Amount',
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    },
                    onChanged: (value) {
                      try {
                        _billAmount = double.parse(value);
                      } catch (e) {
                        _billAmount = 0.0;
                        rethrow;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Split',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallButton(
                            text: '-',
                            fun: () {
                              setState(() {
                                if (_personCounter <= 1) {
                                  return;
                                }
                                _personCounter--;
                              });
                            },
                          ),
                          Text(
                            '$_personCounter',
                            style: const TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                          SmallButton(
                            text: '+',
                            fun: () {
                              setState(() {
                                if (_personCounter >= 10) {
                                  return;
                                }
                                _personCounter++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tip',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          '\$${calculateTotalTip(_billAmount, _tipPercentage).toStringAsFixed(2)}',
                          style: const TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '$_tipPercentage %',
                        style: const TextStyle(
                            color: Colors.purple,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      Slider(
                        min: 0,
                        max: 100,
                        divisions: 10,
                        activeColor: Colors.purple,
                        inactiveColor: Colors.grey,
                        value: _tipPercentage.toDouble(),
                        onChanged: (value) {
                          setState(() {
                            _tipPercentage = value.round();
                          });
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomPart extends StatelessWidget {
  const BottomPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TopPart extends StatelessWidget {
  const TopPart({
    super.key,
    required double tipAmount,
  }) : _tipAmount = tipAmount;

  final double _tipAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.03),
      height: MediaQuery.of(context).size.height * 0.25,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.purple.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Total Per Person',
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.normal,
                color: Colors.purple),
          ),
          Text(
            '\$$_tipAmount',
            style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.purple),
          ),
        ],
      ),
    );
  }
}
