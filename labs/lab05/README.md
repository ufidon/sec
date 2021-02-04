# its250
Online resources and examples

## Lab05: Attacking web apps

## 1. Description
In this lab, practice the following web attack techniques:

* SQL injection
* Sensitive-data exposure
* Cross-site scripting
* Cross-site request forgery
* Server-side request forgery

Prerequisites: 

* The web attack practice environment will be installed and configured during the lecture instead of the lab. You may refer to this [video demo]().
* You may use only Windows server VM OR Ubuntu VM.

You may install WebGoat and BurpSuite on Windows server OR Ubuntu.

### Install WebGoat and BurpSuite
#### On Ubuntu
1. Install Java JDK
```bash
# 1. Install Java jdk
sudo apt install default-jdk

# 2. Check java jdk installed successfully
javac -version
java -version
```

2. Using Java for WebGoat (Standalone)

Download the latest [stable version of webgoat-server and webwolf](https://github.com/WebGoat/WebGoat/releases).

```bash
# 1. Download the latest stable version of webgoat-server

# 2. Run WebGoat and webolf
cd "the folder where webgoat-server and webwolf resides"
java -Dfile.encoding=UTF-8 -jar ./webgoat-server-8.1.0.jar --server.port=8080 --server.address=localhost
java -Dfile.encoding=UTF-8 -jar ./webwolf-8.1.0.jar --server.port=8080 --server.address=localhost

# 3. Access http://127.0.0.1:8080/WebGoat and http://127.0.0.1:9090/WebWolf
```

3. (Optional)Using docker for WebGoat and WebWolf
```bash
# 1. remove old version
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get remove docker  docker.io containerd runc

# 2. Install prerequisites
sudo apt update -y && sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# 3. Install docker
sudo apt update -y && sudo apt install docker-ce docker-ce-cli containerd.io

# 4. Configure docker to be run by non-root user, logout then login
sudo usermod -aG docker $USER

# 5. Test docker works
docker run hello-world

# 6. Pull webgoat docker image and run
docker pull webgoat/webgoat-8.0
docker run -p 8080:8080 -t webgoat/webgoat-8.0
docker run -p 8080:8080 -p 9090:9090 -e TZ=America/Chicago webgoat/goatandwolf
```

4. Install ZAP OR BurpSuite
   1. Download the [latest version ZAP package](https://www.zaproxy.org/) then install it.

   ```bash
   # 1. check opt folder owner and change the owner to you
   ls -ld /opt/
   sudo chown -R $USER:$USER /opt/

   # 2. Go to the folder where ZAP resides
   cd "the folder where ZAP resides"

   # 3. Install burpsuite, change the version to yours
   tar -zxf ZAP_2.10.0_Linux.tar.gz 
   mv ZAP_2.10.0 /opt 

   # 4. find and run burpsuite
   ls /opt/ZAP_2.10.0/
   /opt/ZAP_2.10.0/zap.sh
   ```

   2. Download the [latest version BurpSuite](https://portswigger.net/burp/communitydownload) then install it.

   ```bash
   # 1. check opt folder owner and change the owner to you
   ls -ld /opt/
   sudo chown -R $USER:$USER /opt/

   # 2. Go to the folder where burpsuite resides
   cd "the folder where burpsuite resides"

   # 3. Install burpsuite, change the version to yours
   chmod +x burpsuite_community_linux_v2020_12_1.sh 
   ./burpsuite_community_linux_v2020_12_1.sh 

   # 4. find and run burpsuite
   ls /opt/BurpSuiteCommunity/
   ls /opt/BurpSuiteCommunity/BurpSuiteCommunity
   /opt/BurpSuiteCommunity/BurpSuiteCommunity
   ```

#### On Windows
1. Install Java JDK
   1. [Download Zulu Builds of OpenJDK](https://www.azul.com/downloads/zulu-community/?package=jdk) and install it.
   2. Check the environment variable PATH contains the JDK bin folder
   3. Check java jdk installed successfully
      ```batch
      REM Check java jdk installed successfully
      javac -version
      java -version
      ```
2. Using Java for WebGoat (Standalone)

Download the latest [stable version of webgoat-server and webwolf](https://github.com/WebGoat/WebGoat/releases).

```batch
REM 1. Download the latest stable version of webgoat-server and webwolf

REM 2. Run WebGoat and webwolf
cd "the folder where webgoat-server and webwolf resides"
java -Dfile.encoding=UTF-8 -jar ./webgoat-server-8.1.0.jar --server.port=8080 --server.address=localhost
java -Dfile.encoding=UTF-8 -jar ./webwolf-8.1.0.jar --server.port=9090 --server.address=localhost

REM 3. Access http://127.0.0.1:8080/WebGoat and  http://127.0.0.1:9090/WebWolf
```

3. Install ZAP OR BurpSuite
   * Download the [latest version ZAP](https://www.zaproxy.org/) then install it.
   * Download the [latest version BurpSuite](https://portswigger.net/burp/communitydownload) then install it.

## 2. Tasks
1. Start WebGoat and WebWolf.  
   1. Open Powershell or command prompt, run WebGoat with the command line below:
   ```batch
   java -Dfile.encoding=UTF-8 -jar ./webgoat-server-8.1.0.jar --server.port=8080 --server.address=localhost
   java -Dfile.encoding=UTF-8 -jar ./webwolf-8.1.0.jar --server.port=9090 --server.address=localhost
   ```
   2. Access http://127.0.0.1:8080/WebGoat and  http://127.0.0.1:9090/WebWolf using a web browser.
2. Practice web attack lessons in WebGoat.
   1. SQL injection
   2. Sensitive-data exposure
   3. Cross-site scripting
   4. Cross-site request forgery
   5. Server-side request forgery


## 3. Review questions

## Reference
* [Install docker on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
* [WebGoat](https://github.com/WebGoat/WebGoat)
* [Zap](https://www.zaproxy.org/)
* [How to List / Start / Stop Docker Containers](https://phoenixnap.com/kb/how-to-list-start-stop-docker-containers)
* [List of tz database time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)
* [BurpSuite](https://portswigger.net/burp/communitydownload)
  * [Getting Started with Burp Suite on Ubuntu](https://medium.com/swlh/getting-started-with-burp-suite-on-ubuntu-3c1e665122a3)