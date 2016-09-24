#!/usr/bin/node
var osc = require('node-osc');
var client = new osc.Client('127.0.0.1', 3333); client.send('/wtf', Math.random(), function () { client.kill(); });
