# its250
Online resources and examples

## Lab01: Setup lab environment
### 1.Description
**In this lab, we will build our own penetration test toolset incrementally instead of using existent ones such as Kali Linux.**

* Install [VMware Workstation Player](https://www.vmware.com/products/workstation-player.html) or [VirtualBox](https://www.virtualbox.org/) on your PC. The physical computer you use is called a "Host". The virtual machines that run on it are called "Guests". 
* Create a virtual machine for Ubuntu Linux
* Create a virtual machine for Windows server
* *Rule of thumb to choose software: always choose the latest and STABLE version*

**Prerequisite:**

Your PC must support virtualization which is popular today, following the section 'Check virtualization availability' in the reference to find its availability and enable it.

### 2.Steps
1. (20%, 10% for each VM) Create two virtual machines, one for Ubuntu Linux, the other for Windows server
   * NAT network settings:
     * Use VMnet8 in VMware Workstation Player, or
     * Create a NAT network in VirtualBox
   * VM settings:
     * *2GB memory/100GB dynamic disk*
     * Connect to VMnet8/NAT network
     * It is a best practice to set VM's IP address statically
     * Enable network promiscuous mode


2. (30%)Install Ubuntu Linux
Follow the steps below to setup Ubuntu mate Linux in its VM:

   * (5%)Download [Ubuntu Mate Linux](https://ubuntu-mate.org/download/) from its official website --- [https://ubuntu-mate.org](https://ubuntu-mate.org). Choose the 64-Bit ISO.
   * (10%)Install the downloaded Ubuntu Mate Linux
   * (10%)Update Ubuntu Mate Linux then install popular tools


After installation, *make sure you can access Internet*, update and upgrade Ubuntu, then install the following tools. Open a terminal window, run the following commands:

```bash
sudo apt update
sudo apt upgrade -y
sudo apt install apt-transport-https dirmngr vim geany okular
sudo apt install p7zip-full build-essential gcc perl cmake automake curl git 
```
   * (5%)Install VMWare tool/VirtualBox Guest Additions in the guest Ubuntu.

3. (30%)Install Windows server

   * (5%)Download [Windows Server 2019 ISO](https://www.microsoft.com/en-us/windows-server)
   * (10%)Install this Windows server
   * (10%)Enable ping response in the firewall settings of the guest Windows server
   * (5%)Install VMWare tool/VirtualBox Guest Additions in the guest Windows server

4. (10%, 2% each) Show the NAT network is working
	 * On the Windows host, find the ip configuration of Ethernet adapter VMware Network Adapter VMnet8: 	ipconfig /all
	 * On the Windows Server VM, find its ip configuration of the Ethernet adapter connected to the NAT: 	ipconfig /all
	 * On the Ubuntu Linux VM, find its ip configuration of the Ethernet adapter connected to the NAT: 	ifconfig -a
	 * from the Windows server VM ping the Ubuntu VM
	 * from the Ubuntu VM ping the Windows server VM

5. (20%) **Review questions**

In the following two practices, screenshots of at least TEN commands are required to put in the lab report. To decrease the number of screenshots, you may put 5 commands in one screenshot, then two screenshots are sufficient.

   1. (10%) Practice basic Linux commands in the [Linux commands cheatsheet](./commandCheatsheets/LinuxCommandMemento.pdf)
   2. (10%) Practice basic Windows commands in the [Windows commands cheatsheet](./commandCheatsheets/CommandPromptCheatsheet.pdf)

6. (Optional)Install Kali Linux
Create a VM for Kali Linux then follow the steps below to setup Kali Linux in its VM:

   * Download [Kali Linux](https://www.kali.org/downloads/) from its official website --- [https://www.kali.org/](https://www.kali.org/). Choose the 64-Bit Installer ISO.
   * Install the downloaded Kali Linux following its [official installation instructions](https://www.kali.org/docs/installation/hard-disk-install/)
   * Update Kali Linux then install popular tools


After installation, *make sure you can access Internet*, update and upgrade Ubuntu, then install the following tools. Open a terminal window, run the following commands:

```bash
# 1. populate the repository
# use a text editor open /etc/apt/sources.list with sudo then add the following two lines if there are not there
deb http://http.kali.org/kali kali-rolling main contrib non-free
deb-src http://http.kali.org/kali kali-rolling main contrib non-free
# 2. update, upgrade Kali then install several popular tools
sudo apt update
sudo apt full-upgrade -y
sudo apt install apt-transport-https dirmngr
sudo apt install p7zip-full build-essential gcc perl cmake automake curl git geany okular vim
```
   * Install VMWare tool/VirtualBox Guest Additions in the guest Kali Linux.


**Demo video**

[Lab01: Setup lab environment](https://youtu.be/C1196ysEem4)

## References
* *Check virtualization availability*
  * [Linux Find Out If CPU Support Intel VT/AMD-V Virtualization For KVM](https://www.cyberciti.biz/faq/linux-xen-vmware-kvm-intel-vt-amd-v-support/)
  * [Easy Ways to Check If Your Processor Supports Virtualization](https://www.technorms.com/8208/check-if-processor-supports-virtualization)
  * [How to find out if Intel VT-x or AMD-V virtualization technology is supported?](https://www.auslogics.com/en/articles/how-to-find-out-if-intel-vt-x-or-amd-v-virtualization-technology-is-supported/)
  * [How to check if Intel Virtualization is enabled without going to BIOS in Windows 10](https://stackoverflow.com/questions/49005791/how-to-check-if-intel-virtualization-is-enabled-without-going-to-bios-in-windows)
  * [How to Enable Intel VT-x in Your Computer’s BIOS or UEFI Firmware](https://www.howtogeek.com/213795/how-to-enable-intel-vt-x-in-your-computers-bios-or-uefi-firmware/)
  * [Virtualization (VT-x/AMD-V) - Enabling virtualization on your computer for running 2N® Access Commander](https://2nwiki.2n.cz/pages/viewpage.action?pageId=75202968)
* *VM manager*
  * [VMware Workstation Player](https://www.vmware.com/products/workstation-player.html)
    * [Promiscuous Mode by Default?](https://communities.vmware.com/t5/VMware-Workstation-Pro/Promiscuous-Mode-by-Default/td-p/2717392)
    * [Using Virtual Ethernet Adapters in Promiscuous Mode on a Linux Host](https://kb.vmware.com/s/article/287)
  * [VirtualBox](https://www.virtualbox.org/)
  * [Hyper-V](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v)
* [Top 21 Operating Systems For Ethical Hacking And Pen Testing](https://techlog360.com/top-ethical-hacking-operating-systems/)
  * [Kali Linux](https://www.kali.org/)
* [Linux distribution](https://en.wikipedia.org/wiki/Linux_distribution)
  * [List of Linux distributions](https://en.wikipedia.org/wiki/List_of_Linux_distributions)
  * [Comparison of Linux distributions](https://en.wikipedia.org/wiki/Comparison_of_Linux_distributions)
  * [Light-weight Linux distribution](https://en.wikipedia.org/wiki/Light-weight_Linux_distribution)
* [Windows Server evaluation center](https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server)
* *command line basics*
  * [Linux journey](https://linuxjourney.com/)
  * [Windows commands cheatsheet](./commandCheatsheets/CommandPromptCheatsheet.pdf)
  * [Linux commands cheatsheet](./commandCheatsheets/LinuxCommandMemento.pdf)
* _old os_
  * [WinWorld](https://winworldpc.com/library/operating-systems)
  * [Old versions of Linux](https://soft.lafibre.info/)
  * [archiveos](https://archiveos.org/)
* [Install Kali on VMware](https://samsclass.info/152/proj/M108.htm)
* [Kali Linux and Windows server 2012 VMs](https://drive.google.com/drive/folders/1fT7DlwAQjaDjCRsDDSDtaYZU2sCSLa_v)
  * Windows user/pass: Lab250/toor, Administrator/Admin123
  * Kali user/pass: root/toor
* [Immersive learning games](https://drive.google.com/drive/folders/1lrMrlt7txA1VviePt4koUjyxB6nedtLg)