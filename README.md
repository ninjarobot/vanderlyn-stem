Human Software
==============

Each person is a CPU operation or some data.

We pass around a token (a ball) that is the executing instruction.

Assign an address to each of the data items, and then one to the data sentinel (`EOF`), after all the data items.

### Main

* First person is `mov` - they move 0 to the `edi` register, which means we start at the first data item.
* Second person is `mov` - they move the value after the data items to `ecx` which we will check as our end marker
* Third person is `mov` - they move the first data item to `ebx` because it's our running total

### Start Loop

* Fourth person holds a sign, `start_loop`, and some people are lined up after them.
* Fifth person is `cmp`, and they compare the next item in the list to the end marker.  If true, they'll hold up their hand.
* Sixth person is `je` and if the fifth person is holding their hand up, then they pass the token to the person holding up `exit_loop`.
* Seventh person is `inc` and they will add one to the value in the `edi` register so we can get the next data item
* Eighth person is `add` and they will add the next data item to whatever is in `ebx` to give `ebx` a new value, then they pass the token back to the fourth person.
* Ninth person is `jmp` and they will always pass the token back to `start_loop`.

Fourth, fifth, sixth, seventh, and eighth keep doing this until the fifth person finally gets the last token and they hold up their and.  The sixth person will get the ball and pass it to the person holding up the `exit_loop` sign.

### Exit Loop

* Ninth person holds a sign, `exit_loop` and two people are lined up behind them.
* Tenth person is `mov` and they move a 1 into the `eax` register.
* Eleventh person is `int` and they hold up an 80, which tells the system to do what is in `eax` - which is 1 for exit and they should hold up the value in `ebx`.

### Data


The rest of the people will write down their ages on the data items, which are cards that are numbered sequentially.


`mov` - 4
`cmp` - 1
`je` - 1
`inc` - 1
`add` - 1
`int` - 1
`start_loop` - 1
`exit_loop` - 1
