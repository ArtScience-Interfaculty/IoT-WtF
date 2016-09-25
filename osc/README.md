# Open Sound Control examples

## test with node.js

#### receive osc msgs (listening at default port 3333, optional port argument)
```bash
node oscdump.js
node oscdump.js 9000
```
#### send message with random int (defaults to msg: '/wtf', and localhost:3333, optional port and osctag arguments)
#### run this in another terminal, then look at oscdump output (ports should obviously match!)
```bash
node oscsend.js
node oscsend.js 9000
node oscsend.js 9000 /hulahoop
```
## nodered flows for osc

osc_nodered_p5.json

osc_nodered_sc.json 



## processing, puredata, supercollider

osc_nodered_p5.pde  

osc_nodered_pd.pd   

osc_nodered_sc.scd

