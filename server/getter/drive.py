
###################################################################################################
#               Made with ♥️ by Carlos Paredes (github: CarloGauss33)                              #
#                               MIT LICENCE 2020                                                  #
#                                                                                                 #
# This file makes a call for the GDrive api, getting the parent, the id and weblink of each file  #
#                                                                                                 #
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

        self.root = "19GLVDseQyMm8YxDxaMxebHvkp2o821E3"
        self.sources = dict()
        self.relations = dict()
        self.fields = (("files/webViewLink, files/name, ")+
                       ("files/id, files/mimeType, files/parents"))

        if os.path.exists('getter/token.pickle'):
            with open('getter/token.pickle', 'rb') as token:
                creds = pickle.load(token)

        if not creds or not creds.valid:
            if creds and creds.expired and creds.refresh_token:
                creds.refresh(Request())
            else:
                flow = InstalledAppFlow.from_client_secrets_file(
                    'getter/credentials.json', SCOPES)
                creds = flow.run_local_server(port=0)
            with open('getter/token.pickle', 'wb') as token:
                pickle.dump(creds, token)

        self.service = build('drive', 'v3', credentials=creds)

    def list_elements(self):
        folder_name = "application/vnd.google-apps.folder"
        parents = set([self.root])
        self.relations = dict()
        while (len(parents)>0):
            actual_parent = parents.pop()
            childs = []
            items = self._make_request(actual_parent)

            for item in items:
                if item["mimeType"] == folder_name:
                    parents.add(item["id"])
                childs.append(item["id"])
                relevant_data = {item["id"]:{"id":item["id"],"name":item["name"], 
                                 "parent":item["parents"], 
                                 "webViewLink": item["webViewLink"]}}
                self.sources.update(relevant_data)
                self.relations.update({actual_parent:childs})


        return self.sources, self.relations

    def _make_request(self, folderId):
        res = self.service.files().list(
                q=f"'{folderId}' in parents", fields=self.fields).execute()["files"]
        
        return res


def main():
    drive = Drive()
    drive.list_elements()

    with open("getter/data/data.json", "w", encoding="utf-8") as f:
        json.dump(drive.sources, f, indent=4)
    with open("getter/data/relations.json", "w", encoding="utf-8") as f:
        json.dump(drive.relations, f, indent=4)
    
