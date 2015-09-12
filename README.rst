*******************************
Generic OUYA SNES game launcher
*******************************
Based on this code you can pack up a SNES game and make it
available in the OUYA launcher, just as a normal game.

When running it, the game file is extracted and
`Snes9x EX+`__ is started with it.

__ http://www.explusalpha.com/home/snes9x-ex


Configuring
===========
Things to adjust:

- Put the game file into ``assets/game/``
- Replace ``FIXME_ASSETFILENAME`` in
  ``src/de/cweiske/ouya/gamelauncher/LaunchGameActivity.java``
  with the game file name (name, not path).
- Replace ``FIXME_GAMETITLE`` in ``AndroidManifest.xml`` with
  the game's name.
- You should also adjust the package path, otherwise one game
  overwrites the other
