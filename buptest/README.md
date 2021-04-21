# buptest

## what is this?

buptest is a tool to check your connection to the pistorm adapter. the tool
generates random data and sends it to the cpld, which sends it back to the
host. if the data differs, it indicates a problem in communication, which can
be related to a number of issues:

* error in the cpld program
* fault in the pistorm adapter hardware (bad/cut traces, soldering, etc.)
* fault with the raspberry pi hardware (misaligned boards can cause 5v to
  be run down a gpio line, which can cause failure in the pi's SoC - always
  ensure your board is correctly attached!)
* general bad luck

## see also

silly-pistorm-display-cloner can be used to validate the pistorm's ability to
communicate with the amiga hardware; whilst buptest can confirm the pi's
ability to drive the adapter board, the display cloner will validate that the
cpu socket connection is sufficient to speak to the amiga's custom chips.
