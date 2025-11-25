import "package:project_h/app/_provider/member_provider.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

part "app_startup_provider.g.dart";

enum AppStartupState {
  loading,
  dataReady,
  error,
}

@riverpod
AsyncValue<AppStartupState> appStartup(Ref ref) {
  var membersAsyncValue = ref.watch(membersStreamProvider);

  if (membersAsyncValue.hasError) {
    return AsyncError(membersAsyncValue.error!, membersAsyncValue.stackTrace!);
  }

  if (membersAsyncValue.isLoading) {
    return const AsyncLoading();
  }

  return const AsyncData(AppStartupState.dataReady);
}
