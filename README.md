# Jenkins CI/CD with Network Nuts

## Installing Jenkins

### Installation for RPM based Distributions

Refer to the install-rpm.sh script

### Installation for Debian based Distributions

Refer to the install-deb.sh script

## Post Installation

### Configuring SSL for Jenkins

Generating an SSL Public and Private Key
```bash
openssl req -newkey rsa:2048 -nodes -keyout key.pem -x509 -days 365 -out certificate.pem
```
Convert files into .p12 keystore
```bash
openssl pkcs12 -inkey key.pem -in certificate.pem -export -out certificate.p12
```
Convert .p12 to .jks keystore
```bash
keytool -importkeystore -srckeystore ./certificate.p12 -srcstoretype pkcs12 -destkeystore jenkinsserver.jks -deststoretype JKS
```
Add .jks file to Jenkins path
```bash
sudo cp jenkinsserver.jks /var/lib/jenkins/
sudo chown jenkins:jenkins /var/lib/jenkins/jenkins.jks
```
Configure Jekins for Port 8443
```bash
ExecStart=/usr/bin/jenkins --httpsRedirectHttp
Environment="JENKINS_HTTPS_PORT=8443"
Environment="JENKINS_HTTPS_KEYSTORE=/var/lib/jenkins/jenkinsserver.jks"
Environment="JENKINS_HTTPS_KEYSTORE_PASSWORD=baeldung"
```
Restart Jenkins Server
```bash
sudo systemctl daemon-reload
sudo systemctl restart jenkins
```
