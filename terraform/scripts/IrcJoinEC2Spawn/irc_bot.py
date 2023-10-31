import socket
import time
import random

server = "irc.supernets.org"
channel = "#dev"
nicknames = ["BadLarry", "BigSam", "rigaTony", "Fascilios", "Pennecio", "Tomateo"]
nick = random.choice(nicknames)

irc = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
irc.connect((server, 6667))
irc.send(bytes("USER {0} 0 * :{0}\n".format(nick), "UTF-8"))
irc.send(bytes("NICK {}\n".format(nick), "UTF-8"))
irc.send(bytes("JOIN {}\n".format(channel), "UTF-8"))

while True:
    text = irc.recv(2048).decode('UTF-8')
    print(text)  # Optional: print the server messages to the console
    if "PING" in text:
        irc.send(bytes("PONG :{}\n".format(text.split(":")[1]), "UTF-8"))
    if "End of /NAMES list." in text:
        irc.send(bytes("PRIVMSG {} :{}\n".format(channel, "ok this thing is on"), "UTF-8"))
        irc.send(bytes("QUIT :{}\n".format("KUSH"), "UTF-8"))
        break
