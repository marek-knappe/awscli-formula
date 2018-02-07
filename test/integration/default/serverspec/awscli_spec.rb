require 'serverspec'
require 'spec_helper'

# Required by serverspec
set :backend, :exec

pillar = YAML.load_file('/tmp/pillar')
users = pillar['local']['awscli']['users']

users.keys.each do |user|
  describe "AWSCLI - #{user}" do
    users[user]['homedir'] = '/home/' + user if users[user]['homedir'].nil?

    it "#{users[user]['homedir']}/.aws/config is a file" do
      expect(file("#{users[user]['homedir']}/.aws/config")).to be_file
    end

    it "#{users[user]['homedir']}/.aws/config file mode should be 600" do
      expect(file("#{users[user]['homedir']}/.aws/config").mode).to eql("600")
    end

    it "#{users[user]['homedir']}/.aws/credentials is a file" do
      expect(file("#{users[user]['homedir']}/.aws/credentials")).to be_file
    end

    it "#{users[user]['homedir']}/.aws/credentials file mode should be 600" do
      expect(file("#{users[user]['homedir']}/.aws/credentials").mode).to eql("600")
    end
  end
end
