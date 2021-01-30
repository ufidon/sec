# its250
Online resources and examples

## Lab04: Network reconnaissance

### 1. Description

In this lab, practice the following techniques:

* Install and investigate services and ports on Windows server
* Perform network reconnaissance and scanning
* Investigate the protection of firewall against network scanning

Prerequisites: 

* The network reconnaissance and scanning tools will be installed and configured during the lecture instead of the lab.
* The Windows server VM and Ubuntu VM are both used.

This lab is a combination of [Project 5: nmap](https://samsclass.info/123/proj10/123p5nmap.htm) and [Project 6: Wireshark](https://samsclass.info/123/proj14/123p6wire.htm) from [Samsclass: Ethical Hacking and Network Defense](https://samsclass.info/123/123_F18.shtml).

### 2. Task (60%)

1. Network reconnaissance and scanning
   1. (4%) Find the IP addresses of the Windows server VM and the Ubuntu VM, make sure they can ping each other. (This had been done Lab01). Check the firewall is turned off. (This had been done in the last lab)
   2. (6%) On Windows server, find all TCP/UDP listening ports and services with [TCPView](https://docs.microsoft.com/en-us/sysinternals/downloads/tcpview)
   3. (10%, 1% for each command) On Windows server, install DNS, remote desktop, OpenSSH using Powershell then use netstat command to find these services and their port numbers(AD DS: 445, DNS:53, remote desktop:3389, ssh: 22, FTP data: 20, FTP command: 21, HTTP: 80, HTTPS:443)

   ```powershell
   # Installed DNS server
   Install-WindowsFeature DNS -IncludeManagementTools
   # Install remote desktop services
   Install-WindowsFeature Remote-Desktop-Services
   # Install SMTP server
   Install-WindowsFeature SMTP-Server
   # Install OpenSSH
   # Install the OpenSSH Client
   Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0
   # Install the OpenSSH Server
   Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
   Start-Service sshd
   # Startup ssh when login
   Set-Service -Name sshd -StartupType 'Automatic'
   # Confirm the Firewall rule is configured. It should be created automatically by setup.
   # Get-NetFirewallRule -Name *ssh*
   # There should be a firewall rule named "OpenSSH-Server-In-TCP", which should be enabled
   # If the firewall does not exist, create one
   New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
   #Install IIS Feature
   Install-WindowsFeature -Name Web-Server -IncludeManagementTools
   #Install FTP feature
   Install-WindowsFeature -Name Web-Ftp-Server -IncludeAllSubFeature -IncludeManagementTools -Verbose
   ```

   4. (20%) Port-scan the Windows server from Ubuntu. Find the services installed above.
      1. (%4) Scan with windows firewall turned off
      ```bash
      # replace windowsServerIp with yours, for example: 192.168.153.130
      nmap windowsServerIp
      ```
      2. (%4) Scan with Windows firewall turned on. On Windows server, *turn ON firewall, Block all incoming connections*. In Ubuntu, rescan
      ```bash
      # replace windowsServerIp with yours, for example: 192.168.153.130
      nmap windowsServerIp
      # Nmap now reports that all scanned ports are filtered
      ```
      3. (12%, 3% for each command) Scan with nmap advanced features. On Windows server, *turn OFF firewall*. In Ubuntu, rescan
      ```bash
      # replace windowsServerIp with yours, for example: 192.168.153.130
      # 1. scan with nmap advanced features
      nmap -A windowsServerIp
      # 2. scan UDP port 53
      nmap -sU -p53 windowsServerIp
      # 3. scan TCP port 22
      nmap -sT -p22 windowsServerIp
      # 4. FTP bounce scan
      nmap -p 22,25,135 -Pn -v -b windowsServerIp
      ```

2. (20%, 5% for each) Network traffic credential extraction. This task can be done on the Windows server VM, the Ubuntu VM or your host.
   1. Examine network layers: link layer, internet protocol layer, transmission control protocol layer and application layer. From Samsclass website, download the following FTP capture file and open it in Wireshark.
   [FTPlogin.pcapng](https://samsclass.info/123/proj14/FTPlogin.pcapng)
   2. Find the FTP password of user john.
   3. From Samsclass website, download the following HTTP capture file and open it in Wireshark.
   [httplogin.pcapng](https://samsclass.info/123/proj14/httplogin.pcapng)
   In this capture, user Isaac made several attempts to log in before finally entering the correct password. Find all his attempted passwords and identify the correct one.
   4. From Samsclass website, download the following HTTP Basic Authentication capture file and open it in Wireshark.
   [BasicLogin.pcapng](https://samsclass.info/123/proj14/BasicLogin.pcapng)
   Find the user WALDO's password.

### 3. Review question (40%)
On Windows server, setup a simple website and a FTP site, then login these sites. From Ubuntu, capture all these login network traffics with Wireshark.
1. (5%) Stop the iis using Powershell
```powershell
Stop-IISSite -Name "Default Web Site"
iisreset.exe /stop
```
2. (35%) Download and install [FileZilla server](https://filezilla-project.org/) on Windows server. Start Wireshark capture in Ubuntu before step 2.
   1. (10%) Setup an account for test, put a file in its home folder
   2. (5%) Login FileZilla server from Ubuntu with the test account
   3. (10%) Upload and download a file
   4. (10%) Save and investigate the Wireshark capture in Ubuntu. Can you extract the login credential and the files transferred?
3. (Optional)Following [How to Install Nginx, PHP, and MySQL on Windows 10](https://codefaq.org/server/how-to-install-nginx-php-mysql-on-windows-10/) to complete the following tasks. 
   1. install Nginx, PHP and MySQL on the Windows server VM
   2. Copy [demo_post.php](./code/demo_post.php) to the default website of Nginx
   3. From Ubuntu, start Wireshark capture, then access and play with http://windowsServerIP/demo_post.php.
   4. Save and investigate the Wireshark capture in Ubuntu. Can you extract the money transactions?

## Reference
* *Concepts*
  * [List of TCP and UDP port numbers](https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers)
  * [Network reconnaissance](https://en.citizendium.org/wiki/Network_reconnaissance)
  * [Network reconnaissance and vulnerability assessment](https://witestlab.poly.edu/blog/network-reconnaissance-and-vulnerability-assessment/)
* *Labs*
  * [Network Reconnaissance Lab](https://www.usna.edu/Users/cs/wcbrown/courses/si110AY13S/lec/l33/lec.html)
  * [Samsclass: Ethical Hacking and Network Defense](https://samsclass.info/123/123_F18.shtml)
    * [Project 5: nmap](https://samsclass.info/123/proj10/123p5nmap.htm)
    * [Project 6: Wireshark](https://samsclass.info/123/proj14/123p6wire.htm)
* [Wireshark](https://en.wikipedia.org/wiki/Wireshark)
  * [wireshark](https://www.wireshark.org/)
    * [CapturePrivileges](https://wiki.wireshark.org/CaptureSetup/CapturePrivileges)
* [Tcpdump](https://en.wikipedia.org/wiki/Tcpdump)
* [Kismet](https://en.wikipedia.org/wiki/Kismet_(software))
* [Port scanner](https://en.wikipedia.org/wiki/Port_scanner)
* [Idle scan](https://en.wikipedia.org/wiki/Idle_scan)
* [Nmap](https://en.wikipedia.org/wiki/Nmap)
  * [nmap syntax](https://svn.nmap.org/nmap/docs/nmap.usage.txt)
  * [nmap manual](https://nmap.org/book/man.html)
  * [zenmap](https://nmap.org/zenmap/)
* [Hping](https://en.wikipedia.org/wiki/Hping)
  * [hping](http://www.hping.org/)
* [KpyM Telnet / SSH Server](http://www.kpym.com/2/kpym/download.htm)
* [hk-telnet-server](https://sourceforge.net/projects/hk-telnet-server/)
* [TheSSS (The Smallest Server Suite)](https://sourceforge.net/projects/thesss/)
* [filezilla](https://filezilla-project.org/)
* [How to Install Nginx, PHP, and MySQL on Windows 10](https://codefaq.org/server/how-to-install-nginx-php-mysql-on-windows-10/)
* *Linux server*
  * [Ubuntu server](https://ubuntu.com/server/docs)
* *Windows server*
  * [Setup FTP Server with PowerShell](https://ridicurious.com/2020/07/02/setup-ftp-server-with-powershell/)
  * [Installation of OpenSSH For Windows Server 2019 and Windows 10](https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse)
  * [How To Use PowerShell and IIS to Automate Websites](https://adamtheautomator.com/powershell-iis/)
  * [Install AD DS, DNS, and DHCP using Powershell on Windows Server 2016](https://medium.com/@eeubanks/install-ad-ds-dns-and-dhcp-using-powershell-on-windows-server-2016-ac331e5988a7)
* [Private network](https://en.wikipedia.org/wiki/Private_network)
  * [Selecting IP Addresses on a Host-only Network or NAT Configuration](https://www.vmware.com/support/ws55/doc/ws_net_advanced_ipaddress.html)
