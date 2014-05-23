desc 'make fake data'
task :make_fake_data => [:environment] do |t,args|
  FakeDataMaker.make_fake_data
end