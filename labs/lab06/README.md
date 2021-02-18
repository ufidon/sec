# its250
Online resources and examples

## Lab06: Vulnerability assessment

### 1. Description
Install Greenbone GVM on Ubuntu then launch it from Ubuntu, carry out a vulnerability assessment (scan) on the Windows server VM to find its vulnerabilities.

**Prerequisite**

* Both Windows server VM and the Ubuntu VM are used
* Install Greenbone GVM on Ubuntu

You may follow this [installation video](https://youtu.be/oq3rhIjrnGM).

```bash
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

# 4. Update greenbone (TAKE LOTS OF TIME)
sudo greenbone-nvt-sync 
sudo greenbone-scapdata-sync 
sudo greenbone-certdata-sync 

# 5. Access https://localhost:9392/ in a browser
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
* [Greenbone Vulnerability Management](https://launchpad.net/~mrazavi/+archive/ubuntu/gvm)
  * [Install Greenbone Vulnerability Management in Gentoo Linux](https://wiki.gentoo.org/wiki/Greenbone_Vulnerability_Management)
  * [Install Greenbone Vulnerability Manager 20.08 on Ubuntu 20.04](https://www.mikeslab.net/install-greenbone-vulnerability-manager-20-08-on-ubuntu-20-04/)
* [GVM managing secinfo](https://docs.greenbone.net/GSM-Manual/gos-5/en/managing-secinfo.html)
  * [Common Vulnerabilities and Exposures (CVE)](https://en.wikipedia.org/wiki/Common_Vulnerabilities_and_Exposures)
  * [Common Platform Enumeration (CPE)](https://en.wikipedia.org/wiki/Common_Platform_Enumeration)
