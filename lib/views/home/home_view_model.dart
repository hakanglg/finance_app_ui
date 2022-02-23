import 'package:flutter/material.dart';

import '../../model/users_model.dart';
import '../details/details_view.dart';

class HomeViewModel {
  void goDetail(BuildContext context, int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsView(user: users[index],),
        ));
  }
}
