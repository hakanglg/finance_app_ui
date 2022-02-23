class User {
  final int wallet;
  final int dailyActiviy;
  final int income;
  final int expense;
  final String name;
  final String image;

  User(
      {required this.wallet,
      required this.dailyActiviy,
      required this.income,
      required this.expense,
      required this.name,
      required this.image});
}

List<User> users = [
  User(
      wallet: 23456,
      dailyActiviy: 4321,
      income: 1234,
      expense: 345,
      name: "Aziz Nesin",
      image: "assets/images/ic_1.png"),
  User(
      wallet: 246676,
      dailyActiviy: 21321,
      income: 1234,
      expense: 345,
      name: "Hina Holmes",
      image: "assets/images/ic_2.png"),
  User(
      wallet: 342544,
      dailyActiviy: 3125321,
      income: 1231534,
      expense: 35645,
      name: "Isha Samuels",
      image: "assets/images/ic_3.png"),
  User(
      wallet: 423123,
      dailyActiviy: 4351221,
      income: 23125,
      expense: 6789,
      name: "Arya Cunningham",
      image: "assets/images/ic_4.png"),
];
