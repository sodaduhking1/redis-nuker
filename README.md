# redis-nuker
redis is an In-Memory Data Store. It was designed to solve the "bottleneck" problem when a website gets too much traffic, basically it's used for storing data and the funny thing about redis is it's literally the most unsecure thing ever and yet people still use it redis's default settings are quite literaly unprotected server access meaning you can get the ip and port of the redis part of the website and connect to it via the command ```redis-cli``` but the redis commands are really slow to learn so i made a simple program that does what we all want to do
# BE AS MUCH OF AN ASSHOLE AS WE CAN
so this program runs the main commands that delet crutial parts of the redis database

```
  things the program deletes
* the keyspace (active data)
* the Persistence
* the configuration
```
## SHOWCASE

<img width="1920" height="1080" alt="Screenshot_2026-03-01_13_56_34" src="https://github.com/user-attachments/assets/313d1841-002b-4cb3-b362-f62ee01f9c0f" />


# tut for finding redis servers
[shodan search](https://www.shodan.io/search?query=product%3Aredis+%22redis_version%3A5.%22)
you can change the target version in the shodan filters 
(lower version = easier nuke)
