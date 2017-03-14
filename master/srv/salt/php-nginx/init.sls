# install the web server package along with its configuration file
nginx:
  pkg.installed:
    - name: nginx
  file.managed:
    - name: /etc/nginx/nginx.conf
    - source: salt://lb/conf/nginx.conf
    - require:
      - pkg: nginx
    - watch_in:
      - service: nginx
  service.running:
    - enable: true