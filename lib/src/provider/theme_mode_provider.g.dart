// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_mode_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SteveThemeMode)
const steveThemeModeProvider = SteveThemeModeProvider._();

final class SteveThemeModeProvider
    extends $NotifierProvider<SteveThemeMode, ThemeMode> {
  const SteveThemeModeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'steveThemeModeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$steveThemeModeHash();

  @$internal
  @override
  SteveThemeMode create() => SteveThemeMode();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeMode>(value),
    );
  }
}

String _$steveThemeModeHash() => r'91a4918c7ebf083a69f62dd46cb4a6c68a9952ba';

abstract class _$SteveThemeMode extends $Notifier<ThemeMode> {
  ThemeMode build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ThemeMode, ThemeMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ThemeMode, ThemeMode>,
              ThemeMode,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
