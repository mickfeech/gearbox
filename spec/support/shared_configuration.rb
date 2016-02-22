shared_context 'shared configuration' do
  let(:valid_config_opts) { Hash[auth_token: 'abc', base_url: 'http://openshift.com:8443'] }
  let(:invalid_config_opts) { valid_config_opts.merge(auth_token: nil) }
end