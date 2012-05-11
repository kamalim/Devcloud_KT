require 'rubygems'
require 'csv'
require 'pony' 
require 'net/smtp'

tickers = {}
CSV.foreach(ARGV[0].to_s, :headers => true, :header_converters => :symbol, :converters => :all) do |row|
  tickers[row.fields[0]] = Hash[row.headers[1..-1].zip(row.fields[1..-1])]
end

#puts tickers

tickers.each do |fname, val|
	if fname == nil
		name = val[:last_name]
	else
		name = fname
	end

email_body = <<EOF
"Hi #{name} 
How are you

Regards,
Devops"
EOF

email_id = val[:email]

email_data = {
  :from             =>  'Gaurav Kasera <gauravka@thoughtworks.com>',
  :to               =>  "#{email_id}",
  :subject          =>  "Hello there"+" "+Date.today.to_s+".",
  :body             =>  "#{email_body}",
  :port             =>  '587',
  :via              =>  :smtp,
  :via_options      =>  {
  :address                  =>  'smtp.gmail.com',
  :port                     =>  '587',
  :enable_starttls_auto     =>  true,
  :user_name                =>  'xyz@thoughtworks.com',
  :password                 =>  'password',
  :authentication           =>  :plain,
  :domain                   =>  'mydomain.com'
                         }
           }
Pony.mail(email_data)
end


