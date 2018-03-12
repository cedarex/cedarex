Ubuntu 16.04 LTS Specs:
=

• Runs, but below minimum specs: 80gb, 2.20ghz, 2gb ram

• Recomended specs: 300gb SSD, 4x 2.20 ghz and 12 gb ram

• Ultra specs: 300gb SSD, 4x 2.20 ghz and 96 gb ram (run the os in ram its self)


An open-source crypto currency exchange
=

**Master:** [![Hakiri.io Security](https://hakiri.io/github/cedarex/cedarex/master.svg)](https://hakiri.io/github/cedarex/cedarex/master)
**Unstable:** [![Hakiri.io Security](https://hakiri.io/github/cedarex/cedarex/unstable.svg)](https://hakiri.io/github/cedarex/cedarex/unstable)
[![Slack](https://img.shields.io/badge/Slack-Join%20Chat-green.svg)](https://join.slack.com/t/cedar-ex/signup?x=x-328048759938-328020611284)


### Introduction 

Welcome to the most advanced peatio release available. Various security, UI and visual fixes have been made (more to come).


### Recently done / News

• Fixing security issues

• Revert config/application.rb

• Revert config/initializers/pusher.rb

• Revert doc/deploy-production-server.md

• Multi Server Support https://github.com/scatterp/peatio/blob/master/MultiServerReadme.md

**• Installer with minimal steps [![RELEASE](https://raw.githubusercontent.com/cedarex/cedarex/master/install1.sh)]()**

**1. Create (if it doesn’t exist) deploy user, and assign it to the sudo group:**

    sudo adduser deploy
    sudo usermod -a -G sudo deploy

**Re-login as deploy user**

**2. Run the install script**

    wget https://raw.githubusercontent.com/scatterp/peatio/master/install1.sh
    source install1.sh

**NOTE: It is critical you launch this with "SOURCE" not "SH" not "BASH" etc**

**NOTE2: Less than 4GB of ram you should disable the line that reads bitcoind or you wont have enough memory to launch the page**


### Todo (Coming soon in priority order)

• All code refactor

• Fix remaining security issues

• Payment processing

Optional:

• Investigate PoxA or socket.io as a pusher replacement

• JRuby compatability and executes faster than previous versions at every step 

• FIX financial information exchange API  added to bring the support of the entire financial eco system allowing for trading clients banks etc to connect with the exchange


### Licence

Cedarex is [![GPLv3](https://www.gnu.org/licenses/gpl-3.0.html)](https://www.gnu.org/licenses/gpl-3.0.en.html) licenced.
