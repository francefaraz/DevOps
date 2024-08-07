sudo apt install openjdk-17-jre  -- to install 

To use Java 17 on your system, you need to update your environment to use the Java 17 installation. Here’s how you can do it:

### 1. Verify Installation

First, confirm that Java 17 is installed correctly:

```bash
update-java-alternatives --list
```

You should see something like:

```
java-1.17.0-openjdk-amd64    /usr/lib/jvm/java-1.17.0-openjdk-amd64
```

### 2. Update the Default Java Version

You can use the `update-alternatives` command to set Java 17 as the default. Run the following commands:

```bash
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-1.17.0-openjdk-amd64/bin/java 1
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/java-1.17.0-openjdk-amd64/bin/javac 1
```

### 3. Select the Default Java Version

To choose which version to use by default:

```bash
sudo update-alternatives --config java
```

You will be prompted to select the version you want to use by entering the appropriate number.

Similarly, set the `javac` compiler:

```bash
sudo update-alternatives --config javac
```

### 4. Verify the Changes

Check that the default Java version has been updated:

```bash
java --version
```

It should now show Java 17.

### 5. Set JAVA_HOME Environment Variable (Optional)

To ensure that other tools recognize the Java version, you might need to set the `JAVA_HOME` environment variable:

Add this to your `.bashrc`, `.zshrc`, or `.profile` file (depending on the shell you are using):

```bash
export JAVA_HOME=/usr/lib/jvm/java-1.17.0-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
```

Then reload the profile:

```bash
source ~/.bashrc
```

or

```bash
source ~/.zshrc
```

This setup should configure your system to use Java 17 by default.

