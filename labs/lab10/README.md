# its250
Online resources and examples

## Lab10: Malware analysis III: advanced static analysis

### 1. Description
Practice advanced static analysis techniques

* disassemble malware
* find the addresses of routines(functions) and data(variables)
* find the code flowchart of malware

on malware with disassemblers:
* IDA Pro
* Ghidra
* Radare2

This lab is revised from [Samscalss: Analyzing malwares with IDA Pro](https://samsclass.info/126/proj/PMA303c.htm).

**Prerequisite**

1. Work in the Windows VM with protection disabled in Lab03.
2. Download [malware.7z](./tools/malware.7z), archive password is "malware".
3. Download [ida free](https://www.hex-rays.com/products/ida/support/download_freeware/) and install it with default options.


### 2. Tasks (100%)
With IDA free, analyze the following malwares:

1. (20%) Lab05-01.dll
   1. (5%) Open Lab05-01.dll in IDA free, it will be disassembled and the results will be displayed automatically
      1. Turn on the settings in IDA free to show line numbers (addresses) or hexadecimal instructions from  IDA Options box -> Disassembly tab -> "Display disassembly line parts" section, 
         1. Check "Line prefixes (graph)"
         2. Change "Number of opcode bytes" to 6
      2. Use SPACEBAR to switch between graph mode and text mode
   2. (7%) Find the Import for the Windows API function(actually, a macro) [gethostbyname](https://docs.microsoft.com/en-us/windows/win32/api/wsipv6ok/nf-wsipv6ok-gethostbyname). 
      1. In IDA Pro, from menu View -> "Open subview" -> Imports, then find gethostbyname then double click it
      2. the code for gethostbyname opens in Text mode, double click it then press CTRL+X to open the "xrefs to gethostbyname" box. There are many calls (xrefs, or cross-references) to gethostbyname. Double-click the one at address of 1001656+101, the caller appears in the IDA View, analyze the parameters passed to gethostbyname.
      3. double click one of the parameters named off_10019040, the Text view is brought up and shows that this location contains a pointer to a string containing "praticalmalwareanalys".
      4. Switch to "Hex View-1" tab, find the four bytes starting at 10019040, which contain a 32-bit address in little-endian order, find this address. At this address, there's a series of ASCII values containing the domain that will be resolved by calling gethostbyname.
   3. (8%) Examinine the Code that References "\cmd.exe /c"
      1. In IDA Pro, from menu View -> "Open subview" -> Strings, find the String "\\cmd.exe /c", double click it open the "IDA View-A".
      2. The string "\\cmd.exe /c" appears in text mode. Click in the word cmd so it's highlighted and press Ctrl+x. A "xrefs to aCmd_exeC" box appears, double click the ref sub_1000FF58+278. There are two boxes of code use this string, one that starts a string with "cmd.exe -c" and the other that starts it with "command.exe /c". This looks like a remote shell, executing commands from the botmaster for either a 32-bit or 16-bit system.
      3. Drag the code boxes down to see the module containing "Hi, Master". This looks like a message the bot sends to the botmaster, further confirming that this is a RAT (Remote Administration Tool).
      4. Close IDA. Don't save the database.
2. (80%) Find the conditions for each [crackme](https://en.wikipedia.org/wiki/Crackme) to see the congratulation message.
   1. (20%) crackme-121-1.exe ( Find a password)
   2. (20%) crackme-121-2.exe ( Find a password)
   3. (20%) crackme-121-3.exe ( Find a password)
   4. (20%) crackme-121-4.exe ( Find a command line)
   

### 3. Review questions (Optional)
* Complete the projects below:
  * [Samscalss: Assembly Code in Jasmin](https://samsclass.info/126/proj/PMA301.htm)
  * [Samsclass: C Constructs in Assembly](https://samsclass.info/126/proj/PMA304.htm)

**Demo video**

* [Lab10: Malware analysis III: advanced static analysis]()

## Reference
* [Samscalss: Analyzing malwares with IDA Pro](https://samsclass.info/126/proj/PMA303c.htm)
  * [IDA Freeware](https://www.hex-rays.com/products/ida/support/download_freeware/)
* [Samscalss: Assembly Code in Jasmin](https://samsclass.info/126/proj/PMA301.htm)
  * [Jasmin](https://github.com/TUM-LRR/Jasmin)
  * [jasmin](http://jasmin.sourceforge.net/)
* [Samsclass: C Constructs in Assembly](https://samsclass.info/126/proj/PMA304.htm)
* [ghidra](https://ghidra-sre.org/)
  * [The Ghidra Book](https://ghidrabook.com/)
  * [Samclass: Starting with Ghidra](https://samsclass.info/126/proj/PMA510.htm)
  * [Samclass: Ghidra data displays](https://samsclass.info/126/proj/PMA511.htm)
* [Crackme](https://en.wikipedia.org/wiki/Crackme)
  * [crackmes](https://crackmes.one/)
  * [codeforces](http://codeforces.com/)
