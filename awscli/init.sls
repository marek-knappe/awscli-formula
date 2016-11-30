util-pkgs:
  pkg.installed:
    - names:
      - python-pip

pip-utils:
  pip.installed:
    - names:
      - awscli
    - require:
      - pkg: python-pip