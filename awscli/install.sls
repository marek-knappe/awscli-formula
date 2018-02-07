{%- from "awscli/map.jinja" import awscli with context %}

awscli_install:
  pkg.installed:
    - names:
      - {{ awscli.pip_pkg }}
    - require_in:
        pip: awscli_install
  pip.installed:
    - names:
      - awscli
