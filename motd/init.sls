
motd_quote:
  file.managed:
    - name: /etc/motd
    - mode: 644
    - user: 'root'
    - group: 'root'
{% if salt['pillar.get']('motd:template') -%}
    - source: salt://basic/motd/messages/{{ salt['pillar.get']('motd:template') }}
    - template: jinja
{% else -%}
    - contents_pillar: motd:data
{% endif %}
