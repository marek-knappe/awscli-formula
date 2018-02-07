# awscli-formula [![Build Status](https://travis-ci.org/Perceptyx/awscli-formula.png?branch=master)](https://travis-ci.org/Perceptyx/awscli-formula)

A SaltStack formula to manage AWS CLI.

## Available states

- [`install`](#install)

- [`config`](#config)

### Install

- Install AWS CLI Python PIP.

### Config

- Creates /home/user/.aws/config with credentials from pillar.
