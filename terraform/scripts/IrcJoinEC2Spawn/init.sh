#!/bin/bash
apt-get update -y
apt-get install -y python3

cat <<EOL > irc_bot.py
import socket
import time
import random

server = "" #IRC SERVER
channel = "" #CHANNEL
nicknames = ["BadLarry", "BigSam", "rigaTony", "Fascilios", "Pennecio", "Tomateo"] #NICKLIST
nick = random.choice(nicknames)

irc = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
irc.connect((server, 6667))
irc.send(bytes("USER {0} 0 * :{0}\n".format(nick), "utf-8"))
irc.send(bytes("NICK {}\n".format(nick), "utf-8"))
irc.send(bytes("JOIN {}\n".format(channel), "utf-8"))

while True:
    text = irc.recv(2048).decode('UTF-8')
    print(text)
    if "PING" in text:
        irc.send(bytes("PONG :{}\n".format(text.split(":")[1]), "UTF-8"))
    if "001" in text:  # Welcome message numeric
        irc.send(bytes("JOIN {}\n".format(channel), "UTF-8"))
    if "End of /NAMES list." in text:
        irc.send(bytes("PRIVMSG {} :{}\n".format(channel, "TERRAFORM SUCCESFULLY SPAWN UP EC2"), "UTF-8"))
        irc.send(bytes("QUIT :{}\n".format("yo it worked dawg"), "UTF-8"))
        break
EOL

python3 irc_bot.py
