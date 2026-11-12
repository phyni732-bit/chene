#!/usr/bin/env python3
"""Generates the cutscene datapack functions (data/cutscene/function).

Edit the script / shots in `build_timeline()` and run:  python3 tools/build.py
"""
import json
import math
import random
import shutil
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
OUT = ROOT / "data" / "cutscene" / "function"
NS = "cutscene"

V = "@a[tag=cs.viewer]"
CAM = "@e[type=item_display,tag=cs.cam,limit=1]"
ORIGIN = "@e[type=marker,tag=cs.origin,limit=1]"
VIL = "@e[type=villager,tag=cs.villager,limit=1]"
ZOM = "@e[type=zombie,tag=cs.zombie,limit=1]"

STAGE_Y = 230          # absolute height of the stage (above the cloud layer)
START_TIME = 12550     # sunset; the scene drifts into night
CAM_SMOOTH = 10        # client-side interpolation ticks of the camera entity
BUCKET = 40

rng = random.Random(7)
events = defaultdict(list)


def at(t, *cmds):
    events[int(t)].extend(cmds)


def num(v):
    s = f"{v:.3f}".rstrip("0").rstrip(".")
    return "0" if s in ("-0", "") else s


def rel(x, y, z):
    return f"~{num(x)} ~{num(y)} ~{num(z)}"


# ---------------------------------------------------------------- camera

def look(pos, target):
    dx, dy, dz = (target[i] - pos[i] for i in range(3))
    yaw = -math.degrees(math.atan2(dx, dz))
    pitch = -math.degrees(math.atan2(dy, math.hypot(dx, dz)))
    return yaw, pitch


def shot(t, dur, p0, l0, p1, l1, ease=True, cut=True):
    """Moves the camera from p0 (looking at l0) to p1 (looking at l1) in `dur` ticks."""
    y0, x0 = look(p0, l0)
    y1, x1 = look(p1, l1)
    while y1 - y0 > 180:
        y1 -= 360
    while y1 - y0 < -180:
        y1 += 360
    vals = {
        "ax": p0[0] * 1000, "ay": p0[1] * 1000, "az": p0[2] * 1000, "aw": y0 * 100, "ap": x0 * 100,
        "bx": p1[0] * 1000, "by": p1[1] * 1000, "bz": p1[2] * 1000, "bw": y1 * 100, "bp": x1 * 100,
        "cn": dur, "ct": 0, "lin": 0 if ease else 1,
    }
    if cut:
        # A hard cut: disable interpolation one tick early, restore it right after.
        at(t - 1, f"data modify entity {CAM} teleport_duration set value 0")
        at(t + 1, f"data modify entity {CAM} teleport_duration set value {CAM_SMOOTH}")
    at(t, *[f"scoreboard players set #{k} cs.v {round(v)}" for k, v in vals.items()])


def drift(t, dur, pos, target, move):
    """A hard cut to a slowly drifting shot that keeps moving past `dur`."""
    dur += 30
    p1 = tuple(pos[i] + move[i] * dur / 20 for i in range(3))
    shot(t, dur, pos, target, p1, target, ease=False)


# ---------------------------------------------------------------- blocks

IDENTITY = ("{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],"
            "translation:[0f,0f,0f],scale:[1f,1f,1f]}")
FX = {"rise": (0.5, -3, 0.5), "fall": (0.5, 4, 0.5), "north": (0.5, 0.5, -3), "south": (0.5, 0.5, 3)}


def block(t, pos, name, props=None, group="platform", fx="rise", extra_tags=()):
    state = f'Name:"minecraft:{name}"'
    if props:
        state += ",Properties:{" + ",".join(f'{k}:"{v}"' for k, v in props.items()) + "}"
    tags = ["cs.e", "cs.b", "cs.grow", f"cs.g.{group}", *extra_tags]
    tr = FX[fx]
    nbt = ("{Tags:[" + ",".join(f'"{x}"' for x in tags) + "],view_range:4f,"
           f"block_state:{{{state}}},"
           "transformation:{left_rotation:[0f,0.707f,0f,0.707f],right_rotation:[0f,0f,0f,1f],"
           f"translation:[{num(tr[0])}f,{num(tr[1])}f,{num(tr[2])}f],scale:[0.01f,0.01f,0.01f]}}}}")
    at(t, f"summon minecraft:block_display {rel(*pos)} {nbt}")


