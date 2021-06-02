import 'package:cryptospace/models/crypto.dart';
import 'package:cryptospace/utilities/helpers.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Crypto crypto;

  DetailScreen({
    required this.crypto,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        title: Row(
          children: [
            getPrefixIcon(
              crypto.changePercent24hr,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            Text(
              crypto.name,
              style: TextStyle(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              title: Text(
                'RANK',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              subtitle: Text(
                crypto.rank.toString(),
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            ListTile(
              title: Text(
                'NAME',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              subtitle: Text(
                crypto.name,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            ListTile(
              title: Text(
                'SYMBOL',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              subtitle: Text(
                crypto.symbol,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            ListTile(
              title: Text(
                'PRICE',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              subtitle: Text(
                "${crypto.priceUsd.toStringAsFixed(2)} USD",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            ListTile(
              title: Text(
                'PERCENT CHANGE (24hr)',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              subtitle: Text(
                "${crypto.changePercent24hr.toStringAsFixed(2)}%",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            ListTile(
              title: Text(
                'MARKET CAP',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              subtitle: Text(
                "${crypto.marketCapUsd.toStringAsFixed(2)} USD",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
