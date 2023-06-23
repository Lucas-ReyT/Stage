# -*- coding: utf-8 -*-
"""
Created on Wed Apr 12 14:56:27 2023

@author: user-01
"""

import pandas as pd

df = pd.read_excel('C:/Users/user-01/Documents/Stage/Contrainte.xlsx')
listeM = df.loc[df['Sheet'] == 'Metadata', 'Columns'].tolist()
listeS = df.loc[df['Sheet'] == 'Species metadata', 'Columns'].tolist()
listeSp = df.loc[df['Sheet'] == 'Species details', 'Columns'].tolist()
listeSD = df.loc[df['Sheet'] == 'Species data', 'Columns'].tolist()


print(listeM)
print("--------------")
print(listeS)
print("--------------")
print(listeSp)
print("--------------")
print(listeSD)
