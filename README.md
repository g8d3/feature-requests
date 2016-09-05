# README

Application to handle feature requests from several clients and product areas.

It helps team spot requests with most urgency and with most priority.

It supports: Facebook OAuth authentication.

- Ruby version: ruby 2.3.1p112 (2016-04-26 revision 54768) [x86_64-linux]

- System dependencies: nodejs

# How to Run

1. Clone this repository and open folder in a terminal:

```shell
git clone git@github.com:juanpastas/feature-requests.git
cd feature-requests
```

1. Install ruby(with bundler) and nodejs:

```shell
command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
\curl -sSL https://get.rvm.io | bash -s stable --ruby
apt-get install -y nodejs
```

1. Install dependencies:

```shell
bundle
```

1. Setup database(this creates sample data too):

```shell
rake db:setup
```

1. Run server:

```shell
rails s
```

# Run tests

Run `rspec .`

# How to Deploy

1. Set up a host in the cloud
1. Add your host in `~/.ssh/config`:

```shell
Host my_host
  IdentityFile ~/.ssh/id_rsa
  User root
  HostName my_host_ip
```

1. Create a local file `.env.production` that you can copy from `.env.sample`.
In this file you will change all the configuration values the application needs.

1. Setup host with:

```shell
./deploy/setup.sh my_host
```

1. Upload code:

```
git push live
```

This command will execute commands that need to be run on remote host so
application runs in production.
