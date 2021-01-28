# its250
Online resources and examples

## Lab03: CVE investigation

### 1. Description
In this lab, take an investigation on the vulnerabilities of Windows, Linux and MacOS, then lower Windows server security settings for future labs.

### 2. Steps
1. (30%, 10% for each operating system) CVE investigation. On the [official cvedetails website](https://www.cvedetails.com/), find ONE 10-score vulnerability for each of Windows, Linux and MacOS. Choose Product search on the left panel, type in Windows, Linux and MacOS respectively. For each vulnerability, gather the following information (2% for each)
   1. vulnerability type
   2. products affected
   3. impact on CIA (Confidentiality, Integrity, and Availability)
   4. exploitation: metasploit module availability, access complexity, authentication requirement, gained access.
   5. fix, update or patch
2. (50%, 10% for each)Lower Windows server security settings following task 2 in Samsclass [H 2: Windows 2016 Server Virtual Machine](https://www.bowneconsultingcontent.com/pub/EH/proj/H2.htm).
   1. Blocking automatic updates
   2. Disabling IE Enhanced Security Configuration
   3. [Uninstall Windows defender](https://www.prajwal.org/uninstall-windows-defender-using-powershell-server-2019/)
   4. Turning Off the Firewall
   5. Lowering DEP Settings

### 3. Review question(20%, 5% each) 
Given the vulnerability [CVE-2008-4037](https://www.cvedetails.com/cve/CVE-2008-4037/) show the process of finding its metrics below following [Common Vulnerability Scoring System](https://en.wikipedia.org/wiki/Common_Vulnerability_Scoring_System).
1. Expoitability
2. impact
3. CVSS score
4. CVSS vector

### 4. The Heist of the Century(Optional)
A typical cyberattack consists of the [following steps](https://www.beyondtrust.com/blog/entry/7-steps-cyber-attack-can-protect-windows-privileged-accounts):

1. Reconnaissance
2. Scanning
3. Access and Escalation
4. Exfiltration
5. Sustainment
6. Assault
7. Obfuscation

Watch the movie [The Heist of the Century](https://en.wikipedia.org/wiki/The_Heist_of_the_Century_(film)), could you identify and describe the robbing steps similar to a typical cyberattack?

**Demo video**

* [CVE Investigation](https://youtu.be/Ny310X0SiDc)

## References:
* [cve](https://cve.mitre.org/)
  * [National Vulnerability Database](https://nvd.nist.gov/)
* [Common Vulnerabilities and Exposures](https://en.wikipedia.org/wiki/Common_Vulnerabilities_and_Exposures)
  * [Common Vulnerability Scoring System](https://en.wikipedia.org/wiki/Common_Vulnerability_Scoring_System)
* [metasploit-framework](https://github.com/rapid7/metasploit-framework)
  * [metasploit doc](https://docs.rapid7.com/metasploit/)
* [Metasploit Unleashed](https://www.offensive-security.com/metasploit-unleashed/)
  * [Metasploit, WannaCry and Windows update](https://www.coengoedegebure.com/metasploit-wannacry-windowsupdate/)
  * [Hacking Windows with Meterpreter](https://www.coengoedegebure.com/hacking-windows-with-meterpreter/)
* *Samsclass*
  * [A10: Setting Up VMs](http://bowneconsultingcontent.com/pub/Attack/proj/A10vms.htm)
  * [Bypassing Browser Memory Protections](https://www.blackhat.com/presentations/bh-usa-08/Sotirov_Dowd/bh08-sotirov-dowd.pdf)
  * [A11: Metasploit v. Windows ](http://bowneconsultingcontent.com/pub/Attack/proj/A11msf.htm)
  * [A13: ETERNALROMANCE v. Windows Server 2016](http://bowneconsultingcontent.com/pub/Attack/proj/A13Romance.htm)
  * [A14: Exploiting a Windows Domain](http://bowneconsultingcontent.com/pub/Attack/proj/A14DC.htm)
  * [H 2: Windows 2016 Server Virtual Machine](https://www.bowneconsultingcontent.com/pub/EH/proj/H2.htm)
  * [ED 308: Exploiting "Vulnerable Server" on Windows](https://samsclass.info/127/proj/ED308.htm)