```Shell
sudo ln -s $GS_HOME/projects/seaside31/fastCGI/lighttpd/includes /etc/lighttpd
sudo ln -s $GS_HOME/projects/seaside31/fastCGI/lighttpd/conf-available/20-seaside.conf \
           /etc/lighttpd/conf-available/
sudo ln -s /etc/lighttpd/conf-available/10-accesslog.conf /etc/lighttpd/conf-enabled/
sudo ln -s /etc/lighttpd/conf-available/10-fastcgi.conf /etc/lighttpd/conf-enabled/
sudo ln -s /etc/lighttpd/conf-available/20-seaside.conf /etc/lighttpd/conf-enabled/
sudo /etc/init.d/lighttpd force-reload
```

