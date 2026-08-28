sealed class LocaleState {
  const LocaleState();
}

class LocaleInitial extends LocaleState {
  const LocaleInitial();
}

class LocaleLoaded extends LocaleState {
  const LocaleLoaded(this.languageCode);

  final String languageCode;
}
