// --- Day 22: Wizard Simulator 20XX ---
// https://adventofcode.com/2015/day/22

import 'dart:math';

import 'package:collection/collection.dart';

typedef State = ({
  int playerHitPoints,
  int playerManaPoints,
  //
  int bossHitPoints,
  int bossDamage,
  //
  int spendMana,
  //
  int shieldEffectTurns,
  int poisonEffectTurns,
  int rechargeEffectTurns,
  //
  bool playerTurn,
});

int solve({
  required int bossHitPoints,
  required int bossDamage,
  required bool hardMode,
}) {
  final queue =
      PriorityQueue<State>((a, b) => a.spendMana.compareTo(b.spendMana))..add((
        playerHitPoints: 50,
        playerManaPoints: 500,
        bossHitPoints: bossHitPoints,
        bossDamage: bossDamage,
        spendMana: 0,
        shieldEffectTurns: 0,
        poisonEffectTurns: 0,
        rechargeEffectTurns: 0,
        playerTurn: true,
      ));

  while (queue.isNotEmpty) {
    var (
      :playerHitPoints,
      :playerManaPoints,
      :bossHitPoints,
      :bossDamage,
      :spendMana,
      :shieldEffectTurns,
      :poisonEffectTurns,
      :rechargeEffectTurns,
      :playerTurn,
    ) = queue
        .removeFirst();

    if (hardMode && --playerHitPoints <= 0) {
      continue;
    }

    // Handle shield effect
    final int playerArmor;

    if (shieldEffectTurns > 0) {
      playerArmor = 7;
      shieldEffectTurns -= 1;
    } else {
      playerArmor = 0;
    }

    // Handle Poison effect
    if (poisonEffectTurns > 0) {
      bossHitPoints -= 3;
      poisonEffectTurns -= 1;
    }

    // Handle Recharge effect
    if (rechargeEffectTurns > 0) {
      playerManaPoints += 101;
      rechargeEffectTurns -= 1;
    }

    if (bossHitPoints <= 0) {
      // Boss dead
      return spendMana;
    }

    if (playerTurn) {
      // Player turn
      if (playerManaPoints < 53) {
        // Player lost because of not enough mana!
        continue;
      }

      // Cast Magic Missile
      if (playerManaPoints >= 53) {
        queue.add((
          playerHitPoints: playerHitPoints,
          playerManaPoints: playerManaPoints - 53,
          bossHitPoints: bossHitPoints - 4,
          bossDamage: bossDamage,
          spendMana: spendMana + 53,
          shieldEffectTurns: shieldEffectTurns,
          poisonEffectTurns: poisonEffectTurns,
          rechargeEffectTurns: rechargeEffectTurns,
          playerTurn: false,
        ));
      }

      // Cast Drain
      if (playerManaPoints >= 73) {
        queue.add((
          playerHitPoints: playerHitPoints + 2,
          playerManaPoints: playerManaPoints - 73,
          bossHitPoints: bossHitPoints - 2,
          bossDamage: bossDamage,
          spendMana: spendMana + 73,
          shieldEffectTurns: shieldEffectTurns,
          poisonEffectTurns: poisonEffectTurns,
          rechargeEffectTurns: rechargeEffectTurns,
          playerTurn: false,
        ));
      }

      // Cast Shield
      if (playerManaPoints >= 113 && shieldEffectTurns == 0) {
        queue.add((
          playerHitPoints: playerHitPoints,
          playerManaPoints: playerManaPoints - 113,
          bossHitPoints: bossHitPoints,
          bossDamage: bossDamage,
          spendMana: spendMana + 113,
          shieldEffectTurns: 6,
          poisonEffectTurns: poisonEffectTurns,
          rechargeEffectTurns: rechargeEffectTurns,
          playerTurn: false,
        ));
      }

      // Cast Poison
      if (playerManaPoints >= 173 && poisonEffectTurns == 0) {
        queue.add((
          playerHitPoints: playerHitPoints,
          playerManaPoints: playerManaPoints - 173,
          bossHitPoints: bossHitPoints,
          bossDamage: bossDamage,
          spendMana: spendMana + 173,
          shieldEffectTurns: shieldEffectTurns,
          poisonEffectTurns: 6,
          rechargeEffectTurns: rechargeEffectTurns,
          playerTurn: false,
        ));
      }

      // Cast Recharge
      if (playerManaPoints >= 229 && rechargeEffectTurns == 0) {
        queue.add((
          playerHitPoints: playerHitPoints,
          playerManaPoints: playerManaPoints - 229,
          bossHitPoints: bossHitPoints,
          bossDamage: bossDamage,
          spendMana: spendMana + 229,
          shieldEffectTurns: shieldEffectTurns,
          poisonEffectTurns: poisonEffectTurns,
          rechargeEffectTurns: 5,
          playerTurn: false,
        ));
      }
    } else {
      // Boss turn to attack
      if ((playerHitPoints -= max(bossDamage - playerArmor, 1)) <= 0) {
        // Player dead by boss attack
        continue;
      }

      queue.add((
        playerHitPoints: playerHitPoints,
        playerManaPoints: playerManaPoints,
        bossHitPoints: bossHitPoints,
        bossDamage: bossDamage,
        spendMana: spendMana,
        shieldEffectTurns: shieldEffectTurns,
        poisonEffectTurns: poisonEffectTurns,
        rechargeEffectTurns: rechargeEffectTurns,
        playerTurn: true,
      ));
    }
  }

  throw 'All attempts failed!';
}
