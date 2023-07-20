# SCANBLOCKS

ScanBlocks is an open-source PHP app built using the Phalcon framework on a LAMP stack server. The core functionality it provides is the ability to search for malicious blockchain addresses and the ability to authenticate and report addresses (authenticated users only). 

## CREDITS

The app was built by Neil McWilliam and is now open-source so that others can host it on their own Phalcon server and leverage the codebase. Attribution to Neil McWilliam is required, but you are freely able to modify and redistribute the code according to the MIT License.

## Technical Requirements

### Requirements

* PHP >= 7.2
* [Apache][2] Web Server with [mod_rewrite][3] enabled or [Nginx][4] Web Server
* Latest stable [Phalcon Framework release][5] extension enabled
* [MySQL][6] >= 5.5
* Phalcon Framework >= 4.0 

### Installation Instructions

Setup a Phalcon server following these instructions: (Use the invo project as starting point)
https://docs.phalcon.io/5.0/en/tutorial-invo

Setup a back-end relational database - For this project we recommend MySQL.

Once your new DB server is running and DB has been created with credentials, create a .env file in project root to store your DB_ADAPTER, DB_HOST, DB_USERNAME, DB_PASSWORD, DB_DBNAME, and DB_CHARSET

Run the migrations scripts under db/migrations to create the appropriate DB tables. 

Copy the source files to your phalcon directory being serviced. 

Recommend to create a load balancer w/ SSL certificate to serve up the traffic.  

Now you should be up and running. 