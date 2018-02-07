{%- from "awscli/map.jinja" import awscli with context %}

{%- for name, user in salt['pillar.get']('awscli:users', {}).items() %}

{%- set user_config = salt['pillar.get']('awscli:users:%s:config'|format(name), {}) %}
{%- set user_homedir = salt['pillar.get']('awscli:users:%s:homedir'|format(name), '/home/' ~ name) %}

{{ name }}_awscli_config:
  file.managed:
    - name: {{ user_homedir }}/.aws/config
    - mode: 0600
    - makedirs: True
    - contents: |
        [default]
        {%- for k, v in user_config.iteritems() %}
        {{ k }} = {{ v }}
        {% endfor %}

{{ name }}_awscli_credentials:
  file.managed:
    - name: {{ user_homedir }}/.aws/credentials
    - mode: 0600
    - makedirs: True
    - contents: |
        [default]
        {%- for k, v in user_config.iteritems() %}
        {{ k }} = {{ v }}
        {% endfor %}

{% endfor %}