LIGHTS = []


def light(t, pos, level):
    LIGHTS.append(pos)
    p = rel(*pos)
    at(t, f"execute if block {p} minecraft:air run setblock {p} minecraft:light[level={level}]")


def sound(t, name, pos=(0, 1, 0), vol=3.0, pitch=1.0, channel="master"):
    at(t, f"playsound minecraft:{name} {channel} {V} {rel(*pos)} {num(vol)} {num(pitch)}")


def sound_ui(t, name, vol=0.5, pitch=1.0):
    at(t, f"execute as {V} at @s run playsound minecraft:{name} master @s ~ ~ ~ {num(vol)} {num(pitch)}")


def particle(t, name, pos, spread, speed, count):
    at(t, f"particle minecraft:{name} {rel(*pos)} {' '.join(num(s) for s in spread)} {num(speed)} {count} force {V}")


def build_platform(t0):
    R = 4.7
    last = t0
    layers = [(-1, R, ["grass_block"]), (-2, R - 1.2, ["dirt", "dirt", "coarse_dirt"]),
              (-3, R - 2.3, ["stone", "stone", "andesite"]), (-4, R - 3.4, ["stone", "cobblestone"])]
    top = []
    for depth, (y, r, mats) in enumerate(layers):
        for i in range(-6, 6):
            for k in range(-6, 6):
                d = math.hypot(i + 0.5, k + 0.5)
                if d > r:
                    continue
                t = t0 + depth * 12 + d * 7 + rng.randint(0, 6)
                block(t, (i, y, k), rng.choice(mats))
                last = max(last, t)
                if y == -1:
                    top.append((i, k, t))
    block(t0 + 60, (-1, -5, -1), "pointed_dripstone", {"vertical_direction": "down", "thickness": "frustum"})
    block(t0 + 64, (-1, -6, -1), "pointed_dripstone", {"vertical_direction": "down", "thickness": "tip"})
    block(t0 + 62, (0, -5, 0), "pointed_dripstone", {"vertical_direction": "down", "thickness": "tip"})
    # flowers, kept away from the line between the actors
    free = [c for c in top if not (abs(c[1] + 0.5) < 1.6 and abs(c[0] + 0.5) < 4) and (c[0], c[1]) not in ((-2, -3), (1, 2))]
    for i, k, t in rng.sample(free, 9):
        block(t + 14, (i, 0, k), rng.choice(["poppy", "dandelion", "azure_bluet", "oxeye_daisy", "short_grass", "short_grass"]), fx="fall")
    for (i, k) in ((-2, -3), (1, 2)):
        block(last + 8, (i, 0, k), "lantern", {"hanging": "false"}, fx="fall")
        light(last + 26, (i, 0, k), 12)
    for n in range(0, int(last - t0), 5):
        sound(t0 + n, "block.amethyst_block.chime", (0, 0, 0), 4, 0.6 + 0.05 * (n % 7))
    return last + 26


def build_door(t0):
    for y, half in ((0, "lower"), (1, "upper")):
        block(t0 + y * 5, (-0.09, y, -0.5), "oak_door",
              {"facing": "east", "half": half, "hinge": "left", "open": "false"},
              group="door", fx="fall", extra_tags=("cs.door",))
    sound(t0 + 16, "block.wood.place", (0, 1, 0), 3, 0.7)
    particle(t0 + 16, "cloud", (0, 0.1, 0), (0.2, 0.05, 0.4), 0.02, 12)
    return t0 + 24


