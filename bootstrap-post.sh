#!/bin/bash

ssh-agent $(ssh-add "/etc/puppetlabs/puppetserver/ssh/id-control_repo.rsa"; git clone git@gitlab.inf.puppet.vm:puppet/control-repo /root/control-repo)
echo "mod 'demomodule',
  :git => 'https://github.com/chrismatteson/demomodule'" >> /root/control-repo/Puppetfile
cd /root/control-repo
git commit -a -m 'added extra repositories into Puppetfile'
git push origin production
