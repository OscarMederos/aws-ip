# aws-ip
A shell script to grab AWS IP ranges

### Usage ###
```
hostname@workstation:~/Documents/Development$ ./aws-ip.sh 
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  199k  100  199k    0     0   972k      0 --:--:-- --:--:-- --:--:--  974k
```
### Output ###
```
hostname@workstation:~/Documents/Development$ cat aws_ip_ranges_02_18_2019.txt
52.95.154.0/23
52.219.64.0/22
52.92.72.0/22
52.92.64.0/22
~
```
### AWS Resource ###
If you need to get the IP range for a different resource than EC2 you can modify the following line:
```
if [ "$var" == "syncToken" ]; then
  cat ip-ranges.json | grep -B 2 EC2 | grep ip_prefix
  ```
  Replace EC2 with other services found in the JSON file.
