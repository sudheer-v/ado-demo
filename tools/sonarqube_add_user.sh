#!/usr/bin/python3
import sys
from sonarqube import SonarQubeClient

sonarcloud_url = "http://34.133.185.189:9000"
sonarcloud_token = (sys.argv[1])
sonar = SonarQubeClient(sonarqube_url=sonarcloud_url, token=sonarcloud_token)

sonar.permissions.add_permission_to_user(login="user2", permission="admin", projectKey="abc")
