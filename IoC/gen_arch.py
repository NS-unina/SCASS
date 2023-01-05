"""architecture generator module"""
import yaml

dict_file = [{'smartgrid'}]

with open('arch.yaml', "w", encoding="utf-8") as file:
    documents = yaml.dump(dict_file, file)
