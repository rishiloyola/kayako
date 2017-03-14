salt-cloud:
  pkg.installed

/root/.ssh/id_rsa:
  file.managed:
    - makedirs: True
    - source: salt://cloud/conf/id_rsa
    - mode: 600

/root/.ssh/id_rsa.pub:
  file.managed:
    - makedirs: True
    - source: salt://cloud/conf/id_rsa.pub
    - mode: 600


/etc/salt/cloud.providers.d/digitalocean.conf:
  file.managed:
    - source: salt://cloud/conf/digitalocean.conf
    - template: jinja

/etc/salt/cloud.profiles.d/centos-digitalocean.conf:
  file.managed:
    - source: salt://cloud/conf/centos-digitalocean.conf

bootstrap:
  cmd.run:
    - name: curl -L https://bootstrap.saltstack.com -o /etc/salt/cloud.deploy.d/bootstrap-salt.sh
    - creates: /etc/salt/cloud.deploy.d/bootstrap-salt.sh