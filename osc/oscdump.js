#!/usr/bin/node
var osc = require('node-osc');
var portarg = process.argv[2];
port = 3333;
if( typeof portarg !== 'undefined' ){ port = portarg } else { console.log("NB. you may use optional port argument") };
console.log("listening on port: " + port);
var oscServer = new osc.Server( port, '0.0.0.0'); oscServer.on("message", function (msg, rinfo) { console.log(msg); });
