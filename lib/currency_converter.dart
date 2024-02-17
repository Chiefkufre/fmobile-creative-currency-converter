import 'package:flutter/material.dart';

class CurrencyConverterHome extends StatefulWidget {
  const CurrencyConverterHome({super.key});

  @override
  State<CurrencyConverterHome> createState() => _CurrencyConverterHomeState();
}

class _CurrencyConverterHomeState extends State<CurrencyConverterHome> {
  final TextEditingController _controller = TextEditingController();

  String convertedRate = "0";

  var items = <double?>[];
  double conversionLogic() {
    double usdRate = 1513.78;
    try {
      double inputedValue = double.parse(_controller.text);
      double todayRate = inputedValue * usdRate;
      setState(() {
        convertedRate = todayRate.toStringAsFixed(3);
      });
      return todayRate;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Currency Converter",
          style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.headset_sharp),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.camera_alt_outlined),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.messenger_rounded,
              color: Colors.blueAccent,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              convertedRate,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            textInput(),
            textButton(),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: "Home"),
        NavigationDestination(icon: Icon(Icons.people), label: "My Network"),
        NavigationDestination(icon: Icon(Icons.post_add), label: "Post"),
        NavigationDestination(
            icon: Icon(Icons.notifications), label: "Notifications"),
        NavigationDestination(icon: Icon(Icons.work), label: "Jobs"),
      ]),
    );
  }

  Widget textInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.black),
        keyboardType: const TextInputType.numberWithOptions(
          decimal: true,
        ),
        // onSubmitted: (value) {
        //   conversionLogic(value);
        // },

        onChanged: (value) {
          setState(() {
            if (value.isEmpty) {
              convertedRate = '0';
            }
            _controller.text = value;
          });
        },
        decoration: InputDecoration(
          hintText: "Enter Amount in Naira",
          hintStyle: const TextStyle(color: Colors.blueGrey),
          prefixIcon: const Icon(Icons.monetization_on_rounded),
          prefixIconColor: Colors.blue,
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget textButton() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextButton(
        style: TextButton.styleFrom(
          elevation: 50,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 50),
          shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
        ),
        child: const Text(
          'convert',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          conversionLogic();
        },
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      primary: true,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text("ShopiMart"),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          tooltip: 'Open shopping cart',
          onPressed: () {
            // handle the press
          },
        ),
        IconButton(
          icon: const Icon(Icons.notifications),
          tooltip: 'Open shopping cart',
          onPressed: () {
            // handle the press
          },
        ),
        IconButton(
          icon: const Icon(Icons.search),
          tooltip: 'Open shopping cart',
          onPressed: () {
            // handle the press
          },
        ),
      ],
    );
  }
}
