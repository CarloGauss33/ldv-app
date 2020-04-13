
###################################################################################################
#               Made with ♥️ by Carlos Paredes (github: CarloGauss33)                              #
#                               MIT LICENCE 2020                                                  #
#                                                                                                 #
# This file makes a call for the GDrive api, getting the parent, the id and weblink of each file  #
# Making it useful to generate a tree graph structure                                             #
###################################################################################################


from __future__ import print_function
import pickle
import os.path
from googleapiclient.discovery import build
from google_auth_oauthlib.flow import InstalledAppFlow
from google.auth.transport.requests import Request
import json


SCOPES = ['https://www.googleapis.com/auth/drive.metadata.readonly']




class Drive():
    def __init__(self):
        creds = None #Check if the credentials are still useful

        self.root = "1WCP6PKTKEJI5qbjq2GTXPhTlzGoMH6Sz"
        self.sources = list()

        self.fields = (("files/webViewLink, files/name, ")+
                       ("files/id, files/mimeType, files/parents"))

        if os.path.exists('token.pickle'):
            with open('token.pickle', 'rb') as token:
                creds = pickle.load(token)

        if not creds or not creds.valid:
            if creds and creds.expired and creds.refresh_token:
                creds.refresh(Request())
            else:
                flow = InstalledAppFlow.from_client_secrets_file(
                    'credentials.json', SCOPES)
                creds = flow.run_local_server(port=0)
            with open('token.pickle', 'wb') as token:
                pickle.dump(creds, token)

        self.service = build('drive', 'v3', credentials=creds)

    def list_elements(self):
        folder_name = "application/vnd.google-apps.folder"
        parents = set([self.root])
        while (len(parents)>0):
            actual_parent = parents.pop()

            items = self._make_request(actual_parent)

            for item in items:
                if item["mimeType"] == folder_name:
                    parents.add(item["id"])
                
                relevant_data = {"id":item["id"],"name":item["name"], 
                                 "parent":item["parents"], 
                                 "webViewLink": item["webViewLink"]}
                self.sources.append(relevant_data)

        return self.sources

    def _make_request(self, folderId):
        res = self.service.files().list(
                q=f"'{folderId}' in parents", fields=self.fields).execute()["files"]
        
        return res
if __name__ == '__main__':
    drive = Drive()
    drive.list_elements()
    for a in drive.sources:
        print(f"{a['name']} :: {a['id']} :: {a['parent']}")