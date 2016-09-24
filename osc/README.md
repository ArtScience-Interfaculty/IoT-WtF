# Open Sound Control examples

## test with node.js

#### receive osc msgs coming in at port 3333
```bash
node ./oscdump.js
```
#### send '/wtf' message with random int (to localhost:3333)
```bash
node ./oscsend.js
```
## nodered flows for osc

osc_nodered_p5.json

osc_nodered_sc.json 



## processing, puredata, supercollider

osc_nodered_p5.pde  

osc_nodered_pd.pd   

osc_nodered_sc.scd

