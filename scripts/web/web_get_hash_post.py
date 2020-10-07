#!/bin/python3

from pwn import *
import bs4
import hashlib
import requests

req = requests.session()

url = "http://docker.hackthebox.eu:32544"

rget = req.get(url)
html = rget.content

###grab hash pandas?

soup = bs4.BeautifulSoup(html , 'html.parser')

print(soup)

elem = soup.select('html body h3')

split = elem[0].text.strip() 
hash = split.rstrip()
print(hash)
#hash2 = hash.encode("utf-8")

#print(hash2)

###Calculate sum

md5 = hashlib.md5(hash.encode('utf-8')).hexdigest()

#md5hash = print(md5)
#m5sum = pwnlib.util.hashes.md5sum(hash2)
#m5sum2 = m5sum.hexdigest()


###Post Sum
print('hash is', md5)

data = dict(hash=md5)
rpost = req.post(url=url, data=data)

print(rpost.text)

