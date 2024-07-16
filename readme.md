setting up a CI pipeline using Jenkins and various DevOps tools on AWS EC2. Here's a corrected and organized version of the steps based on your provided information:

### AWS EC2 Setup
- **Instance Type**: Ubuntu t2.medium
- **EBS Volume**: 30 GB
- **Region**: US-EAST-1

### Initial Setup
1. **Connect to EC2 Instance**: SSH into the instance.
2. **Switch to Root User**: `sudo su`
3. **Install Jenkins**: Follow instructions in [jenkins-install.sh](https://github.com/francefaraz/DevOps/blob/main/jenkins-install.sh).
4. **Change Security Group**: Update inbound rules to allow all traffic from anywhere (0.0.0.0/0).
5. **Start Jenkins**: Access Jenkins at `http://ec2_ip:8080`.
6. **Create Jenkins Pipeline**: New item -> Pipeline, SCM: Git, Repository: [https://github.com/praveen1994dec/Java_app_3.0.git](https://github.com/praveen1994dec/Java_app_3.0), Branch: main.

### Jenkins Plugins Installation
1. Navigate to Jenkins Dashboard -> Manage Jenkins -> Manage Plugins.
2. Install the following plugins:
   - Sonar Gerrit
   - SonarQube Scanner
   - SonarQube Generic Coverage
   - Sonar Quality Gates
   - Artifactory
   - JFrog

### Docker Installation
1. Install Docker by executing commands in [docker-install.sh](https://github.com/francefaraz/DevOps/blob/main/docker-install.sh).
2. Verify Docker installation: `docker -v`.

### SonarQube Installation
1. Install SonarQube using Docker:
   ```
   docker run -d --name sonarqube -p 9000:9000 -p 9092:9092 sonarqube
   ```
2. If SonarQube is not running, start it:
   ```
   docker start <container_id>
   ```
3. Access SonarQube dashboard at `http://ec2_ip:9000`.
4. Default credentials: admin/admin.
5. Generate SonarQube token for Jenkins integration: My Account -> Security -> Create Token.

### Jenkins and SonarQube Integration
1. Configure Jenkins SonarQube Plugin:
   - Manage Jenkins -> Configure System -> SonarQube servers.
   - Add SonarQube server URL and generated token.

### Maven Installation
1. Install Maven:
   ```
   sudo apt update -y
   sudo apt install maven -y
   mvn -version
   ```

### Triv Installation
1. Install Triv using [thriv-install.sh](https://github.com/francefaraz/DevOps/blob/main/thriv-install.sh).

### Jenkins Shared Library
1. Add Jenkins Shared Library:
   - Manage Jenkins -> Configure System -> Global Pipeline Libraries.
   - Name: my-shared-library
   - Default version: main
   - Git Repository: [https://github.com/praveen1994dec/jenkins_shared_lib.git](https://github.com/praveen1994dec/jenkins_shared_lib.git)

### Final Integration
1. Ensure all tools (Jenkins, SonarQube, Maven, Triv) are integrated correctly in your Jenkins pipeline script.

These steps should help you set up a robust CI pipeline with Jenkins integrating various DevOps tools effectively on your AWS EC2 instance. Adjust paths, URLs, and configurations based on your specific setup and requirements.
