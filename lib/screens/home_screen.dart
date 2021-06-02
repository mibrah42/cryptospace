import 'package:cryptospace/models/crypto.dart';
import 'package:cryptospace/utilities/constants.dart';
import 'package:cryptospace/utilities/helpers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static final String id = "home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Crypto> _cryptos = [];
  bool _loading = false;

  Future<void> _fetchCryptos() async {
    try {
      setState(() {
        _loading = true;
      });
      final response = await Dio().get("https://$baseUrl$cryptosPath");
      List<Crypto> data = response.data['data']
          .map(
            (item) {
              return Crypto.fromJson(item);
            },
          )
          .toList()
          .cast<Crypto>();

      setState(() {
        _cryptos = data;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to fetch cryptos'),
        ),
      );
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchCryptos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CryptoSpace',
          style: TextStyle(
            color: kGreenColor,
          ),
        ),
        elevation: 0,
        backgroundColor: kBlackColor,
        centerTitle: false,
        bottom: PreferredSize(
          child: Container(
            color: Colors.grey[400],
            height: 0.1,
          ),
          preferredSize: Size.fromHeight(0.1),
        ),
      ),
      backgroundColor: kBlackColor,
      body: _loading
          ? Container(
              color: kBlackColor,
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    kGreenColor,
                  ),
                ),
              ),
            )
          : ListView.builder(
              itemCount: _cryptos.length,
              itemBuilder: (context, index) {
                final crypto = _cryptos[index];
                return ListTile(
                  title: Text(
                    crypto.name,
                    style: TextStyle(color: kGreenColor),
                  ),
                  subtitle: Text(
                    crypto.symbol,
                    style: TextStyle(color: kGreyColor),
                  ),
                  leading: SizedBox(
                      width: 30.0,
                      child: Center(
                          child: Text(
                        crypto.rank.toString(),
                        style: TextStyle(color: kGreyColor),
                      ))),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${crypto.priceUsd.toStringAsFixed(2)} USD",
                        style: TextStyle(color: kGreyColor),
                      ),
                      SizedBox(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            getPrefixIcon(crypto.changePercent24hr),
                            Text(
                              crypto.changePercent24hr.toStringAsFixed(2),
                              style: TextStyle(
                                color: crypto.changePercent24hr > 0
                                    ? kGreenColor
                                    : kRedColor,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
