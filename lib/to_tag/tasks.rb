desc 'removes output!'
task :remove_output do
  rm_rf Dir['output/*']
end

desc 'builds output!'
task build_output: :remove_output do
  data = ToTag::Data.extract dir: 'input'
  ToTag::FrontEnd.build data: data, dir: 'output'
end

task default: :build_output
