require "dotenv"
require "mail"
require "csv"

Dotenv.load

if not ENV['GMAIL_SMTP_USER'] or not ENV['GMAIL_SMTP_PASSWORD']
  puts <<-END
Add a .env file with:
GMAIL_SMTP_USER=<your-email>
GMAIL_SMTP_PASSWORD=<your-password>
  END
  exit
else
  gmail_user = ENV['GMAIL_SMTP_USER']
  gmail_password = ENV['GMAIL_SMTP_PASSWORD']
end

if ARGV.size != 2
  puts "Usage: #{$0} <csv-file> <email-template>"
  exit
else
  csv_file = ARGV.shift
  email_template = IO.read(ARGV.shift)
end

Mail.defaults do
  delivery_method :smtp, {
    address:              'smtp.gmail.com',
    port:                 '587',
    user_name:            gmail_user,
    password:             gmail_password,
    authentication:       :plain,
    enable_starttls_auto: true,
  }
end

headers = nil
CSV.foreach(csv_file) do |row|
  headers = row.map(&:to_sym) and next unless headers

  row_with_headers = Hash[headers.zip(row)]

  row_with_headers[:Position] = row_with_headers[:Positions].split(",").first

  Mail.deliver do
    content_type "text/plain; charset=utf-8"
    from    'joao.castrofigueiredo@gmail.com'
    to      'joao.castrofigueiredo@gmail.com'
    #to      row_with_headers[:'Company Email']
    subject 'Here is the image you wanted'
    body    sprintf(email_template, row_with_headers)
  end

  print "."
end
puts
