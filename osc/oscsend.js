#!/usr/bin/node
var osc = require('node-osc');
var portarg = process.argv[2];
var tagarg = process.argv[3];

tag = '/nodered/r1';
port = 8900;
debugport = 8989

if( typeof portarg !== 'undefined' ){ port = portarg };
if( typeof tagarg !== 'undefined' ){ tag = tagarg };

var client = new osc.Client('127.0.0.1', port); client.send( tag, Math.random(), function () { client.kill(); });
var debugclient = new osc.Client('127.0.0.1', debugport); debugclient.send( tag, Math.random(), function () { debugclient.kill(); });

console.log('- successfully sent msg: ' + tag + ' to localhost: ' + port + ' and ' + debugport);
console.log("- optional usage: ./oscsend.js port /osctag");

