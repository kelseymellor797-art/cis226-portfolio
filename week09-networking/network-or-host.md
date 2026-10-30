# Week 9: Network or host? My troubleshooting card

## Environment
These tests were completed in my isolated KaliKat VirtualBox VM, using loopback for SSH and SCP practice. The summaries in this folder were manually transcribed from my KaliKat terminal screenshots.

## The four failures I saw
- **Name lookup:** `curl: (6) Could not resolve host` when I requested `no-such-site.invalid`.
- **Connection refused:** `curl: (7) Failed to connect` when nothing was listening on port 9999.
- **Timeout:** `curl: (28) Connection timed out` when I tried `192.0.2.1`.
- **Missing file:** `HTTP/1.0 404 File not found` when I requested `/missing.html`.

These are the error types and representative wording confirmed during the exercise; the exact full lines were not retained in the screenshots used for this portfolio entry.

## What each one means
A name lookup failure suggests checking DNS first. A refused connection suggests the host is reachable but no service is accepting the connection on that address and port. A timeout suggests checking the route, filtering, or reachability. A 404 means an HTTP server answered but could not locate the requested page, so I would check the file path.

## How it works
At first my Python web server listened on `127.0.0.1:8000`, so `localhost` worked but connecting to the VM's own address `10.0.2.15:8000` was refused. After I restarted it on `0.0.0.0:8000`, the network-address request returned `HTTP/1.0 200 OK`.

For the private inventory page, the opposite setting was intentional: it listened on `127.0.0.1:8080` only. I used an SSH local tunnel on port 9090 to reach it. The direct network-address request was refused, the page worked through the tunnel, and access through port 9090 was refused again when I closed the tunnel.

I also logged in as the intern using an SSH key, confirmed that `credentials.txt` remained inaccessible, and used SCP plus `cmp` to verify that the round-trip backup was identical. Because the copy was sent to `localhost`, it was a transfer exercise, not a genuine off-site backup.
