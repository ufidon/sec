# its250
Online resources and examples

## Lab09: Malware analysis II: basic dynamic analysis

### 1. Description
Practice basic dynamic analysis techniques on malware with various tools:
* Run and monitor malware behaviors
* Find malware's creation/deletion/modification of files/registries
* Monitor malware's network activities
* Remove malware persistence and traces

This lab is revised from [Samscalss: Basic dynamic analysis](https://bowneconsultingcontent.com/pub/PMA/pma221/pma221.htm).

**Prerequisite**

1. Work in the Windows VM with protection disabled in Lab03.
2. Download [malware.7z](./tools/malware.7z), archive password is "malware".
3. Install Visual Studio C++, following this [video](https://youtu.be/vtiv_vyaKk0), from time 2:20 to 11:38. The installation may take half to one hour, depending on the performance of your computer. VS is used for the optional task and future labs.

### 2. Tasks (100%)
1. (18%) Start malware analysis with static analysis tools
   1. (9%, 3% for each) Use [capa](https://github.com/fireeye/capa) to find the capabilities of the three malwares: key.exe, key12.exe and key13.exe
   2. (9%, 3% for each) Use Use [BinText](https://www.aldeid.com/wiki/BinText) to analyze the three malwares: key.exe, key12.exe and key13.exe to confirm the conclusion gotten in previous step. Meanwhile, find the following interesting strings.

   | Malware sample | Interesting strings |
   | -------------- | ------------------- |
   | key.exe | log.txt, key.exe, C:\windows\vmx32to64.exe, Software\Microsoft\Windows\CurrentVersion\Run; #UP_ARROW_KEY, #DOWN, #DOWN_ARROW_KEY |
   | key12.exe | log.txt, key12.exe, C:\windows\niceness.exe, Software\Microsoft\Windows\CurrentVersion\Run; http://ad.samsclass.info?flag=exfiltration, flag1.samsclass.info; #UP_ARROW_KEY, #DOWN, #DOWN_ARROW_KEY |
   | key13.exe | log.txt, key13.exe, C:\windows\niceness.exe, Software\Microsoft\Windows\CurrentVersion\Run; http://ad.samsclass.info?flag=exfiltration; #UP_ARROW_KEY, #DOWN, #DOWN_ARROW_KEY |

2. (4%, 1% for each) Prepare tools for basic dynamic analysis, show a screenshot for each running tool
   1. Download [Process Explorer](https://docs.microsoft.com/en-us/sysinternals/downloads/process-explorer), [Process Monitor](https://docs.microsoft.com/en-us/sysinternals/downloads/procmon) and [Autoruns for Windows](https://docs.microsoft.com/en-us/sysinternals/downloads/autoruns)
   2. Download and install [Wireshark](https://www.wireshark.org/)
   3. Run all the tools
      1. In process monitor, exclude all processes
      2. In Wireshark, start capture
3. (26%) Analyze key.exe
   1. (1%) Run key.exe as Administrator
   2. (4%) Stop Wireshark capture since key.exe does not use Internet
   3. (3%) Analyze key.exe process in Process Explorer
   4. (12%, 4% for each) Analyze key.exe process in Process Monitor
      1. It creates an executable file in the Windows directory, find the executable
      2. It creates persistence by modifying the run registry key for the current user, find the registry key
      3. Open notepad and type some text, then go to the folder where key.exe is, find log.txt and open it. You see the captured keystrokes.
   5. (2%) In Process Explorer, right click key.exe and choose Kill Process. This stops the keylogger for the current session. However, the malware has written autorun entry into the registry, so it will start back up at the next reboot.
   6. (2%) Restart the machine, Open Process Explorer, find and click the new keylogger file, vmx32to64.exe. From the Process Explorer menu bar, click View, "Show Lower Pane" View, "Lower Pane View", Handles for more info.
   7. (2%) Remove persistence. Run Autoruns for Windows, find the registry key created by key.exe and delete it.
4. (26%, distributed as previous one) Analyze key12.exe. Practice all dynamic analysis as previous one on this sample and find its network activities (DNS traffic: DNS response for flag1.samsclass.info, ...flag-is- ... ) with Wireshark.
5. (26%, distributed as previous one) Analyze key13.exe. Practice all dynamic analysis as previous one on this sample and find its network activities (HTTP traffic: HTTP GET /?flag=... ) with Wireshark.


### 3. Review questions (Optional)
* Complete the project [Samscalss: Making a Windows Keylogger](https://bowneconsultingcontent.com/pub/PMA/pma221/PMA222.htm)

**Demo video**



## Reference
* [Samscalss: Basic dynamic analysis](https://bowneconsultingcontent.com/pub/PMA/pma221/pma221.htm)
* [Samscalss: Making a Windows Keylogger](https://bowneconsultingcontent.com/pub/PMA/pma221/PMA222.htm)
* [Samsclass: Capa](https://samsclass.info/126/proj/PMA110.htm)
* [How to exclude every process in Sysinternal's Process Monitor in the filter except for one process?](https://superuser.com/questions/372204/how-to-exclude-every-process-in-sysinternals-process-monitor-in-the-filter-exce)
