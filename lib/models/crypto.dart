class Crypto {
  String id;
  String name;
  String symbol;
  double changePercent24hr;
  double priceUsd;
  double marketCapUsd;
  int rank;
  String explorer;

  Crypto({
    required this.id,
    required this.name,
    required this.symbol,
    required this.changePercent24hr,
    required this.priceUsd,
    required this.marketCapUsd,
    required this.rank,
    required this.explorer,
  });

  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      explorer: json['explorer'],
      changePercent24hr: double.parse(json['changePercent24Hr']),
      priceUsd: double.parse(json['priceUsd']),
      marketCapUsd: double.parse(json['marketCapUsd']),
      rank: int.parse(json['rank']),
    );
  }
}
