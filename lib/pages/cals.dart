import 'package:flutter/material.dart';

class CalculatePage extends StatefulWidget {
  const CalculatePage({super.key});

  @override
  State<CalculatePage> createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  var price = TextEditingController();
  var amount = TextEditingController();
  var change = TextEditingController();
  var getMoney = TextEditingController();

  double _total = 0;
  double _change = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Column(
            children: [
              Text(
                "Calculate Change",
                style: TextStyle(
                  fontFamily: "maa",
                  fontSize: 48,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  color: Colors.blue,
                  backgroundColor: Colors.greenAccent,
                ),
              ),

              Image.asset("assets/burger.png", height: 100),

              SizedBox(height: 20),

              Image.network(
                "https://d11a6trkgmumsb.cloudfront.net/original/3X/6/5/65137061474887dfa0f183f2bc118a3e52fc353e.gif",
                height: 60,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: priceTextField(),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: amountTextField(),
              ),

              calculateButton(),
              showTotalText(),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: receiveMoneyTextField(),
              ),

              changeCalculateBotton(),
              showChangeText(),
            ],
          ),
        ),
      ],
    );
  }

  Widget priceTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: price,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "price per item",
        ),
        keyboardType: TextInputType.numberWithOptions(),
      ),
    );
  }

  Widget amountTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: amount,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "amount of item",
        ),
        keyboardType: TextInputType.numberWithOptions(),
      ),
    );
  }

  Widget calculateButton() {
    return ElevatedButton(
      onPressed: () {
        if (price.text.isNotEmpty && amount.text.isNotEmpty) {
          setState(() {
            _total = double.parse(price.text) * double.parse(amount.text);
          });
        }
      },
      child: Text("Calculate Total "),
    );
  }

  Widget showTotalText() {
    return Text("Total: $_total Baht");
  }

  Widget receiveMoneyTextField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: getMoney,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "get money",
        ),
        keyboardType: TextInputType.numberWithOptions(),
      ),
    );
  }

  Widget changeCalculateBotton() {
    return ElevatedButton(
      onPressed: () {
        if (getMoney.text.isNotEmpty) {
          double _money = double.parse(getMoney.text);

          if (_money < _total) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("money is not enough")));
          }
          setState(() {
            _change = _money - _total;
          });
        }
      },
      child: Text("Change Calculate"),
    );
  }

  Widget showChangeText() {
    return Text("Change: $_change Baht");
  }
}
