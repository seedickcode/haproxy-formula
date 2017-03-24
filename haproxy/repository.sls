pkgrepo_dependencies_python:
  pkg.installed:
    - name: python-apt

pkgrepo_dependencies_apt:
  pkg.installed:
    - name: apt-transport-https

{% if 'jessie' in salt['grains.get']('oscodename') -%}
debian-backports-repo:
  pkgrepo.managed:
    - humanname: Debian jessie Backports repository
    - name: deb http://http.debian.org/debian jessie-backports main
    - file: /etc/apt/sources.list.d/backports.list
    - refresh_db: True
    - require:
      - pkg: python-apt
debian-backports-sloppy-repo:
  pkgrepo.managed:
    - humanname: Debian jessie Backports Sloppy repository
    - name: deb http://http.debian.org/debian jessie-backports-sloppy main
    - file: /etc/apt/sources.list.d/backports-sloppy.list
    - refresh_db: True
    - require:
      - pkg: python-apt
debian-haproxy-repo:
  pkgrepo.managed:
    - humanname: Debian jessie HAProxy repository
    - name: deb http://haproxy.debian.net jessie-backports-1.6 main
    - file: /etc/apt/sources.list.d/haproxy.list
    - key_url: https://haproxy.debian.net/bernat.debian.org.gpg
    - refresh_db: True
    - require:
      - pkg: python-apt
      - pkg: apt-transport-https
{% endif %}
