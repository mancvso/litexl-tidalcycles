WIP: syntax and plugin to interact with tidalcycles via lite-xl using a managed litexl.core.process API instance, as I will need to constantly read input and poutput of long-lived child process.

Tidal team is working on tidal-listener protocol, way more interoperable, so the need to spawn a process is not needed. Still alpha
https://github.com/tidalcycles/Tidal/tree/main/tidal-listener

Install (linux, probably osx)

Clone project to

~/.config/lite-xl/litexl-tidalcycles

use ctrl+shift+enter to send the selected text to tidal

Why?
Pulsar is the default text editor of the livecoding audiovisual community. Primarily because the history of the kindohm vs code plugin and then the exodus to FOSS Atom, later Pulsar text editor. 

The issue is with audio latency and specially scrolling on the UI (yes, I tries igore blacklists, wayland tweaks, nvidia/nouveau closed/open/dkms, exotic chromium flags, prime, DRI. All. 

Pulsar is a webapp that runs inside an Electron-shell. As any chromium-based shell, it suffers from medium to excesive memory usage and multiple native OS threads consuming more CPU than needed for a livecoding session. Here is the biggest risk is audio dropouts when performing live, as the OS has to deal with all web rendering stuff and the many features of the great text editor. Great for visuals, not so for live audio.

Only thing is that on a live performance situation, I prefer to have the least amount of cpu-bound tasks as possible, so not many audio dropouts are heard by the audience, and that includes turning off wifi and bt, shutting off batery optimizations and closing any web-browser, including Pulsar.

Litexl does a very good job at rendering and uses just a fraction of resources that Pulsar requires.

Music videos
https://www.youtube.com/watch?v=dNB35yXcDQU

Socials
https://www.instagram.com/endo.code
