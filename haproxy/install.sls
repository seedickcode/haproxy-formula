haproxy.install:
  pkg.installed:
    - name: haproxy
    {% if 'jessie' in salt['grains.get']('oscodename') -%}
    - fromrepo: jessie-backports
    {% endif %} 
{% if salt['pillar.get']('haproxy:require') %}
    - require:
{% if 'jessie' in salt['grains.get']('oscodename') -%}
      - pkgrepo: debian-backports-repo
      - pkgrepo: debian-backports-repo-sloppy
      - pkgrepo: debian-haproxy-repo
{% endif %} 
{% for item in salt['pillar.get']('haproxy:require') %}
      - {{ item }}
{% endfor %}
{% endif %}
