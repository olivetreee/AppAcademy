echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ STARTING SCRIPTS @@@@@@@@@@@@@@@@@@@@@@@@@@@"
date +"%T"
bundle exec rspec spec/student_spec.rb
bundle exec rspec spec/course_spec.rb
bundle exec rspec spec/extension_spec.rb
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ENDING SCRIPTS @@@@@@@@@@@@@@@@@@@@@@@@@@@"
