import 'package:agenda_crud/app/database/sqlite/dao/contact_dao_impl.dart';
import 'package:agenda_crud/domain/interfaces/contact_dao.dart';
import 'package:agenda_crud/domain/services/contact_service.dart';
import 'package:get_it/get_it.dart';

setupInjection() {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<ContactDAO>(ContactDAOImpl());
  getIt.registerSingleton<ContactService>(ContactService());
}
