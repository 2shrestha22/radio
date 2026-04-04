#!/usr/bin/env python3
"""Check radio station stream URLs for broken links."""

import asyncio
import json
import ssl
import sys
import time
from pathlib import Path

try:
    import aiohttp
except ImportError:
    print("Installing aiohttp...")
    import subprocess
    subprocess.check_call([sys.executable, "-m", "pip", "install", "aiohttp"])
    import aiohttp

RADIO_LIST = Path(__file__).parent / "assets" / "radio_list.json"
TIMEOUT = 10
CONCURRENCY = 20

SSL_CTX = ssl.SSLContext(ssl.PROTOCOL_TLS_CLIENT)
SSL_CTX.check_hostname = False
SSL_CTX.verify_mode = ssl.CERT_NONE
SSL_CTX.set_ciphers("DEFAULT:@SECLEVEL=0")

HEADERS = {
    "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
    "Accept": "*/*",
}


async def check_url(session, station, semaphore):
    url = station.get("streamUrl", "")
    name = station.get("name", "Unknown")
    if not url:
        return {"name": name, "url": "", "status": "NO_URL", "error": "Missing streamUrl"}

    async with semaphore:
        try:
            async with session.get(
                url,
                timeout=aiohttp.ClientTimeout(total=TIMEOUT, sock_connect=TIMEOUT),
                allow_redirects=True,
                headers=HEADERS,
            ) as resp:
                await resp.content.read(1)
                if resp.status < 400:
                    return {"name": name, "url": url, "status": resp.status, "error": None}
                return {"name": name, "url": url, "status": resp.status, "error": f"HTTP {resp.status}"}
        except asyncio.TimeoutError:
            return {"name": name, "url": url, "status": "TIMEOUT", "error": f"No response within {TIMEOUT}s"}
        except Exception as e:
            return {"name": name, "url": url, "status": "ERROR", "error": str(e)[:120]}


async def main():
    with open(RADIO_LIST) as f:
        stations = json.load(f)

    print(f"Checking {len(stations)} radio stations...\n")

    semaphore = asyncio.Semaphore(CONCURRENCY)
    connector = aiohttp.TCPConnector(limit=CONCURRENCY, force_close=True, ssl=SSL_CTX)

    async with aiohttp.ClientSession(connector=connector) as session:
        tasks = [check_url(session, s, semaphore) for s in stations]
        results = await asyncio.gather(*tasks)

    broken = [r for r in results if r["error"]]
    working = [r for r in results if not r["error"]]

    print(f"{'='*70}")
    print(f" RESULTS: {len(working)} working, {len(broken)} broken out of {len(results)} total")
    print(f"{'='*70}\n")

    if broken:
        print(f"{'#':<4} {'Station Name':<40} {'Status':<10} Error")
        print(f"{'-'*4} {'-'*40} {'-'*10} {'-'*50}")
        for i, r in enumerate(broken, 1):
            print(f"{i:<4} {r['name']:<40} {str(r['status']):<10} {r['error']}")

    output_path = Path(__file__).parent / "broken_streams.json"
    with open(output_path, "w") as f:
        json.dump(broken, f, indent=2, ensure_ascii=False)
    print(f"\nBroken links saved to: {output_path}")


if __name__ == "__main__":
    start = time.time()
    asyncio.run(main())
    print(f"Completed in {time.time() - start:.1f}s")
