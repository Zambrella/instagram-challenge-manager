import 'package:instagram_challenge_manager/challenge/domain/prize.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'challenge_prizes_controller.g.dart';

@Riverpod(keepAlive: true)
class ChallengePrizesController extends _$ChallengePrizesController {
  @override
  List<Prize> build() {
    return [];
  }

  void addPrize(Prize prize) {
    final prizes = state;
    // ignore: cascade_invocations
    prizes.add(prize);
    state = prizes;
  }

  void removePrize(Prize prize) {
    final prizes = state;
    // ignore: cascade_invocations
    prizes.remove(prize);
    state = prizes;
  }
}
