# its250
Online resources and examples

## Lab11: Malware analysis IV: advanced dynamic analysis

### 1. Description
Practice advanced dynamic analysis techniques

* disassemble malware
* debug malware
* patch malware

on malware with debuggers:
* [x64dbg](https://github.com/x64dbg/x64dbg)
* [WinDbg](https://en.wikipedia.org/wiki/WinDbg)
* [ImmunityDebugger](https://github.com/kbandla/ImmunityDebugger)
* [ollydbg](http://www.ollydbg.de/download.htm)

This lab is revised from [Samscalss: Simple EXE Hacking with Ollydbg](https://samsclass.info/127/proj/PMA401.htm).

**Prerequisite**

1. Work in the Windows VM with protection disabled and OpenSSH installed in Lab03.
2. Download [samples.7z](./tools/samples.7z), archive password is "samples".
3. Right click any file, from the popup menu find the item 'CRC SHA', if you don't have this, download and install [7-zip](https://www.7-zip.org/)
4. Download [ollydbg 1.10](http://www.ollydbg.de/download.htm) and extract it.


### 2. Tasks (100%)
With ollydbg 1.10, practice dynamic analysis techniques on the following samples:


   

### 3. Review questions (Optional)
* Complete the projects below:
  1. [Hacking Minesweeper with Ollydbg](https://samsclass.info/126/proj/PMA402.htm)

**Demo video**



## Reference
* _debuggers_
  * [WinDbg](https://en.wikipedia.org/wiki/WinDbg)
  * [ImmunityDebugger](https://github.com/kbandla/ImmunityDebugger)
  * [ollydbg](http://www.ollydbg.de/download.htm)
  * [putty](https://www.putty.org/)
* _file tools_
  * [sigcheck](https://docs.microsoft.com/en-us/sysinternals/downloads/sigcheck)
* _articles_
  * [Reverse Engineering with OllyDbg](https://erichokanson.me/2015/04/17/reverse-engineering-with-ollydbg/)
    * [Ollydbg 'Copy all modifications to executable' doesn't copy all modifications](https://reverseengineering.stackexchange.com/questions/3579/ollydbg-copy-all-modifications-to-executable-doesnt-copy-all-modifications)
  * [Backdooring PE Files - Part 1](https://sector876.blogspot.com/2013/03/backdooring-pe-files-part-1.html)
    * [Art of Anti Detection 2 – PE Backdoor Manufacturing](https://pentest.blog/art-of-anti-detection-2-pe-backdoor-manufacturing/)
  * [Cminer is a tool for enumerating code caves in PE files](https://github.com/EgeBalci/Cminer)
    * [Code cave](https://en.wikipedia.org/wiki/Code_cave)
    * [What is a code cave, and is there any legitimate use for one?](https://stackoverflow.com/questions/787100/what-is-a-code-cave-and-is-there-any-legitimate-use-for-one)
    * [The Beginners Guide to Codecaves](https://www.codeproject.com/Articles/20240/The-Beginners-Guide-to-Codecaves)
