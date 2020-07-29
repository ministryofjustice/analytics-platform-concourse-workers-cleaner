title 'Working fly'

control 'Fly available' do
  impact 1
  title 'Fly cli should be available to use'
  desc 'The fly cli is needed to prune stalled workers.'
  tag 'installer'
  tag 'conda'

  describe command('fly -v') do
    its('exit_status') { should eq 0 }
    its('stdout') { should match /3.14.1/ }
  end
end
