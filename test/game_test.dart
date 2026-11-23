import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_turkiye_illeri_ve_plakalar/oyun_turkiye_illeri_ve_plakalar.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(turkiyeIlleriConfig.title.length, 33);
    expect(turkiyeIlleriConfig.tagline.length, 33);
    for (final s in turkiyeIlleriConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(turkiyeIlleriConfig.gameId, turkiyeIlleriId);
    expect(turkiyeIlleriRules.gameId, turkiyeIlleriId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(turkiyeIlleriRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: turkiyeIlleriId, optionalMechanics: turkiyeIlleriRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(turkiyeIlleriRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