def build_house(t0):
    """5x5 hut west of the island, its window facing the sunset."""
    def put(t, i, y, k, name, props=None, fx="rise"):
        block(t, (i, y, k - 0.5), name, props, group="house", fx=fx)
    last = t0
    xs, ks = range(-14, -9), range(-2, 3)
    for i in xs:
        for k in ks:
            put(t0 + (i + 14) * 3 + (k + 2) * 2, i, -1, k, rng.choice(["spruce_planks", "spruce_planks", "oak_planks"]))
    for y in range(0, 3):
        for i in xs:
            for k in ks:
                edge_x, edge_k = i in (-14, -10), k in (-2, 2)
                if not (edge_x or edge_k):
                    continue
                if i == -10 and k == 0 and y < 2:
                    continue  # doorway towards the island
                t = t0 + 22 + y * 14 + rng.randint(0, 9)
                if edge_x and edge_k:
                    put(t, i, y, k, "oak_log", {"axis": "y"})
                elif y == 1 and (k == 0 or i == -12):
                    put(t, i, y, k, "glass")
                else:
                    put(t, i, y, k, "oak_planks")
                last = max(last, t)
    for step, y in enumerate((3, 4, 5)):
        lo, hi = -14 + step, -10 - step
        for i in range(lo, hi + 1):
            for k in range(-2 + step, 3 - step):
                if i in (lo, hi) or k in (-2 + step, 2 - step):
                    t = t0 + 66 + step * 10 + rng.randint(0, 7)
                    put(t, i, y, k, "dark_oak_planks", fx="fall")
                    last = max(last, t)
    put(last + 4, -12, 0, 0, "lantern", {"hanging": "false"}, fx="fall")
    for n in range(0, int(last - t0), 6):
        sound(t0 + n, "block.wood.place", (-12, 1, 0), 4, 0.8 + 0.06 * (n % 5))
    light(last + 24, (-12, 1, 0), 14)
    sound(last + 24, "block.respawn_anchor.charge", (-12, 1, 0), 4, 1.4)
    particle(last + 24, "end_rod", (-12, 1.5, 0), (1.5, 1, 1.5), 0.02, 30)
    return last + 24


def build_tower(t0):
    """Bell tower north of the island."""
    def put(t, i, y, k, name, props=None, fx="fall"):
        block(t, (i - 0.5, y, k), name, props, group="tower", fx=fx)
    last = t0
    ring = [(-1, -12), (0, -12), (1, -12), (1, -11), (1, -10), (0, -10), (-1, -10), (-1, -11)]
    bricks = ["stone_bricks"] * 5 + ["mossy_stone_bricks", "cracked_stone_bricks"]
    put(t0, 0, -1, -11, "stone_bricks", fx="rise")
    for y in range(-1, 6):
        for n, (i, k) in enumerate(ring):
            t = t0 + (y + 1) * 9 + n
            put(t, i, y, k, rng.choice(bricks), fx="rise")
            last = max(last, t)
    for (i, k) in ((-1, -12), (1, -12), (1, -10), (-1, -10)):
        put(last + 6, i, 6, k, "stone_brick_wall")
    put(last + 10, 0, 6, -11, "gold_block")
    for i in (-1, 0, 1):
        for k in (-12, -11, -10):
            put(last + 16 + rng.randint(0, 5), i, 7, k, "stone_brick_slab", {"type": "bottom"})
    put(last + 26, 0, 7.5, -11, "lightning_rod", {"facing": "up"})
    for n in range(0, int(last - t0), 6):
        sound(t0 + n, "block.stone.place", (0, 3, -11), 4, 0.7 + 0.05 * (n % 5))
    end = last + 46
    light(end, (0, 6, -9), 13)
    for n, pitch in enumerate((1.0, 0.8, 0.67)):
        sound(end + n * 22, "block.bell.use", (0, 6, -11), 5, pitch)
    sound(end, "block.bell.resonate", (0, 6, -11), 5, 1)
    particle(end, "end_rod", (0, 6.5, -10.5), (1, 0.6, 1), 0.03, 25)
    return end


STAIR_STEPS = 22


