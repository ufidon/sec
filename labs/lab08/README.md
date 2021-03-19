# its250
Online resources and examples

## Lab08: Malware analysis I: basic static analysis

### 1. Description


**Prerequisite**

1. Work in the Windows VM with protection disabled in Lab03.
2. Download [PracticalMalwareAnalysis-Labs.7z](https://github.com/mikesiko/PracticalMalwareAnalysis-Labs), archive password is "malware".
3. Download [tools](./tools/tools.7z), archive password is "its250".

### 2. Tasks (100%)
1. (10%) Analyze malware with online tools, such as [virustotal](https://www.virustotal.com/)
   1. (4%) Upload file 'Practical Malware Analysis Labs\BinaryCollection\Chapter_1L\Lab01-01.dll' to [virustotal](https://www.virustotal.com/) and check the analysis result
   2. (6%, each hash 2%) Find the MD5, SHA1, SHA256 of Lab01-01.dll, then search these hashes on [virustotal](https://www.virustotal.com/), did you get the identical result as previous step?
2. (10%) Analyze PE files with PE tools such as [filealyzer](https://www.safer-networking.org/products/filealyzer/).
   1. (5%) Use filealyzer to analyze file 'Practical Malware Analysis Labs\BinaryCollection\Chapter_1L\Lab01-01.exe', find the field characteristics in its PE header.
   2. (5%) Use [PEiD](https://www.aldeid.com/wiki/PEiD) to find what language Lab01-01.exe is written in, or what packer is used if it's packed.
3. (15%) Use [BinText](https://www.aldeid.com/wiki/BinText) to analyze Lab01-01.exe and Lab01-01.dll.
   1. (5%) Find the following information in Lab01-01.exe

   | information | purpose |
   | ----------- | ------- |
   | FindNextFileA, FindFirstFileA | Windows API functions used to search through a directory |
   | _stricmp | Compares a string to a desired value |
   | kerne132.dll | A deceptive filename to make the malware look like a Windows system file |
   | C:\windows\system32\kerne132.dll | The full path to a malicious file, very likely a useful Indicator of Compromise |

   2. (5%) Find the filename it downloads from domain: practicalmalwareanalysis.com in Lab01-04.exe. 
   3. (5%) Find the following information in Lab01-01.dll and answer the questions.

   | information | purpose |
   | ----------- | ------- |
   | Sleep | Windows API function used to sleep |
   | CreateProcessA | Windows API function used to launch a program |
   | sleep and hello | Commands that can be sent over the network to tell the malware to sleep, and some function called "hello" |
   | exec | a command to launch a program  |

      1. What is the ip address beginning with 127?

4. (10%) Use [Dependencies](https://github.com/lucasg/Dependencies) to find the dynamic libraries used by Lab01-01.exe and Lab01-01.dll.
   1. (5%, 2.5% for each sub question) Open Lab01-01.exe in Dependencies, find 
      1. the dynamic library that exports function _stricmp
      2. the dynamic library that exports Windows API FindNextFileA and FindFirstFileA.
   2. (5%, 2.5% for each sub question) Open Lab01-01.dll in Dependencies, find 
      1. the dynamic library that exports networking functions bind, accept and connect, etc.
      2. the dynamic library that exports mutex functions such as CreateMutexA and OpenMutexA
5. (40%, 5% for each sub question)Unpack malware. Lab files used: Lab01-02.exe and Lab01-03.exe
   1.  Use BinText find the strings in Lab01-02.exe
   2.  Find the packer used to pack Lab01-02.exe in PEiD
   3.  Use FileAlyzer to find the PE sections in Lab01-02.exe related to the packer found in previous step
   4.  Unpack Lab01-02.exe with [UPX](https://github.com/upx/upx/releases/tag/v3.95)
   5.  Analyze the unpacked file with PEiD again
   6.  Find the unpacked file's imports with Dependencies
   7.  Find the strings in the unpacked file using BinText
   8.  Find the packer used to pack Lab01-03.exe
6. (15%, 5% for each)Use [capa](https://github.com/fireeye/capa) to find the capabilities of Lab01-01.exe, Lab01-01.dll and Lab01-04.exe


### 3. Review questions (Optional)
* Customize and build [UPX](https://github.com/upx/upx/releases/tag/v3.95)

**Demo video**

* 

## Reference
* [Samscalss: Basic Static Techniques](https://bowneconsultingcontent.com/pub/PMA/pma101a/pma101.html)
* [Samscalss: Unpacking](https://bowneconsultingcontent.com/pub/PMA/pma102/PMA102c.html)
* [Samsclass: Capa](https://samsclass.info/126/proj/PMA110.htm)
* [Samsclass: Custom UPX](https://samsclass.info/126/proj/PMA131a.htm)
* [Dependency Walker with kernel32.dll on Windows 10](https://stackoverflow.com/questions/33604738/dependency-walker-with-kernel32-dll-on-windows-10)
* [Analyzing dependencies with Dependency Walker](https://kb.froglogic.com/misc/using-dependency-walker/)
* [Link an executable to a DLL](https://docs.microsoft.com/en-us/cpp/build/linking-an-executable-to-a-dll)