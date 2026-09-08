import 'package:flutter/material.dart';
import 'package:nour_store/core/languages/locale_cubit.dart';
import 'package:nour_store/core/utilies/di.dart';
import 'package:nour_store/features/app/nour_stoure_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.setup();
  await getIt<LocaleCubit>().load();
  runApp(const NourStoreApp());
}
