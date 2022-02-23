
class User {
  final int wallet, dailyActiviy, income, expense;
  final double percent;
  final String name, image;

  User({
    required this.percent,
    required this.wallet,
    required this.dailyActiviy,
    required this.income,
    required this.expense,
    required this.name,
    required this.image,
  });
}

List<User> users = [
  User(
    percent: 0.6,
    wallet: 23456,
    dailyActiviy: 4321,
    income: 1234,
    expense: 345,
    name: "Aziz Nesin",
    image: "assets/images/ic_1.png",
  ),
  User(
      percent: 0.7,
      wallet: 246676,
      dailyActiviy: 21321,
      income: 1234,
      expense: 345,
      name: "Hina Holmes",
      image: "assets/images/ic_2.png"),
  User(
      percent: 0.8,
      wallet: 342544,
      dailyActiviy: 31251,
      income: 121534,
      expense: 35645,
      name: "Isha Samuels",
      image: "assets/images/ic_3.png"),
];
