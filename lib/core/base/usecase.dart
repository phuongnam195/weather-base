import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'failures.dart';

mixin UseCaseMixin {
  Future<Either<Failure, TDto>> handleRepoResult<TDto, TModel>({
    required Future<Either<Failure, TModel>> repoResult,
    required Future<TDto> Function(TModel model) onSuccess,
    Future<Failure> Function(Failure failure)? onError,
  }) async {
    Either<Failure, TModel> result = await repoResult;
    try {
      return result.fold(
        (l) async => Left(onError != null ? await onError(l) : l),
        (r) async => Right(await onSuccess(r)),
      );
    } catch (e) {
      return Left(Failure('$e'));
    }
  }
}

abstract class UseCase<Type, Params> with UseCaseMixin {
  Type call(Params param);
}

abstract class FutureUseCase<Type, Params> extends UseCase<Future<Type>, Params> {}

abstract class EitherUseCase<Type, Params> extends FutureUseCase<Either<Failure, Type>, Params> {}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
