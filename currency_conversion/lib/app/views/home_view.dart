import 'package:currency_conversion/app/components/currency_box.dart';
import 'package:currency_conversion/app/controllers/home_controller.dart';
import 'package:currency_conversion/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeController homeController;
  final TextEditingController toText = TextEditingController();

  final TextEditingController fromText = TextEditingController();

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 100,
            left: 50,
            right: 50.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/logo.png',
                  height: 150,
                  width: 150,
                ),
                const SizedBox(height: 50),
                CurrencyBox(
                  cursorWidth: 2.0,
                  keyBoardType: TextInputType.number,
                  itemsList: homeController.currencies,
                  controller: toText,
                  onChanged: (CurrencyModel? model) {
                    setState(() {
                      homeController.toCurrency = model!;
                    });
                  },
                  selectedItem: homeController.toCurrency,
                ),
                const SizedBox(height: 10),
                CurrencyBox(
                  cursorWidth: 0,
                  keyBoardType: TextInputType.none,
                  itemsList: homeController.currencies,
                  controller: fromText,
                  selectedItem: homeController.fromCurrency,
                  onChanged: (CurrencyModel? model) {
                    setState(() {
                      homeController.fromCurrency = model!;
                    });
                  },
                ),
                const SizedBox(height: 50.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    onPrimary: Colors.black87,
                    minimumSize: const Size(163.0, 55.0),
                  ),
                  onPressed: () {
                    homeController.convert();

                    Future.delayed(const Duration(seconds: 2), () {
                      toText.clear();
                      fromText.clear();
                    });
                  },
                  child: const Text('CONVERTER'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    toText.dispose();
    fromText.dispose();
  }
}
