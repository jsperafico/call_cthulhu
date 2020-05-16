import 'package:call_cthulhu_app/models/session/session_model.dart';

class SessionNotifyModel {
  SessionModel session;
  Object owner;
  Object target;
  String message;
  DateTime dateTime;

  SessionNotifyModel({this.session, this.owner, this.target, this.message, this.dateTime});
}