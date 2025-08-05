# kpimon xApp

## Overview

This repository is a forked repo from Wineslab's ric-app-scp-kpimon repository: https://github.com/wineslab/ns-o-ran-scp-ric-app-kpimon. This version is adjusted to match with the Colosseum's Near RT RIC environtment and is intended to be deployed in the Docker container. **Make sure Docker can be executed without sudo privilege (read Docker linux post install).**

The kpimon xApp can connect to the RIC environment, however, due to different version of E2AP and E2SM encoding library from both sides, the kpimon couldn't past the `RIC INDICATION` process.

## Pre-requisites

The near-RT-RIC has to be installed. If is not, go to this repository and follow the **Setup Environment** section: [Github](https://github.com/den-dimas/colosseum-near-rt-ric/tree/ns-o-ran).

## Deploy and Run the xApp

1. Clone the repository
```bash
cd ~
git clone https://github.com/den-dimas/ric-app-kpimon.git kpimon
```

2. Deploy the xApp
```bash
cd ~/kpimon
./redeploy.sh
```

3. Run the kpimon xApp
  
  a. Open new terminal
  ```bash
  docker exec -it ns-o-ran /bin/bash
  cd ns3-mmwave-oran/
  ./ns3 run scratch/scenario-zero.cc
  ```

  b. Open another new terminal
  ```bash
  docker exec -it kpimon /bin/bash
  ./kpimon -f /opt/config-file.json
  ```