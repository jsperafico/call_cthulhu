import 'package:call_cthulhu_app/models/investigator_model.dart';
import 'package:call_cthulhu_app/models/session/session_model.dart';
import 'package:call_cthulhu_app/models/session/session_notify_model.dart';
import 'package:call_cthulhu_app/models/user_model.dart';

class Api {
  static var usersModel = [
    UserModel(
      id: 'google',
      name: 'Rafael',
      lastActive: DateTime.now().subtract(
        Duration(days: 5),
      ),
    ),
    UserModel(
      id: 'facebook',
      name: 'Jonathan',
      lastActive: DateTime.now().subtract(
        Duration(days: 1),
      ),
    ),
    UserModel(
      id: 'google',
      name: 'Marcieli',
      lastActive: DateTime.now().subtract(
        Duration(days: 1),
      ),
    ),
    UserModel(
      id: 'google',
      name: 'Diego',
      lastActive: DateTime.now().subtract(
        Duration(hours: 2),
      ),
    ),
    UserModel(
      id: 'google',
      name: 'Fernando',
      lastActive: DateTime.now().subtract(
        Duration(hours: 3),
      ),
    ),
  ];

  static var investigatorsModel = [
    InvestigatorModel(
      user: usersModel.singleWhere((element) => element.name == 'Marcieli'),
      name: 'Dra. Parker',
    ),
    InvestigatorModel(
      user: usersModel.singleWhere((element) => element.name == 'Marcieli'),
      name: 'Luck',
    ),
    InvestigatorModel(
      user: usersModel.singleWhere((element) => element.name == 'Diego'),
      name: 'Peter',
    ),
    InvestigatorModel(
      user: usersModel.singleWhere((element) => element.name == 'Diego'),
      name: 'Julius',
    ),
    InvestigatorModel(
      user: usersModel.singleWhere((element) => element.name == 'Fernando'),
      name: 'Rock',
    ),
    InvestigatorModel(
      user: usersModel.singleWhere((element) => element.name == 'Fernando'),
      name: 'Brock',
    ),
    InvestigatorModel(
      user: usersModel.singleWhere((element) => element.name == 'Rafael'),
      name: 'Ted',
    ),
    InvestigatorModel(
      user: usersModel.singleWhere((element) => element.name == 'Rafael'),
      name: 'Bad',
    ),
    InvestigatorModel(
      user: usersModel.singleWhere((element) => element.name == 'Jonathan'),
      name: 'Usoop',
    ),
  ];

  static var sessionsModel = [
    SessionModel(
      title: 'Super Session Room',
      description: 'Call of Cthulhu considering World War II',
      keeper: usersModel.singleWhere((element) => element.name == 'Jonathan'),
      investigators: [
        investigatorsModel
            .singleWhere((element) => element.name == 'Dra. Parker'),
        investigatorsModel.singleWhere((element) => element.name == 'Julius'),
        investigatorsModel.singleWhere((element) => element.name == 'Rock'),
        investigatorsModel.singleWhere((element) => element.name == 'Bad'),
      ],
      scheduled: DateTime.now(),
    ),
    SessionModel(
      title: 'Amazing Session Room',
      description: 'Call of Cthulhu situated on Brazil',
      keeper: usersModel.singleWhere((element) => element.name == 'Jonathan'),
      investigators: [
        investigatorsModel.singleWhere((element) => element.name == 'Luck'),
        investigatorsModel.singleWhere((element) => element.name == 'Peter'),
        investigatorsModel.singleWhere((element) => element.name == 'Brock'),
        investigatorsModel.singleWhere((element) => element.name == 'Bad'),
      ],
      scheduled: DateTime.now().subtract(Duration(days: 2)),
    ),
    SessionModel(
      title: 'Lazy Session Room',
      description: 'Call of Cthulhu situated on London',
      keeper: usersModel.singleWhere((element) => element.name == 'Diego'),
      investigators: [
        investigatorsModel.singleWhere((element) => element.name == 'Luck'),
        investigatorsModel.singleWhere((element) => element.name == 'Brock'),
        investigatorsModel.singleWhere((element) => element.name == 'Ted'),
        investigatorsModel.singleWhere((element) => element.name == 'Usoop'),
      ],
      scheduled: DateTime.now().add(Duration(days: 5)),
    ),
    SessionModel(
      title: 'Powered Session Room',
      description: 'Call of Cthulhu situated on Mars',
      keeper: usersModel.singleWhere((element) => element.name == 'Marcieli'),
      investigators: [
        investigatorsModel.singleWhere((element) => element.name == 'Luck'),
        investigatorsModel.singleWhere((element) => element.name == 'Brock'),
        investigatorsModel.singleWhere((element) => element.name == 'Ted'),
        investigatorsModel.singleWhere((element) => element.name == 'Usoop'),
      ],
      scheduled: DateTime.now().add(Duration(days: 5)),
    ),
  ];

  static var sessionsNotifications = [
    SessionNotifyModel(
        session: sessionsModel[0],
        dateTime: DateTime.now(),
        owner: sessionsModel[0].keeper,
        target: sessionsModel[0].investigators[1],
        message:
            "You have received during town hall presentation an item. Please check you bag."),
    SessionNotifyModel(
        session: sessionsModel[1],
        dateTime: DateTime.now().subtract(Duration(days: 1)),
        owner: sessionsModel[1].investigators[1],
        target: sessionsModel[1].keeper,
        message: "Please Keeper I need more information."),
    SessionNotifyModel(
        session: sessionsModel[2],
        dateTime: DateTime.now().subtract(Duration(days: 5)),
        owner: sessionsModel[2].keeper,
        target: sessionsModel[2].investigators[1],
        message: "Please update your profile."),
  ];
}
