### Log yourself into the new machine

### Install Ruby

Before installing Ruby you will need some dependencies, install them using apt:

`build-essential git-core zlib1g-dev libssl-dev libreadline5-dev`

Install Ruby from source, the latest stable known version (2.1.2 when creating this README). 

To check if Ruby is correctly installed, you should be able to run the following command: `ruby -v`

You will then need to add some extensions to your Ruby installation: readline, zlib, openssl.

Use the links given below to find out how to install extensions. 
Note that when installing openssl ext you may have to edit the generated Makefile (after doing ruby extconf.rb) to declare the top_srcdir.

- http://stackoverflow.com/questions/1250329/has-anyone-tried-installing-ruby-rubygems-from-source-on-ubuntu-preferably-un
- http://stackoverflow.com/questions/21498868/install-openssl-support-for-selfcompiled-ruby-installation

### Get the sample app, add unicorn and install its dependencies

Install the sample app in `/var/www/sample-app-name` using git clone.

Edit the `Gemfile` and add the `unicorn` gem. Save.

Install the gem `bundler` and then run `bundle install` 

### Configure unicorn

Create a configuration file for unicorn: `config/unicorn.rb`

```
working_directory "/var/www/job-offer-devops-sample-app"
pid "/var/www/job-offer-devops-sample-app/unicorn/pids/unicorn.pid"
stderr_path "/var/www/job-offer-devops-sample-app/unicorn/err.log"
stdout_path "/var/www/job-offer-devops-sample-app/unicorn/out.log"

listen "/tmp/unicorn.socket"

worker_processes 2
timeout 30
```

Pre-create any folders or files that are needed above: `unicorn/pids/unicorn.pid` , `unicorn/err.log` ...

Start unicorn: `bundle exec unicorn -c config/unicorn.rb -E development -D -p 8080`

### Install, configure and run Nginx

Install nginx using apt.

Edit its default configuration file: `/etc/nginx/sites-enabled/default`

Declare an upstream pointing to your unicorn socket and to the necessary to proxy incoming requests to it.

Start / reload nginx: `service nginx start` `service nginx reload`
