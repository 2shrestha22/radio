#!/usr/bin/env python3
"""Check radio station health and disable dead streams."""

import asyncio
import json
import sys
from pathlib import Path

import aiohttp

TIMEOUT = 10
CONCURRENCY = 30


async def check_url(session, url, sem):
    async with sem:
        try:
            async with session.get(
                url, timeout=aiohttp.ClientTimeout(total=TIMEOUT), ssl=False
            ) as resp:
                return resp.status in (200, 206)
        except Exception:
            return False


async def main():
    path = Path(__file__).resolve().parents[1] / "assets" / "radio_list.json"
    stations = json.loads(path.read_text())
    total = len(stations)

    sem = asyncio.Semaphore(CONCURRENCY)
    async with aiohttp.ClientSession(
        headers={"User-Agent": "RadioNP/1.0", "Icy-MetaData": "0"},
    ) as session:
        results = await asyncio.gather(
            *[check_url(session, s["streamUrl"], sem) for s in stations]
        )

    changed = 0
    alive = 0
    disabled = 0
    revived = 0

    for s, ok in zip(stations, results):
        was_disabled = s.get("disabled", False)
        if ok:
            alive += 1
            if was_disabled:
                del s["disabled"]
                revived += 1
                changed += 1
        else:
            disabled += 1
            if not was_disabled:
                s["disabled"] = True
                changed += 1

    print(f"Total: {total}")
    print(f"Alive: {alive}")
    print(f"Disabled: {disabled}")
    print(f"Newly disabled: {changed - revived}")
    print(f"Revived: {revived}")
    print(f"Changed: {changed}")

    if changed > 0:
        path.write_text(json.dumps(stations, indent=2, ensure_ascii=False) + "\n")
        print("Updated radio_list.json")
    else:
        print("No changes needed")

    return 1 if changed > 0 else 0


if __name__ == "__main__":
    sys.exit(asyncio.run(main()))
