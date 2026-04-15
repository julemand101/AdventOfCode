// --- Day 21: RPG Simulator 20XX ---
// https://adventofcode.com/2015/day/21

import 'dart:math';

enum Winner { player, boss }

typedef Stats = ({int hitPoints, int damage, int armor});
typedef Item = ({String name, int cost, int damage, int armor});
typedef Build = ({Item weapon, Item? armor, Item? ring1, Item? ring2});

extension on Build {
  int get cost =>
      this.weapon.cost +
      (this.armor?.cost ?? 0) +
      (this.ring1?.cost ?? 0) +
      (this.ring2?.cost ?? 0);

  Stats getStats(int playerHitPoints) => (
    hitPoints: playerHitPoints,
    damage:
        this.weapon.damage +
        (this.ring1?.damage ?? 0) +
        (this.ring2?.damage ?? 0),
    armor:
        (this.armor?.armor ?? 0) +
        (this.ring1?.armor ?? 0) +
        (this.ring2?.armor ?? 0),
  );
}

const weapons = <Item>[
  (name: 'Dagger', cost: 8, damage: 4, armor: 0),
  (name: 'Shortsword', cost: 10, damage: 5, armor: 0),
  (name: 'Warhammer', cost: 25, damage: 6, armor: 0),
  (name: 'Longsword', cost: 40, damage: 7, armor: 0),
  (name: 'Greataxe', cost: 74, damage: 8, armor: 0),
];

const armor = <Item>[
  (name: 'Leather', cost: 13, damage: 0, armor: 1),
  (name: 'Chainmail', cost: 31, damage: 0, armor: 2),
  (name: 'Splintmail', cost: 53, damage: 0, armor: 3),
  (name: 'Bandedmail', cost: 75, damage: 0, armor: 4),
  (name: 'Platemail', cost: 102, damage: 0, armor: 5),
];

const rings = <Item>[
  (name: 'Damage +1', cost: 25, damage: 1, armor: 0),
  (name: 'Damage +2', cost: 50, damage: 2, armor: 0),
  (name: 'Damage +3', cost: 100, damage: 3, armor: 0),
  (name: 'Defense +1', cost: 20, damage: 0, armor: 1),
  (name: 'Defense +2', cost: 40, damage: 0, armor: 2),
  (name: 'Defense +3', cost: 80, damage: 0, armor: 3),
];

int solveA({required Stats boss}) {
  int? lowestCost;

  for (final build in builds) {
    if (fight(player: build.getStats(100), boss: boss) == .player) {
      if (lowestCost == null) {
        lowestCost = build.cost;
      } else {
        lowestCost = min(lowestCost, build.cost);
      }
    }
  }

  return lowestCost!;
}

int solveB({required Stats boss}) {
  int? highestCost;

  for (final build in builds) {
    if (fight(player: build.getStats(100), boss: boss) == .boss) {
      if (highestCost == null) {
        highestCost = build.cost;
      } else {
        highestCost = max(highestCost, build.cost);
      }
    }
  }

  return highestCost!;
}

Iterable<Build> get builds sync* {
  for (final weapon in weapons) {
    yield (weapon: weapon, armor: null, ring1: null, ring2: null);

    for (final ring in rings) {
      yield (weapon: weapon, armor: null, ring1: ring, ring2: null);
    }

    for (final (i, ring1) in rings.indexed) {
      for (final ring2 in rings.skip(i + 1)) {
        yield (weapon: weapon, armor: null, ring1: ring1, ring2: ring2);
      }
    }

    for (final armor in armor) {
      yield (weapon: weapon, armor: armor, ring1: null, ring2: null);

      for (final ring in rings) {
        yield (weapon: weapon, armor: armor, ring1: ring, ring2: null);
      }

      for (final (i, ring1) in rings.indexed) {
        for (final ring2 in rings.skip(i + 1)) {
          yield (weapon: weapon, armor: armor, ring1: ring1, ring2: ring2);
        }
      }
    }
  }
}

Winner fight({required Stats player, required Stats boss}) {
  var playerHealth = player.hitPoints;
  var bossHealth = boss.hitPoints;
  var playerAttacking = true;

  while (playerHealth > 0 && bossHealth > 0) {
    if (playerAttacking) {
      bossHealth -= max(player.damage - boss.armor, 1);
      playerAttacking = false;
    } else {
      playerHealth -= max(boss.damage - player.armor, 1);
      playerAttacking = true;
    }
  }

  return playerHealth <= 0 ? .boss : .player;
}
