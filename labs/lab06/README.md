# its250
Online resources and examples

## Lab06: Vulnerability assessment

### 1. Description
Install Greenbone GVM on Ubuntu then launch it from Ubuntu, carry out a vulnerability assessment (scan) on the Windows server VM to find its vulnerabilities.

**Prerequisite**

* Both Windows server VM and the Ubuntu VM are used
* Install Greenbone GVM on Ubuntu

You may follow this [installation video](https://youtu.be/oq3rhIjrnGM).

**Note**

1. *Don't try more than one methods on the same VM, otherwise they will be messed up*
2. *In all these methods, if your scan configs are missing, just leave the VM running for one or two hours until you see the scan configs.*
3. *Run those update commands every one or two hours until you have all the required data*
4. *The smoothest method is Method 1 demonstrated in the installation video above*
5. *Using a freshly-made VM is suggested, especially after failed many times*

```bash
# ===== Method 1: Install gvm from PPA ======
# 0. Update the system
sudo apt update -y && sudo apt upgrade -y

# 1. Install postgresql dbs
sudo apt install postgresql --fix-missing

# 2. Start postgresql and check its status
# sudo pg_ctlcluster 12 main start or
sudo systemctl start postgresql@12-main
sudo systemctl status postgresql@12-main

# 3. add Greenbone gvm ppa and install
sudo apt-add-repository ppa:mrazavi/gvm
sudo apt install gvm
# during the installation
# 1. Do you want to enable redis unix socket in /etc/redis/redis.conf? Choose YES
# 2. Configure database for gvmd-pg with dbconfig-common? Choose YES
# 3. Host name of the PostgreSQL database server for gvmd-pg: Choose localhost
# 4. PostgreSQL application password for gvmd-pg: LEAVE IT BLANK and let it to be generated randomly.

# 4. Update greenbone (TAKE LOTS OF TIME)
# populate nvt
sudo greenbone-nvt-sync
# populate cves 
sudo greenbone-scapdata-sync 
# sudo -u gvm -g gvm greenbone-feed-sync --type SCAP
# polulate cert
sudo greenbone-certdata-sync 
# sudo -u gvm -g gvm greenbone-feed-sync --type CERT
# 5. Access https://localhost:9392/ in a browser

# 6. In case you have the problem that the scan configs are missing
sudo -u gvm -g gvm greenbone-feed-sync --type GVMD_DATA

# ===== Method 2: Install gvm from PPA ======
# 0. Update the system
sudo apt update -y && sudo apt upgrade -y

# 1. Install postgresql dbs
sudo apt install postgresql --fix-missing

# 2. Start postgresql and check its status
# sudo pg_ctlcluster 12 main start or
sudo systemctl start postgresql@12-main
sudo systemctl status postgresql@12-main

# 3. add Greenbone gvm ppa and install
sudo apt-add-repository ppa:mrazavi/gvm
sudo apt install gvm
# during the installation
# 1. Do you want to enable redis unix socket in /etc/redis/redis.conf? Choose YES
# 2. Configure database for gvmd-pg with dbconfig-common? Choose YES
# 3. Host name of the PostgreSQL database server for gvmd-pg: Choose localhost
# 4. PostgreSQL application password for gvmd-pg: LEAVE IT BLANK and let it to be generated randomly.

# 4. Update greenbone (TAKE LOTS OF TIME)
# populate nvt
sudo -u gvm -g gvm greenbone-nvt-sync
# populate cves 
sudo -u gvm -g gvm greenbone-feed-sync --type SCAP
# populate cert
sudo -u gvm -g gvm greenbone-feed-sync --type CERT
# populate configs
sudo -u gvm -g gvm greenbone-feed-sync --type GVMD_DATA

# 5. Access https://localhost:9392/ in a browser

# 6. Inside the web app - Greenbone Security Assistant, check tab Administration -> Feed status
# wait until the status says current

# ====== Method 3: Install from source code =======
# 1. Download the install script
wget https://raw.githubusercontent.com/yu210148/gvm_install/master/install_gvm.sh
chmod +x install_gvm.sh

# 2. Install from source code, it could take 1 - 3 hours
# CHOOSE VERSION 20 at the prompt by typing 20
sudo ./install_gvm.sh 

# 3. You may change the default password: StrongPass
sudo -Hiu gvm gvmd --user=gvmadmin --new-password='P@ssw0rd'

# 4. !!! Restart and leave your VM run for one night !!!
restart

# 5. Access https://localhost in a browser, log in with 
# user name: gvmadmin 
# password: P@ssw0rd or StrongPass if you did NOT change it at step 3.

# 6. If your scan configs are empty, run the following command, then they should be populated
sudo -u gvm -g gvm greenbone-feed-sync --type GVMD_DATA
```


### 2. Tasks (80%)
Carry out vulnerability assessment on the Windows VM from the Ubuntu VM.

1. (5%) Find the IP addresses of your Windows server VM and Ubuntu VM, make sure they can ping each other
2. (5%) Access https://localhost:9392/ in a browser, login with the default credential.
3. (10%) Create a scan config for scanning Windows only
4. (10%) Create a scan task with the config above and start it
5. (40%,8% each) Investigate the scan results
   1. Dashboard
   2. Scans -> Tasks
   3. Scans -> Reports
   4. Scans -> Results
   5. Scans -> Vulnerabilities
6. (10%) Export the scan results, try all the format to see which of them are successfully exported, for each of the successful outputs, take a screenshot of a portion of its content.

### 3. Review questions (20%, each 10%)
1. Use the CVSS calculator built-in Greenbone GVM to assess the severity of TWO of the vulnerabilities with different scores found above.

**Demo video**

* [Lab06 Assessing IT System Security With Greenbone GVM](https://youtu.be/erP3_jmbbhY)

## References:
* [openvas](https://www.openvas.org/)
  * [greenbone](https://github.com/greenbone)
  * [Install doc](https://github.com/greenbone/gvmd/blob/master/INSTALL.md)
  * [Install from source code](https://github.com/yu210148/gvm_install)
* [Greenbone Vulnerability Management](https://launchpad.net/~mrazavi/+archive/ubuntu/gvm)
  * [Install Greenbone Vulnerability Management in Gentoo Linux](https://wiki.gentoo.org/wiki/Greenbone_Vulnerability_Management)
  * [Install Greenbone Vulnerability Manager 20.08 on Ubuntu 20.04](https://www.mikeslab.net/install-greenbone-vulnerability-manager-20-08-on-ubuntu-20-04/)
  * [Greenbone-nvt-sync (Rsync error)](https://community.greenbone.net/t/greenbone-nvt-sync-rsync-error/5388/12)
* [GVM managing secinfo](https://docs.greenbone.net/GSM-Manual/gos-5/en/managing-secinfo.html)
  * [Common Vulnerabilities and Exposures (CVE)](https://en.wikipedia.org/wiki/Common_Vulnerabilities_and_Exposures)
  * [Common Platform Enumeration (CPE)](https://en.wikipedia.org/wiki/Common_Platform_Enumeration)
  * [GVM 20.08 Missing Report Formats and Scan Configs](https://community.greenbone.net/t/gvm-20-08-missing-report-formats-and-scan-configs/6397)
