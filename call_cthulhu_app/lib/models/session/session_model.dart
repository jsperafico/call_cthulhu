import 'package:call_cthulhu_app/models/session/investigator_model.dart';
import 'package:call_cthulhu_app/models/session/user_model.dart';

class SessionModel {
  String title;
  String description;
  UserModel keeper;
  List<InvestigatorModel> investigators;

  SessionModel({this.keeper, this.title, this.description, this.investigators});

  addInvestigator(InvestigatorModel investigator) {
    if (this.investigators == null) {
      this.investigators = new List(5);
    }
    if (this.investigators.length < 5) {
      this.investigators.add(investigator);
    } else {
      //exception
    }
  }

  addInvestigators(List<InvestigatorModel> investigators) {
    if (this.investigators == null) {
      this.investigators = investigators;
    } else if (this.investigators.length + investigators.length  < 5) {
      this.investigators.addAll(investigators);
    } else {
      //exception
    }
  }
}