# its250
Online resources and examples

## Lab02: Cryptographical application

### 1.Description
Practice the following cryptographical techniques which used to implement the objectives described by CIANA model:
* C - Confidentiality
* I - Integrity
* A - Authenticity
* N - Non-repudiation
* A - Availability

You may do this lab on your host Windows or guest Windows.

### 2.Steps
1. (10%) Integrity: Quickhash-GUI
   * (4%) Download and install [Quickhash-GUI](https://www.quickhash-gui.org/), choose the one suitable to your operating system
   * (6%) Use Quickhash-GUI to check the integrity of the downloaded archive file

2. (30%) Confidentiality: CrypTool 2 and AESCrypt
   * (6%) Download [CrypTool 2](https://www.cryptool.org/) and [AESCrypt](https://www.aescrypt.com/),  check their integrity with Quickhash-GUI then install them
   * (8%) Inside CrypTool 2, encrypt then decrypt a message (type your own message) with Caesar cipher
   * (8%) Inside CrypTool 2, encrypt then decrypt a file (choose your own file) with AES cipher
   * (8%) Use AESCrypt to encrypt then decrypt a file

3. (30%) Authenticity and non-repudiation: Gpg4win
   * (6%) Download [Gpg4win](https://gpg4win.org/) and its signature, check its integrity then install it.
   * (8%) Create two pairs of RSA keys, one pair for you, the other for a virtual lab partner
   * (8%) Run Kleopatra, import the Intevation file distribution key, then Verify the downloaded signature against the downloaded Gpg4win archive file
   * (8%) Sign/Encrypt an image for your virtual lab partner, then decrypt/verify the signed/encrypted image file as your virtual lab partner

4. (20%) Confidentiality: Stego
   * (2%) Download an image online, use it as the cover image
   * (6%) Go to [StegOnline](https://stegonline.georgeom.net/upload), hide a message in the image downloaded, save the image with hidden message (stego image)
   * (6%) Compare the cover image and the stego image
   * (6%) Go to [StegOnline](https://stegonline.georgeom.net/upload) again, extract the message from the stego image

### 3.Reveiw questions
1. (10%) In 2.Steps 2.,  can the encrypted file with AES cipher in CrypTool 2 be decrypted by AESCrypt? or vise versa? Show you solution.

## References
* _online ciphers_
  * [practical cryptography](http://practicalcryptography.com/)
  * [cryptoprograms](http://www.cryptoprograms.com/)
  * [cryptii](https://cryptii.com/)
* [CrypTool](https://en.wikipedia.org/wiki/CrypTool)
  * [cryptool](https://www.cryptool.org/)
  * [Cryptography for Everybody](https://www.youtube.com/c/CrypTool2/playlists)
* [aescrypt](https://www.aescrypt.com/)
* [Pretty Good Privacy](https://en.wikipedia.org/wiki/Pretty_Good_Privacy)
  * [GNU Privacy Guard](https://en.wikipedia.org/wiki/GNU_Privacy_Guard)
  * [Gpg4win](https://en.wikipedia.org/wiki/Gpg4win)
    * [gpg4win](https://gpg4win.org/)
* [QuickHash GUI](https://www.quickhash-gui.org/)
* [Image/Audio/video steganography](https://www.darknessgate.com/category/anti-forensics-techniques/digital-steganography/audiovideo-steganography/)
  * [StegOnline](https://stegonline.georgeom.net/upload)
    * [code](https://github.com/Ge0rg3/StegOnline)
  * [stego](https://github.com/jtjunior09/stego)
  * [OpenStego](https://www.openstego.com/)
  * [steghide](http://steghide.sourceforge.net/)
    * [Steghide GUI](http://stegui.sourceforge.net/)
  * [OpenPuff](https://embeddedsw.net/OpenPuff_Steganography_Home.html)
  * [mp3stego](https://www.petitcolas.net/steganography/mp3stego/)
  * [DeepSound](http://jpinsoft.net/DeepSound)
  * [silenteye](https://achorein.github.io/silenteye/)
* _Crypto challenge contests_
  * [Cyber FastTrack](https://cyber-fasttrack.org/)
    * [Cyber FastTrack Spring 2020 CTF](https://www.thelaughingman.org/home/2020/3/27/cyber-fasttrack-spring-2020-ctf)
  * [MysteryTwister C3 - The Crypto Challenge Contest](https://www.mysterytwisterc3.org/en/)