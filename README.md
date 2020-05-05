# HarvazOTP
OTP password manager extention; free software-based authenticator that implements two-step verification services using the Time-based One-time Password Algorithm and HMAC-based One-time Password algorithm, for authenticating users of software applications.

![](https://github.com/H4medRostami/HarvazOTP/blob/master/data/demo.gif)



A)install dependencies (depend on your distro for example in debian: apt install -y pass oathtool gcc shc )

1. pass
2. oathtool
3. gcc
4. shc

B) Setting pass up

To begin, there is a single command to initialize the password store:

    hamed@laptop ~ $ pass init "ZX2C4 Password Storage Key"
    mkdir: created directory ‘/home/zx2c4/.password-store’
    Password store initialized for ZX2C4 Password Storage Key.

Here, ZX2C4 Password Storage Key is the ID of my GPG 
key. You can use your standard GPG key or use an alternative one 
especially for the password store as shown above. Multiple GPG keys can 
be specified, for using pass in a team setting, and different folders 
can have different GPG keys, by using -p.


We can additionally initialize the password store as a git repository:

    hamed@laptop ~ $ pass git init
    Initialized empty Git repository in /home/zx2c4/.password-store/.git/
    zx2c4@laptop ~ $ pass git remote add origin kexec.com:pass-store


If a git repository is initialized, pass creates a git commit each time the password store is manipulated.


C)run HarvazOTP: 

    cd HarvazOTP
    make
     
