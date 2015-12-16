namespace :tweet do
    task :autotweet => :environment do|t, args|
        User.all.each do |user|
            #p user.twitter.home_timeline
            #p 'test'
            user.twitter.update('test 2')
        end
    end
end
