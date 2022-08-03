#!/usr/bin/python3
import sys
import json
from os.path import exists
from sonarqube import SonarQubeClient

sonarcloud_url = (sys.argv[3])
sonarcloud_token = (sys.argv[1])
sonarcloud_project = (sys.argv[2])

sonar = SonarQubeClient(sonarqube_url=sonarcloud_url, token=sonarcloud_token)

file_exists = exists('code_owners.txt')
if file_exists:
    file_data = open("code_owners.txt", "r")
    data = file_data.read()
    file_data.close()
    users = json.loads(data)
    for user in users['users']:
        print(f"""granting permissions to + {user} + on Sonarqube Project""")
        try:
            sonar.permissions.add_permission_to_user(login=user, permission="admin", projectKey=sonarcloud_project)
        except Exception, e:
            print(e)
           
