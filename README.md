# OpenC3 COSMOS Project/Plugin for Seestar S50

This repository contains a WIP [OpenC3 COSMOS](https://github.com/OpenC3/cosmos) project that can be used to interact with and control a [Seestar S50 telescope](https://www.seestar.com/).

## Quick Start

1. `git clone https://github.com/cgobat/openc3-cosmos-seestar.git`
2. Start OpenC3 COSMOS
   1. On Linux/Mac: `./openc3.sh run`
   2. On Windows: `openc3.bat run`
3. Build and load the plugin gem: `cd openc3-cosmos-seestar && ./reload.sh`
   1. By default the plugin assumes the Seestar has an IP of 10.0.0.1 and uses TCP port 4700 for RPC commanding and responses. If your setup is different, edit the configuration in [openc3-cosmos-seestar/plugin.txt](./openc3-cosmos-seestar/plugin.txt) accordingly.
4. After a minute or two, open a web browser to http://localhost:2900
5. Connect to your Seestar by pressing the Connect button next to the interface name

## Upgrade COSMOS Version

1. Stop OpenC3 (if running)
   1. On Linux/Mac: `./openc3.sh stop`
   2. On Windows: `openc3.bat stop`
2. Edit [.env](./.env) and change OPENC3_TAG to the specific version you would like to run (ie. `OPENC3_TAG=6.4.1`)
3. Start OpenC3
   1. On Linux/Mac: `./openc3.sh run`
   2. On Windows: `openc3.bat run`

NOTE: Downgrades are not necessarily supported. When upgrading COSMOS we need to upgrade databases and sometimes migrate internal data structures. While we perform a full regression test on every release, we recommend upgrading an individual machine with your specific plugins and do local testing before rolling out the upgrade to your production system.

## Change all default credentials and secrets

For detailed explanations of all COSMOS credentials and security best practices, see the [Security documentation](https://docs.openc3.com/docs/getting-started/security).

1. Edit .env and change:
   1. SECRET_KEY_BASE
   2. OPENC3_SERVICE_PASSWORD
   3. OPENC3_REDIS_PASSWORD
   4. OPENC3_BUCKET_PASSWORD
   5. OPENC3_SR_REDIS_PASSWORD
   6. OPENC3_SR_BUCKET_PASSWORD
2. Edit ./openc3-redis/users.acl and change the password for each account. Note passwords for openc3/scriptrunner must match the REDIS passwords in the .env file:
   1. openc3
   2. admin
   3. scriptrunner
3. Edit any passwords in compose.yaml

Passwords stored in `./openc3-redis/users.acl` use a sha256 hash.
To generate a new hash use the following method, and then copy / paste into users.acl

```bash
echo -n 'adminpassword' | openssl dgst -sha256
SHA2-256(stdin)= 749f09bade8aca755660eeb17792da880218d4fbdc4e25fbec279d7fe9f65d70
```

## Documentation

- [Opening to the Network](./NetworkConfiguration.md) - Open COSMOS to the network with SSL/TLS
