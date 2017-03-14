base:
  'master':
     - cloud

  '*':
     - tools
     - consul
     
  'lb*':
     - lb

  'web*':
  	 - php-nginx
     - web