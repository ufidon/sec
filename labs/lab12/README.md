# its250
Online resources and examples

## Lab12: Malware reverse-engineering 

### 1. Description
Practice reverse-engineering techniques on malwares to find their functionalities and inner logics.

* decompile malware
* find malware inner logic
* exploit decompiled code

The following tools will be used:
* [x64dbg](https://github.com/x64dbg/x64dbg)
* [ILSpy](https://github.com/icsharpcode/ILSpy)
* [Visual Studio](https://visualstudio.microsoft.com/downloads/)
* [Python 3](https://www.python.org/downloads/)
* [CFF explorer](https://ntcore.com/?page_id=388)
* [strings](https://docs.microsoft.com/en-us/sysinternals/downloads/strings)


This lab is revised from [Samsclass: Reversing a .NET Executable](https://samsclass.info/126/proj/PMA132.htm).

**Prerequisite**

1. Work in the Windows VM with protection disabled in Lab03.
2. Download [samples.7z](./samples/samples.7z) and unzip it.
3. Right click any file, from the popup menu find the item 'CRC SHA', if you don't have this, download and install [7-zip](https://www.7-zip.org/)
4. Download [x64dbg](https://github.com/x64dbg/x64dbg) and extract it.
5. Download [ILSpy](https://github.com/icsharpcode/ILSpy) and extract it.
6. Download [strings](https://docs.microsoft.com/en-us/sysinternals/downloads/strings) and extract it.
7. Download [Python 3](https://www.python.org/downloads/) and install it.
8. If you didn't install Visual Studio in Lab09, download [Visual Studio](https://visualstudio.microsoft.com/downloads/) and install it following this [video](https://youtu.be/vtiv_vyaKk0), from time 2:20 to 11:38.
9. [Install .NET 3.5 on Windows Server 2019](https://support.solarwinds.com/SuccessCenter/s/article/Install-NET-3-5-on-Windows-Server-2019?language=en_US)
   ```batch
   REM 1. Run Command Prompt as administrator, execute the following command:
   DISM /Online /Enable-Feature /FeatureName:NetFx3 /All
   REM 2. From Server Manager, install .Net Framework 3.5
   ```

### 2. Tasks (90%)
1. (30%) Reverse-engineering Challenge1.exe
   1. (2%) Play and observe the sample
   2. (3%) Run the sample in x64dbg 64-bit, does it stop at its entry point?
   3. (4%) Open the sample in CFF explorer by right-click the sample and choose 'Open with CFF Explorer' from the popup menu. From CFF Explorer, find
      1. (2%) The file type of this sample
      2. (2%) the machine type on which this sample supposed to run
   4. (5%) Find the strings of this sample with strings.exe, save them in a text file, can you find 'flare' from the texts?
   5. (6%) Decompile the sample with ILSpy, then
      1. (2%) find the decompiled C# code of btnDecode_Click method
      2. (2%) find the input data to decode, which is in the Resource dat_secret
      3. (2%) save dat_secret.encode
   6. Exploit the decompiled C# code directly, 
      1. (5%) write a simple C# program to decode the file 'dat_secret.encode', 
      2. (5%) compile the C# program, decode the file 'dat_secret.encode', find the secret
2. (30%) Reverse-engineering PMA132.exe
   1. (2%) Play and observe the sample
   2. (3%) Run the sample in x64dbg 64-bit, does it stop at its entry point?
   3. (4%) Open the sample in CFF explorer by right-click the sample and choose 'Open with CFF Explorer' from the popup menu. From CFF Explorer, find
      1. (2%) The file type of this sample
      2. (2%) the machine type on which this sample supposed to run
   4. (5%) Find the strings of this sample with strings.exe, save them in a text file, can you find 'DOTNET' from the texts?
   5. (6%) Decompile the sample with ILSpy, then
      1. (2%) find the decompiled C# code of btnDecode_Click method
      2. (2%) find the input data to decode, which is in the Resource dat_secret
      3. (2%) save dat_secret.encode
   6. Exploit the decompiled C# code directly, 
      1. (5%) write a simple C# program to decode the file 'dat_secret.encode', 
      2. (5%) compile the C# program, decode the file 'dat_secret.encode', find the secret
4. (30%) Reverse-engineering MemeCatBattlestation.exe
   1. (2%) Play and observe the sample. This sample game asks for two "weapon arming codes".
   2. (3%) Run the sample in x64dbg 64-bit, does it stop at its entry point?
   3. (4%) Open the sample in CFF explorer by right-click the sample and choose 'Open with CFF Explorer' from the popup menu. From CFF Explorer, find
      1. (2%) The file type of this sample
      2. (2%) the machine type on which this sample supposed to run
   4. (5%) Find the strings of this sample with strings.exe, save them in a text file, can you find 'Kitteh' from the texts?
   5. (6%) Decompile the sample with ILSpy, then
      1. (2%) find the decompiled C# code of FireButton_Click method
      2. (2%) find the first weapon arming code
      3. (2%) find the decompiled C# code of isValidWeaponCode method
   6. Exploit the decompiled C# code indirectly, 
      1. (2%) try the first weapon arming code to see it works
      2. (3%) write a simple Python program to decode the second weapon code, 
      3. (3%) run the Python program, decode the second weapon code
      4. (2%) try the second weapon arming code to see it works

### 3. Review questions (10%)
The final grade of this course is the weighted sum of the following assessments:

| Assessment | Weight |
| ---------- | ------ |
| Labs | 60% |
| Quizzes | 10% |
| Midterm Exam | 15% |
| Final Exam | 15% |
| Total | 100% |

Based on the table above, answer the following questions:
1. (2%) There are 8 quizzes, their assigned scores are 50/50/37/59/30/42/30/15. If you forgot doing quiz 4, how many points will be lost from your final grade?
2. (4%) Each lab is assigned 100 points and there are 12 labs, 
   1. (2%) if you forgot submitting 2 labs, how many points will be lost from your final grade?
   2. (2%) if you missed 6 labs, can you pass this course? The pass score is 70%.
3. (2%) If you forgot doing all quizzes, can you get an A (90%) in this course?
4. (2%) If you got 70% in both exams, how many points will be lost from your final grade? Can you get an A (90%) in this course?


**Demo video**



## Reference
* [Samsclass: Reversing a .NET Executable](https://samsclass.info/126/proj/PMA132.htm)
  * [ILSpy](https://github.com/icsharpcode/ILSpy)
  * [cyberdefenders](https://cyberdefenders.org/labs/)
  * [The FLARE On Challenge Solutions](https://www.fireeye.com/blog/threat-research/2014/11/the_flare_on_challen.html)
* [Samsclass: Unpacking with OllyDbg and pestudio](https://samsclass.info/126/proj/PMA121.htm)
  * [The Basics of Packed Malware: Manually Unpacking UPX Executables](https://malware.news/t/the-basics-of-packed-malware-manually-unpacking-upx-executables/35961)
  * [UPX Anti-Unpacking Techniques in IoT Malware](https://cujo.com/upx-anti-unpacking-techniques-in-iot-malware/)
  * [Use pestudio](https://medium.com/@aubsec/pestudio-standard-f2ada4e8564)
  * [How to prevent “upx -d” on an UPX packed executable?](https://reverseengineering.stackexchange.com/questions/3323/how-to-prevent-upx-d-on-an-upx-packed-executable)