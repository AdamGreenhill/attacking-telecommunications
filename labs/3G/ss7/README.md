# Setup
The environment that the tools below were setup and executed on was a flavour of Debian Linux. Other operating systems will need to slightly modify the commands below to work with their respective package managers, network managers, etc.
To start, install the system dependencies:

```
sudo apt-get install git python openjdk-8-jdk maven lksctp-tools wireshark
```

## SigPloit

To run SigPloit, download the Python tool and install the Python dependencies:

```
git clone https://github.com/SigPloiter/SigPloit
cd SigPloit
sudo pip2 install -r requirements.txt

```

Lastly, execute the following to setup IP addresses for the test environment to leverage:

```
sudo ip address add 192.168.56.101/32 dev lo
sudo ip address add 192.168.56.102/32 dev lo

```

Execute SigPloit with the following:

```

python sigploit.py

```

## jss7-attack-simulator

No more dependencies will be needed to install this simulation tool. Browse to the GitHub page (https://github.com/polarking/jss7-attack-simulator) and download the precompiled binaries (the author hosts the files on the following Google Drive link: https://drive.google.com/file/d/0B5wpGwi_jRR5a1pUZ2laWnA0WmM/view?usp=sharing). Execute the following commands to run the simulator:

```
tar xvf jss7-attack-simulator.tar.gz
cd restcomm-jss7-${jSS7.release.version}/ss7/restcomm-ss7-simulator/bin/
run.sh attack_simulator help

```

When we ran the run.sh script we received the following error stating that the Java Virtual Machine could not be created. This issue is written up in detail by another user here: https://github.com/polarking/jss7-attack-simulator/issues/3

```

-Djava.ext.dirs=/root/SS7/ss7/restcomm-ss7-simulator/lib is not supported. Use -classpath instead.
Error: Could not create the Java Virtual Machine.
Error: A fatal exception has occurred. Program will exit.

```

The issue is because the run.sh script cannot find the version of Java it needs to properly setup the environment. To fix the problem, hardcode the path to the Java 8 binary in the run script. Below, lines 91-98 were modified:

Script before the changes were made:

```
if [ "x$JAVA" = "x" ]; then

    if [ "x$JAVA_HOME" != "x" ]; then

         JAVA="$JAVA_HOME/bin/java"

    else

         JAVA="java"

    fi

fi

```

After the Java 8 binary was hardcoded into the script:

```
if [ "x$JAVA" = "x" ]; then

    if [ "x$JAVA_HOME" != "x" ]; then

         JAVA="$JAVA_HOME/bin/java"

    else

         JAVA="/usr/lib/jvm/java-8-openjdk-amd64/bin/java"

    fi

fi

```

This should fix the issue, and the simulator should execute now. To ensure other users who find the simulation tool can resolve the issue, the remediation steps were described in the issue tracker and a pull request was made to modify the README with clearer installation instructions.
