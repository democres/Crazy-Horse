*** What is CSocketMaster?
==========================
CSocketMaster class is a Winsock control substitute that attempts to mimic its behavior and interface to make it easy to implement.

*** What is CSocketPlus?
========================
Same as CSocketMaster, but you can create sockets at runtime. It's a little harder to though.

*** Which one should you use?
=============================
If you know how many sockets you're going to need on your project then use CSocketMaster. If you don't, use CSocketPlus.