*******************************
Generic OUYA SNES game launcher
*******************************
Based on this code you can pack up a SNES game and make it
directly available in the OUYA launcher, just as a normal game.

When running it, the game file is extracted and
`Snes9x EX+`__ is started with it.

__ http://www.explusalpha.com/home/snes9x-ex


Packing a game
==============
Run ``prepare-game.sh``::

  $ ./prepare-game.sh "Super Pac-Man" superpacman ~/public-domain/superpacman.smc
  Game title: Super Pac-Man
  Full package path: romlauncher.superpacman
  Game file: superpacman.smc
  All prepared.
  Put a 732x412 image into res/drawable-xhdpi/ouya_icon.png

Now adjust the launcher image ``ouya_icon.png`` and build/run it
with the Android Developer Tools Eclipse IDE.

The generated ``.apkg`` file will be located in the ``bin/`` folder.
