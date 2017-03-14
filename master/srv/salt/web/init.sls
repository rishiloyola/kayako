# PHP5 modules and configuration
php_stack:
  pkg.installed:
    - name: php5-fpm
  service.running:
    - name: php5-fpm
    - watch:
      - file: /etc/php5/fpm/php-fpm.conf
      - file: /etc/php5/fpm/pool.d/www.conf
      - file: /etc/php5/fpm/php.ini

# Configuration files for php5-fpm
/etc/php5/fpm/php-fpm.conf:
  file.managed:
    - source: salt://php_fpm/php-fpm.conf
    - user: root
    - group: root
    - mode: 644

/etc/php5/fpm/pool.d/www.conf:
  file.managed:
    - source: salt://php_fpm/www.conf
    - user: root
    - group: root
    - mode: 644

/etc/php5/fpm/php.ini:
  file.managed:
    - source: salt://php_fpm/php.ini
    - user: root
    - group: root
    - mode: 644
