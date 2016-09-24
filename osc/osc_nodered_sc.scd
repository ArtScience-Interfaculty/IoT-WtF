// sending and receiving OSC from/to supercollider and node-red on your raspberry


// download supercollider (mac/win)
http://supercollider.s3.amazonaws.com/builds/supercollider/supercollider/osx/master-latest.html

https://github.com/supercollider/supercollider/releases/download/Version-3.7.2/SuperCollider-3.7.2_Release-win64-VS-abfba5b.exe


HOWTO RUN the codelets:

single lines
• position cursor on the line
• type Command-return (Apple-return, or Win-return)

multiple lines (bound with brackets), evaluate the parts between () brackets
• move cursor within brackets
• type Command-return


// do make sure rpi is running and reachable, you may type this in shell/bash/terminal :
$ ping hostname.local (or ping hostname)
// this should return smth like this:
64 bytes from x.x.x.x: icmp_seq=0 ttl=64 time=0.039 ms
// and not:
ping: cannot resolve ... Unknown host





// send test -------------------------------------------------------------------------------------------



(
n = NetAddr("raspberrypi.local", 8900);
// n = NetAddr("rpj3.local", 8900);
// repeatedly send msg to n (rpi on port 8900)
Tdef(\ui, { inf.do{|i| n.sendMsg("/nodered/r1", i, "OH MY gOD".scramble); rrand(1,3).wait } }).play;
)


Tdef(\ui).stop // stop sending
Tdef(\ui).play // play again
Tdef(\ui).stop




// -------------------------------------------------------------------------------------------// reception test

(
// receiving '/nodered1' messages (listening on sc port: 57120)
OSCdef(\nodered1,{|msg, time, addr, recvPort| Fdef(\one).value(msg) }, '/nodered/s1'); // evaluate function on reception
Fdef(\one, {|msg| msg.postln }); // this function just prints the incoming msgs
s.boot; // boot the sound server for next example
)



(
// make some simple sound when receiving an osc message 'trumpout' at port 57120 (supercollider port)
OSCdef(\trumbzux,{|msg, time, addr, recvPort| Fdef(\two).value(msg) }, '/trumbzux');

Fdef(\two, {|msg|
	t = msg[1];
	// t.postln;
	// less characters results in lower click
	Synth(\test,[\freq, (127 -  (142 - t.asString.size)).midicps, \amp, 0.1,\att, 0.0001, \dcy, exprand(0.001,0.01) ]);
});

SynthDef(\test,{|trig=1, freq=440, att=0.01, dcy=0.1, pos=0, amp=1|
	amp = amp * EnvGen.kr(Env.perc(att,dcy), 1, doneAction:2);
	Out.ar(0, Pan2.ar(SinOsc.ar(freq), TRand.kr(-1,1, trig), amp))
}).add;

s.scope;

)

// ------------------------------------------------------------------------------------------// stop

// to stop everything, type: Command-. (Apple-period)
// or evaluate:
thisProcess.stop;
