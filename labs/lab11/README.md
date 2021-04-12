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
3. Download [bintool.7z](./tools/bintool.7z), archive password is "bintool"
4. Right click any file, from the popup menu find the item 'CRC SHA', if you don't have this, download and install [7-zip](https://www.7-zip.org/)
5. Download [x64dbg](https://github.com/x64dbg/x64dbg) and extract it.


### 2. Tasks (100%)
1. (40%) With x64dbg 32-bit, practice dynamic analysis techniques on the following samples. The addresses below may be different on you machine, it is fine.
   1. (23%,1% for each step) Analyzing sample [putty]() with the following steps:
      1. Find and record the popular Hashes of putty.exe with "CRC SHA" right-click popup menu entry
      2. Create a local user

      ```batch
      net user biden P@ssw0rd /add
      ```

      3. Run putty.exe, login local machine using the local user created above through SSH protocal
      4. Exit the SSH login then close putty
      5. Start x64dbg 32-bit and load putty.exe
      6. Run putty in x64dbg, it will stop at its entry-point
      7. Find the "login as" string in x64dbg, find all its xrefs (cross-referenes), there are two
      8. Set breakpoints at those xrefs
      9. Continue running putty in x64dbg, from the popup login dialog, login local machine through SSH protocal, it will stop at the "login as" windows due to the breakpoints
      10. Alter the login message. Right-click the current with breakpoint, choose assembly from the popup menu, change the instruction "push 0x129B18E" into "push 0x129B18F"
      11. Click step-over in the debugger, "login as" now becomes "ogin as", the first letter 'l' is removed
      12. Continue running putty, now the message in the popup login windows becomes "ogin as"
      13. Right-click the current instruction line, from the popup menu, choose patch, save the patched file as puttymod.exe
      14. Run the modified puttymod.exe, login local machine using the local user created above through SSH protocal. Pay attention to the login message, which should be "ogin as"
      15. Load the patched puttymod.exe in x64dbg, run and stop at its entry point. Find the "ogin as" string in x64dbg, find all its xrefs (cross-referenes), there is one, set a breakpoint there.
      16. Continue running puttymod, in the login window, the message is "ogin as", and the program stopped at the breakpoint just set
      17. Right click the current instruction line, from the popup menus, choose "Follow in dump" -> puttymod.002BB18F
      18. In the dump windows, select "ogin as", right click, from the popup menu, choose edit. Change "ogin as" to "welcome" in the edit dialog box. Click OK to close the edit box, now "welcome" is shown in the instruction line as well
      19. Continue running putty, now the message in the popup login windows becomes "welcome"
      20. Right-click the current instruction line, from the popup menu, choose patch, save the patched file as puttywel.exe
      21. Run puttywel.exe, login local machine using the local user created above through SSH protocal. Pay attention to the login message, which should be "welcome" now
      22. Find the binary difference between putty.exe and puttymod.exe, putty.exe and puttywel.exe using command fc
      23. Find and record the popular Hashes of puttymod.exe and puttywel.exe, pay attention to their dramatic difference
  2.  (17%) Change program behavior through patching in x64dbg. Patch 00000.exe to make it accept any input.
      1.  (2%) Find and record the popular Hashes of 00000.exe with "CRC SHA" right-click popup menu entry
      2.  (2%) Run and play with 00000.exe, can you guess the right launch code?
      3.  (2%) Examine 00000.exe with x64dbg, find how it works
      4.  (2%) Patch 00000.exe so that it will output the answer with any input by modifying only two bytes, save the patched file as 00000x.exe
      5.  (2%) Test that 00000x.exe outputs the answer with any input
      6.  (2%) Use fc to compare 00000.exe and 00000x.exe, find the offset of the modified bytes
      7.  (2%) Use vbindiff.exe to compare 00000.exe and 00000x.exe, find the offset of the modified bytes
      8.  (3%) Use bintool32.exe to patch 00000.exe, save the patched file as 00000y.exe. Find the CRC SHA hashes of 00000x.exe and 00000y.exe, are they identical?

2. (60%) Patch programs using command line tools
   1. (10%) use bintool32.exe to patch the three exe files in folder 3EXEs, each file output a single character. What are they?
      1. (2%) Play with the exe files, try at least two
      2. (3%) Patch the exe files
      3. (3%) Run the patched exe files and collect the outputs
      4. (2%) Collect the single character from each patched exe file output, put them in the alphabetical order of the exe file names.
   2. (20%) use bintool32.exe to patch the 19 exe files in folder easy, each file output a single character. What are they?
      1. (4%) Play with the exe files, try at least two
      2. (6%) Patch the exe files
      3. (6%) Run the patched exe files and collect the outputs
      4. (4%) Collect the single character from each patched exe file output, put them in the alphabetical order of the exe file names.
   3. (30%) use bintool32.exe to patch the 19 exe files in folder 256exes, each file output a single character. What are they?
      1. (6%) Play with the exe files, try at least two
      2. (9%) Patch the exe files
      3. (9%) Run the patched exe files and collect the outputs
      4. (6%) Collect the single character from each patched exe file output, put them in the alphabetical order of the exe file names.


### 3. Review questions (Optional)
* Complete the projects below:
  1. [Hacking Minesweeper with Ollydbg](https://samsclass.info/126/proj/PMA402.htm)
  2. [Hints for Patching EXEs with Ollydbg](https://samsclass.info/126/proj/pDC14-hints.htm)

**Demo video**



## Reference
* _debuggers_
  * [WinDbg](https://en.wikipedia.org/wiki/WinDbg)
  * [ImmunityDebugger](https://github.com/kbandla/ImmunityDebugger)
  * [ollydbg](http://www.ollydbg.de/download.htm)
  * [putty](https://www.putty.org/)
* _file tools_
  * [sigcheck](https://docs.microsoft.com/en-us/sysinternals/downloads/sigcheck)
  * [putty](https://www.putty.org/)
  * [vbindiff](https://www.cjmweb.net/vbindiff/)
* _articles_
  * [Reverse Engineering with OllyDbg](https://erichokanson.me/2015/04/17/reverse-engineering-with-ollydbg/)
    * [Ollydbg 'Copy all modifications to executable' doesn't copy all modifications](https://reverseengineering.stackexchange.com/questions/3579/ollydbg-copy-all-modifications-to-executable-doesnt-copy-all-modifications)
  * [Backdooring PE Files - Part 1](https://sector876.blogspot.com/2013/03/backdooring-pe-files-part-1.html)
    * [Art of Anti Detection 2 – PE Backdoor Manufacturing](https://pentest.blog/art-of-anti-detection-2-pe-backdoor-manufacturing/)
  * [Cminer is a tool for enumerating code caves in PE files](https://github.com/EgeBalci/Cminer)
    * [Code cave](https://en.wikipedia.org/wiki/Code_cave)
    * [What is a code cave, and is there any legitimate use for one?](https://stackoverflow.com/questions/787100/what-is-a-code-cave-and-is-there-any-legitimate-use-for-one)
    * [The Beginners Guide to Codecaves](https://www.codeproject.com/Articles/20240/The-Beginners-Guide-to-Codecaves)