def build_stairs(t0):
    """A staircase climbing east, towards the rising moon."""
    pent = [0, 2, 4, 7, 9, 12, 14, 16, 19, 21, 24]
    for s in range(STAIR_STEPS):
        t = t0 + s * 3
        for k, fx in ((-1, "north"), (0, "south")):
            block(t, (6 + s, s, k), "quartz_stairs", {"facing": "east", "half": "bottom"}, group="stairs", fx=fx)
        sound(t + 10, "block.note_block.chime", (6 + s, s + 1, 0), 6, 0.5 * 2 ** (pent[s // 2] / 12))
        particle(t + 14, "end_rod", (6.5 + s, s + 1, 0), (0.2, 0.2, 0.7), 0.01, 3)
    return t0 + STAIR_STEPS * 3 + 18


# ---------------------------------------------------------------- dialogue

ACTORS = {
    "v": dict(name="Житель", color="gold", sel=VIL, yaw=-90, blip="block.wooden_button.click_on",
              blip_pitch=1.5, voice="entity.villager.ambient"),
    "z": dict(name="Зомби", color="dark_green", sel=ZOM, yaw=90, blip="block.stone_button.click_on",
              blip_pitch=0.6, voice="entity.zombie.ambient"),
}


def subtitle(who, text):
    a = ACTORS[who]
    comp = [{"text": ""}, {"text": a["name"], "color": a["color"], "bold": True},
            {"text": "  »  ", "color": "dark_gray"}, {"text": text, "color": "white"}]
    return f"title {V} actionbar " + json.dumps(comp, ensure_ascii=False, separators=(",", ":"))


def say(t, who, text, voice=None, hold=None):
    """Typewriter subtitle with blips and a talking nod. Returns the tick the line ends."""
    a = ACTORS[who]
    sound_ui(t, voice or a["voice"], 0.9, 1.0)
    n = len(text)
    for i in range(1, n + 1):
        if text[i - 1] == " ":
            continue
        at(t + i, subtitle(who, text[:i]))
        if i % 2 == 0:
            sound_ui(t + i, a["blip"], 0.3, a["blip_pitch"] + rng.uniform(-0.06, 0.06))
        if i % 6 == 0:
            pitch = 7 if (i // 6) % 2 else -3
            at(t + i, f"execute as {a['sel']} at @s run tp @s ~ ~ ~ ~ {pitch}")
    hold = hold if hold is not None else max(30, int(n * 0.9))
    end = t + n + hold
    for r in range(t + n + 20, end + 1, 20):
        at(r, subtitle(who, text))  # keeps the action bar from fading
    at(t + n + 2, f"execute as {a['sel']} at @s run tp @s ~ ~ ~ ~ 0")
    return end


def turn(t, who, yaw, pitch=0):
    at(t, f"execute as {ACTORS[who]['sel']} at @s run tp @s ~ ~ ~ {yaw} {pitch}")


def clear_sub(t):
    at(t, f'title {V} actionbar ""')


# ---------------------------------------------------------------- the film

V_POS, Z_POS = (-2.5, 0, 0), (2.5, 0, 0)
CAM_START = (6, -55, 16)


def cu(t, dur, who):
    if who == "v":
        drift(t, dur, (-0.2, 1.75, 2.0), (-2.5, 1.5, 0), (-0.05, 0, -0.04))
    else:
        drift(t, dur, (0.2, 1.8, 2.0), (2.5, 1.6, 0), (0.05, 0, -0.04))


def ots(t, dur, who):
    """Over-the-shoulder shot looking at `who`."""
    if who == "v":
        drift(t, dur, (4.1, 2.1, 2.3), (-2.5, 1.4, 0), (-0.03, 0, 0.05))
    else:
        drift(t, dur, (-4.1, 2.0, 2.3), (2.5, 1.5, 0), (0.03, 0, 0.05))


def two(t, dur):
    drift(t, dur, (0.7, 1.9, 7.8), (0, 1.35, 0), (-0.07, 0, -0.03))


def estimate(text, hold=None):
    return len(text) + (hold if hold is not None else max(30, int(len(text) * 0.9)))


def build_timeline():
    # --- opening: rise through the clouds while the island assembles itself
    shot(1, 190, CAM_START, (-80, -58, -20), (7, 3.5, 15), (0, 0.5, 0), cut=False)
    at(6, f"data modify entity {CAM} teleport_duration set value {CAM_SMOOTH}")
    sound(2, "music_disc.mall", (0, 0, 0), 9, 1, channel="record")
    at(34, f"title {V} times 25 70 30",
       f'title {V} subtitle {{"text":"разговор над облаками","color":"gray","italic":true}}',
       f'title {V} title {{"text":"ДВЕРЬ","color":"gold","bold":true}}')
    build_platform(92)

    shot(191, 140, (7, 3.5, 15), (0, 0.5, 0), (0.7, 1.9, 7.8), (0, 1.35, 0), cut=False)
    actor_nbt = "NoAI:1b,NoGravity:1b,Silent:1b,Invulnerable:1b,PersistenceRequired:1b"
    at(214, f'summon minecraft:villager {rel(*V_POS)} {{{actor_nbt},Rotation:[-90f,0f],'
            'Tags:["cs.e","cs.actor","cs.villager"],'
            'VillagerData:{profession:"minecraft:librarian",type:"minecraft:plains",level:2}}')
    particle(214, "poof", (-2.5, 1, 0), (0.3, 0.7, 0.3), 0.03, 30)
    particle(214, "happy_villager", (-2.5, 1, 0), (0.4, 0.8, 0.4), 0, 12)
    sound(214, "entity.villager.celebrate", (-2.5, 1, 0), 3, 0.9)
    at(262, f'summon minecraft:zombie {rel(*Z_POS)} {{{actor_nbt},Rotation:[90f,0f],CanPickUpLoot:0b,'
            'Tags:["cs.e","cs.actor","cs.zombie"]}')
    particle(262, "large_smoke", (2.5, 1, 0), (0.3, 0.7, 0.3), 0.02, 30)
    particle(262, "soul", (2.5, 1, 0), (0.3, 0.7, 0.3), 0.03, 12)
    sound(262, "entity.zombie.ambient", (2.5, 1, 0), 3, 0.7)
    turn(266, "v", -90, -8)
    turn(300, "v", -90, 0)

    t = 338

    def line(who, text, camera, voice=None, hold=None):
        nonlocal t
        camera(t, estimate(text, hold))
        t = say(t, who, text, voice, hold) + 4
        return t

    line("v", "Хм-м. Ты снова здесь.", lambda a, d: cu(a, d, "v"))
    line("z", "Я всегда здесь. Каждую ночь. Триста лет подряд.", lambda a, d: cu(a, d, "z"))

    # --- the door
    build_door(t + 22)
    line("v", "И каждую ночь ты стучишь в мою дверь.", two, hold=44)
    for n in range(3):
        sound(t - 30 + n * 9, "entity.zombie.attack_wooden_door", (0, 1, 0), 2, 0.9)
    line("z", "Я не ломился. Я хотел спросить, как у тебя дела.", lambda a, d: ots(a, d, "z"))
    line("v", "...Триста лет?", lambda a, d: cu(a, d, "v"), hold=34)
    line("z", "Ты ни разу не открыл.", lambda a, d: cu(a, d, "z"), hold=44)
    clear_sub(t)
    t += 12

    # --- the house
    text = "У меня был дом. Маленький. С окном на закат."
    built = build_house(t + 16)
    drift(t, built - t + 40, (-3.2, 3.0, 9.5), (-12, 1.5, 0), (-0.09, 0.02, -0.05))
    turn(t + 14, "v", 90, -5)
    say(t, "v", text, hold=built - t - len(text) + 30)
    turn(built + 16, "v", -90, 0)
    t = built + 36

    # --- the bell tower
    text = "А у меня была колокольня. Я звонил в неё, когда ещё был живым."
    built = build_tower(t + 16)
    end = built + 50
    shot(t, end - t + 30, (3.6, 0.9, 5.5), (0, 3.0, -10.5), (2.4, 2.8, 3.6), (0, 4.6, -10.5), ease=False)
    turn(t + 14, "z", 180, -25)
    say(t, "z", text, hold=end - t - len(text) - 6)
    turn(end - 14, "z", 90, 0)
    t = end

    line("v", "Почему же мы ни разу не поговорили?", lambda a, d: ots(a, d, "v"))
    line("z", "Между нами всегда была дверь. И ночь.", lambda a, d: cu(a, d, "z"))
    line("v", "Тогда давай построим что-нибудь длиннее ночи.", lambda a, d: cu(a, d, "v"))

    # --- the staircase to the moon
    text = "Лестницу. До самой луны."
    built = build_stairs(t + 34)
    end = built + 34
    shot(t, 30, (1.2, 2.0, 5.5), (5, 1.6, 0), (1.5, 2.1, 5.5), (6, 1.6, 0), ease=False)
    shot(t + 30, built - t - 14, (1.5, 2.1, 5.5), (6, 1.6, 0), (10, 11, 10), (23, 18, 0), cut=False)
    turn(t + 30, "z", -90, -20)
    turn(t + 40, "v", -90, -20)
    say(t, "z", text, hold=end - t - len(text) - 6)
    turn(end - 10, "z", 90, 0)
    turn(end - 10, "v", -90, 0)
    t = end

    line("v", "Она никуда не ведёт.", two, voice="entity.villager.no")
    line("z", "Зато мы построили её вместе.", lambda a, d: cu(a, d, "z"))
    line("v", "...Приходи завтра. Я открою дверь.", lambda a, d: cu(a, d, "v"), voice="entity.villager.yes")

    # --- the door opens, they take a step towards each other
    two(t, 150)
    at(t + 14, f'execute as @e[type=block_display,tag=cs.door] run data merge entity @s {{block_state:{{Properties:{{open:"true"}}}}}}')
    sound(t + 14, "block.wooden_door.open", (0, 1, 0), 3, 0.8)
    particle(t + 14, "end_rod", (0, 1, 0), (0.1, 0.8, 0.4), 0.02, 20)
    for n in range(24):
        at(t + 26 + n, f"execute as {VIL} at @s run tp @s ~0.045 ~ ~",
           f"execute as {ZOM} at @s run tp @s ~-0.045 ~ ~")
    t += 58
    t = say(t, "z", "Я постучу.", hold=50)
    clear_sub(t)

    # --- final crane shot and dissolve
    crane = t
    shot(crane, 240, (-0.2, 1.9, 7.4), (0, 1.35, 0), (-5, 13, 31), (3, 5, -2), cut=False)
    at(crane + 120, f"title {V} times 30 80 40",
       f'title {V} subtitle {{"text":"…а дверь так и осталась открытой","color":"gray","italic":true}}',
       f'title {V} title {{"text":""}}')
    fade = crane + 250
    particle(fade + 4, "poof", (-1.4, 1, 0), (0.3, 0.7, 0.3), 0.03, 25)
    particle(fade + 4, "poof", (1.4, 1, 0), (0.3, 0.7, 0.3), 0.03, 25)
    at(fade + 4, f"function {NS}:fx/remove_actors")
    sound(fade, "block.beacon.deactivate", (0, 2, 0), 9, 0.7)
    for n in range(46):
        at(fade + n, f"function {NS}:fx/dissolve_some")
    at(fade + 46, f"execute as @e[type=block_display,tag=cs.b,tag=!cs.gone] run function {NS}:fx/vanish")
    at(fade + 80, f"function {NS}:stop")
    return fade + 80


# ---------------------------------------------------------------- static functions

SUNSET = f"""# jump forward to sunset (time only ever moves forward, the day counter is kept)
execute store result score #d cs.v run {{query}}
scoreboard players set #neg cs.v -1
scoreboard players remove #d cs.v {START_TIME}
scoreboard players operation #d cs.v *= #neg cs.v
execute if score #d cs.v matches ..-1 run scoreboard players add #d cs.v 24000
execute store result storage {NS}:tmp d int 1 run scoreboard players get #d cs.v
function {NS}:util/time_add with storage {NS}:tmp
"""
# Minecraft 26.1 replaced `time query daytime` with timelines; pack.mcmeta maps this overlay to older versions.
OVERLAY = ROOT / "overlay_legacy" / "data" / "cutscene" / "function" / "util"


def static_functions():
    f = {}
    f["load"] = """
scoreboard objectives add cs.v dummy
scoreboard players set #c10000 cs.v 10000
"""
    f["tick"] = f"""
execute if score #run cs.v matches 1 run function {NS}:loop
# restores a viewer who left mid-cutscene and came back
execute unless score #run cs.v matches 1 as {V} run function {NS}:player/restore
"""
    f["start"] = f"""
# /function {NS}:start — plays the cutscene for the player who runs it
scoreboard objectives add cs.v dummy
scoreboard players set #c10000 cs.v 10000
execute if score #run cs.v matches 1 run return run tellraw @s {{"text":"Катсцена уже идёт. Прервать: /function {NS}:stop","color":"red"}}
execute unless entity @s[type=minecraft:player] run return run tellraw @a {{"text":"Катсцену должен запускать игрок: /function {NS}:start","color":"red"}}
execute store result score #diff cs.v run difficulty
execute if score #diff cs.v matches 0 run return run tellraw @s {{"text":"На мирной сложности зомби исчезает. Поставь /difficulty easy и запусти снова.","color":"red"}}

kill @e[tag=cs.e]
kill @e[type=marker,tag=cs.return]
tag @a remove cs.viewer
tag @s add cs.viewer
tag @s[gamemode=survival] add cs.gm.survival
tag @s[gamemode=creative] add cs.gm.creative
tag @s[gamemode=adventure] add cs.gm.adventure
tag @s[gamemode=spectator] add cs.gm.spectator

# where the player returns to afterwards (position and rotation)
execute at @s run summon minecraft:marker ~ ~ ~ {{Tags:["cs.return"]}}
execute at @s as @e[type=marker,tag=cs.return,limit=1] run tp @s ~ ~ ~ ~ ~
# the stage floats above the clouds, straight over the player
execute at @s align xyz positioned ~ {STAGE_Y} ~ run summon minecraft:marker ~ ~ ~ {{Tags:["cs.e","cs.origin"]}}
execute at {ORIGIN} run summon minecraft:item_display {rel(*CAM_START)} {{Tags:["cs.e","cs.cam"],teleport_duration:0}}

gamemode spectator @s
execute at {ORIGIN} run tp @s {rel(*CAM_START)}
stopsound @s music

function {NS}:util/sunset

scoreboard players set #t cs.v 0
scoreboard players set #run cs.v 1
"""
    f["util/sunset"] = SUNSET.format(query="time query minecraft:day")
    f["util/time_add"] = "$time add $(d)\n"
    f["stop"] = f"""
# /function {NS}:stop — ends the cutscene at any moment and puts everything back
scoreboard players set #run cs.v 0
execute at {ORIGIN} run function {NS}:fx/lights_off
function {NS}:fx/remove_actors
kill @e[tag=cs.e]
stopsound {V} record
title {V} clear
title {V} reset
execute as {V} run function {NS}:player/restore
"""
    f["player/restore"] = """
spectate
execute unless entity @e[type=marker,tag=cs.return] run effect give @s minecraft:slow_falling 40 0 true
execute at @e[type=marker,tag=cs.return,limit=1] run tp @s ~ ~ ~ ~ ~
gamemode survival @s[tag=cs.gm.survival]
gamemode creative @s[tag=cs.gm.creative]
gamemode adventure @s[tag=cs.gm.adventure]
gamemode spectator @s[tag=cs.gm.spectator]
tag @s remove cs.gm.survival
tag @s remove cs.gm.creative
tag @s remove cs.gm.adventure
tag @s remove cs.gm.spectator
tag @s remove cs.viewer
title @s actionbar ""
kill @e[type=marker,tag=cs.return]
"""
    f["loop"] = f"""
execute unless entity {ORIGIN} run return run function {NS}:stop
scoreboard players add #t cs.v 1
execute as @e[type=block_display,tag=cs.grow] run function {NS}:fx/grow
execute at {ORIGIN} run function {NS}:timeline
execute if score #run cs.v matches 1 run function {NS}:cam/step
execute if score #run cs.v matches 1 if score #t cs.v matches 4.. as {V} run spectate {CAM}
"""
    chan = ""
    for c, scale in (("x", 0.001), ("y", 0.001), ("z", 0.001), ("w", 0.01), ("p", 0.01)):
        chan += f"""scoreboard players operation #v cs.v = #b{c} cs.v
scoreboard players operation #v cs.v -= #a{c} cs.v
scoreboard players operation #v cs.v *= #e cs.v
scoreboard players operation #v cs.v /= #c10000 cs.v
scoreboard players operation #v cs.v += #a{c} cs.v
execute store result storage {NS}:cam {c} double {scale} run scoreboard players get #v cs.v
"""
    f["cam/step"] = f"""
# progress 0..10000 of the current shot, optionally eased, then a..b blended per channel
execute if score #ct cs.v < #cn cs.v run scoreboard players add #ct cs.v 1
scoreboard players operation #s cs.v = #ct cs.v
scoreboard players operation #s cs.v *= #c10000 cs.v
scoreboard players operation #s cs.v /= #cn cs.v
scoreboard players operation #e cs.v = #s cs.v
execute if score #lin cs.v matches 0 run function {NS}:cam/ease
{chan}execute as {CAM} at {ORIGIN} run function {NS}:cam/apply with storage {NS}:cam
"""
    f["cam/ease"] = """
# smoothstep: e = s*s*(3-2s)
scoreboard players operation #e cs.v *= #s cs.v
scoreboard players operation #e cs.v /= #c10000 cs.v
scoreboard players set #k cs.v 30000
scoreboard players operation #k cs.v -= #s cs.v
scoreboard players operation #k cs.v -= #s cs.v
scoreboard players operation #e cs.v *= #k cs.v
scoreboard players operation #e cs.v /= #c10000 cs.v
"""
    f["cam/apply"] = "$tp @s ~$(x) ~$(y) ~$(z) $(w) $(p)\n"
    f["fx/grow"] = f"""
data merge entity @s {{start_interpolation:0,interpolation_duration:18,transformation:{IDENTITY}}}
tag @s remove cs.grow
"""
    f["fx/vanish"] = """
data merge entity @s {start_interpolation:0,interpolation_duration:24,transformation:{left_rotation:[0f,0.707f,0f,0.707f],right_rotation:[0f,0f,0f,1f],translation:[0.5f,5f,0.5f],scale:[0.01f,0.01f,0.01f]}}
tag @s add cs.gone
"""
    f["fx/dissolve_some"] = f"""
execute as @e[type=block_display,tag=cs.b,tag=!cs.gone,sort=random,limit=9] run function {NS}:fx/vanish
"""
    f["fx/remove_actors"] = """
# moved into the void first so nothing drops and no death animation is seen
execute as @e[tag=cs.actor] run tp @s ~ -400 ~
kill @e[tag=cs.actor]
"""
    return f


def main():
    end = build_timeline()
    funcs = static_functions()
    funcs["fx/lights_off"] = "\n".join(
        f"execute if block {rel(*p)} minecraft:light run setblock {rel(*p)} minecraft:air" for p in LIGHTS) + "\n"

    buckets = defaultdict(list)
    for t in sorted(events):
        assert t >= 1, t
        for cmd in events[t]:
            buckets[t // BUCKET].append(f"execute if score #t cs.v matches {t} run {cmd}")
    dispatch = []
    for b in sorted(buckets):
        funcs[f"tl/b{b:03d}"] = "\n".join(buckets[b]) + "\n"
        dispatch.append(f"execute if score #t cs.v matches {b * BUCKET}..{b * BUCKET + BUCKET - 1} run function {NS}:tl/b{b:03d}")
    funcs["timeline"] = "# generated by tools/build.py — runs positioned at the stage origin\n" + "\n".join(dispatch) + "\n"

    if OUT.exists():
        shutil.rmtree(OUT)
    for name, body in funcs.items():
        p = OUT / f"{name}.mcfunction"
        p.parent.mkdir(parents=True, exist_ok=True)
        p.write_text(body.lstrip("\n"), encoding="utf-8")

    OVERLAY.mkdir(parents=True, exist_ok=True)
    (OVERLAY / "sunset.mcfunction").write_text(SUNSET.format(query="time query daytime"), encoding="utf-8")

    tags = ROOT / "data" / "minecraft" / "tags" / "function"
    tags.mkdir(parents=True, exist_ok=True)
    (tags / "load.json").write_text(json.dumps({"values": [f"{NS}:load"]}, indent=2) + "\n")
    (tags / "tick.json").write_text(json.dumps({"values": [f"{NS}:tick"]}, indent=2) + "\n")

    n_blocks = sum(c.startswith("summon minecraft:block_display") for cmds in events.values() for c in cmds)
    print(f"length: {end} ticks ({end / 20:.0f} s), block displays: {n_blocks}, "
          f"commands: {sum(map(len, events.values()))}, functions: {len(funcs)}")


if __name__ == "__main__":
    main()
