### For Run Single Command On Multiple Servers

1. create a virtual env
```angular2html
python3 -m venv venv
```

2. edit servers.json with your data
```angular2html
[
    {
        "ip" : "x.x.x.x",
        "username" : "USERNAME",
        "password" : "PASSWORD"
    },
    {
        "ip" : "n.n.n.n",
        "username" : "USERNAME",
        "password" : "PASSWORD"
    }
]
```

3. run command bellow
```angular2html
python3 main.py
```

4. waiting for processes till done

##  Your Command Will Be Done on Servers