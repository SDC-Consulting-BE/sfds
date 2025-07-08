// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locale_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(SteveLocale)
const steveLocaleProvider = SteveLocaleFamily._();

final class SteveLocaleProvider extends $NotifierProvider<SteveLocale, Locale> {
  const SteveLocaleProvider._({
    required SteveLocaleFamily super.from,
    required SteveAppI18n super.argument,
  }) : super(
         retry: null,
         name: r'steveLocaleProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$steveLocaleHash();

  @override
  String toString() {
    return r'steveLocaleProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SteveLocale create() => SteveLocale();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Locale value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Locale>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SteveLocaleProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$steveLocaleHash() => r'210cb9f5e35291825df5ae234e1df7b54d1fa828';

final class SteveLocaleFamily extends $Family with $ClassFamilyOverride<SteveLocale, Locale, Locale, Locale, SteveAppI18n> {
  const SteveLocaleFamily._()
    : super(
        retry: null,
        name: r'steveLocaleProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SteveLocaleProvider call(SteveAppI18n i18n) => SteveLocaleProvider._(argument: i18n, from: this);

  @override
  String toString() => r'steveLocaleProvider';
}

abstract class _$SteveLocale extends $Notifier<Locale> {
  late final _$args = ref.$arg as SteveAppI18n;
  SteveAppI18n get i18n => _$args;

  Locale build(SteveAppI18n i18n);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<Locale, Locale>;
    final element = ref.element as $ClassProviderElement<AnyNotifier<Locale, Locale>, Locale, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
