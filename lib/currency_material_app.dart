import 'package:flutter/material.dart';

class CurrencyMaterialPage extends StatefulWidget {
  const CurrencyMaterialPage({Key? key}) : super(key: key);

  @override
  State<CurrencyMaterialPage> createState() => _CurrencyMaterialPageState();
}

class _CurrencyMaterialPageState extends State<CurrencyMaterialPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  double result = 0;
  final TextEditingController textEditingController = TextEditingController();
  bool isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500), // Adjust the duration as needed
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Rebuilt");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor:
              isDarkMode ? Colors.grey.shade900 : Colors.grey[50],
          title: Text(
            "Currency converter",
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          actions: [
            IconButton(
              onPressed: _toggleTheme,
              icon: Icon(
                isDarkMode ? Icons.light_mode : Icons.dark_mode,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Opacity(
                    opacity: _animation.value,
                    child: Text(
                      "INR ${result!=0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: textEditingController,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    hintText: "Please enter the amount in USD",
                    hintStyle: TextStyle(color:Colors.black),
                    prefixIcon: Icon(Icons.monetization_on_sharp),
                    prefixIconColor: Colors.black,
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  cursorColor: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    result =
                        double.parse(textEditingController.text) * 83.12;
                    _animationController.forward(from: 0);
                  });
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(7),
                  backgroundColor: MaterialStateProperty.all(
                    isDarkMode ? Colors.white : Colors.black,
                  ),
                  foregroundColor: MaterialStateProperty.all(
                    isDarkMode ? Colors.black : Colors.white,
                  ),
                  fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                ),
                child: const Text("Convert"),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: isDarkMode ? Colors.grey.shade900 : Colors.grey[50],
          child: SizedBox(
            height: 30.0,
            child: Center(
              child: Text(
                'Made by Ayush Jain  🚀',
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//                               13:01:00