#!/usr/bin/node
var osc = require('node-osc');

var portarg = process.argv[2];
var tagarg = process.argv[3];
tag = '/wtf';
port = 3333;

if( typeof portarg !== 'undefined' ){ port = portarg };
if( typeof tagarg !== 'undefined' ){ tag = tagarg };

console.log('just sent msg: ' + tag + ' to localhost:' + port);

var client = new osc.Client('127.0.0.1', port); client.send( tag, Math.random(), function () { client.kill(); });

console.log("you may also do:\n./oscsend.js 9220 /osctag");

