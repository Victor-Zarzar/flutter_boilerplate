import 'package:flutter_boilerplate/app/shared/helpers/show_toast.dart';
import 'package:flutter_boilerplate/app/shared/services/internet_connection.dart';
import 'package:flutter_boilerplate/app/shared/utils/error_handler.dart';
import 'package:flutter_boilerplate/app/shared/utils/failure.dart';
import 'package:flutter_boilerplate/app/shared/utils/logger.dart';
import 'package:flutter_boilerplate/app/shared/utils/typdefs.dart';
import 'package:fpdart/fpdart.dart';

FutureEither<T> runTask<T>(
  Future<T> Function() action, {
  bool requiresNetwork = false,
}) async {
  if (requiresNetwork) {
    final hasNetwork = await InternetConnectionService().hasConnection();

    if (!hasNetwork) {
      AppLogger.warning('Network unavailable for task');
      showGlobalToast(
        message:
            'No internet connection. Please check your connection and try again.',
        status: 'warning',
      );
      return left(
        const NetworkFailure(
          'No internet connection. Please check your connection and try again.',
        ),
      );
    }
  }

  try {
    final result = await action();
    return right(result);
  } catch (error, stackTrace) {
    AppLogger.error('Task execution failed $error', [error, stackTrace]);
    final errorMessage = AppErrorHandler.format(error);

    return left(ServerFailure(errorMessage, error: error));
  }
}
