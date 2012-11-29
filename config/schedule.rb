set :output, {:error => '/var/log/stderr.log', :standard => '/var/log/stdout.log'}
job_type :script, "#{path}/script/:task :output"

every 6.hours do
  command "rm -Rf #{path}/tmp/cache"
end

every :hour do
  script "send_report"
end
