import("stdfaust.lib");

maxDuration = 2.0;
duration = 0.5;
feedback = 0.5;
mix = hslider("echo mix",0.5,0,1,0.01) : si.smoo;

process = os.osc(1), 1 : + : _, 300 : * : os.sawtooth : _, 0.1 : * <: _,(mix, ef.echo(maxDuration,duration,feedback) : *) :> _;

// JK: what are the datatypes? It seems like there is only one-- signal
// Docs: "Faust considers two type of signals: integer signals and floating point signals. Exchanges with the outside world are, by convention, made using floating point signals. The full range is represented by sample values between -1.0 and 1.0.

// Docs: "Instead of compiling a program literally, it compiles the mathematical function it denotes."
// JK: does this mean that the compiled programs are not reversible? 

// simple one-pole

//a1 = 0.999; // the pole
//process = +~*(a1);
