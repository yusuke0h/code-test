address = 'abcd@test.com'

emails = [
"Abc@example.com",
"Abc.123@example.com",
"user+mailbox/department=shipping@example.com",
"!#$%&'*+-/=?^_`.{|}~@example.com",
"Abc.@example.com",
"Abc..123@example.com",
".dot_kara_hazimaru@example.com",
"I.like.you.@example.com",
"I..love...you@example.com",
"aaaa",
"efjefei@fejifeji@nberib",
"fein@",
"@feifjei9.com",
"a@[0.0.0.0]",
"a@[255.255.255.255]",
"a@[255.255.255.256]",
"a@[001.002.003.004]",
"a@[2001:0db8:bd05:01d2:288a:1fc0:0001:10ee]",
"a@[2001:0db8:bd05:01d2:288a::1fc0:0001:10ee]",
"a@[2001:0db8:bd05:01d2:288a:1fc0:0001:10ee:11fe]",
"a@[2001:db8:20:3:1000:100:20:3]",
"a@[2001:db8::1234:0:0:9abc]",
"a@[2001:db8::9abc]",
"a@[::]",
"a@[0::0]",
"a@[::1]",
"a@[1::]",
"a@[1:2:3:4:5:6:7::]",
"a@[::255.255.255.255]",
"a@[::ffff:255.255.255.255]",
"a@[::ffff:0:255.255.255.255]",
"a@[2001:db8:3:4::192.0.2.33]",
"a@[64:ff9b::192.0.2.33]",
"a@[example.com]",
"a@[example.com:hoge]",
"a@0",
"a@a",
"a@0.a",
"a@0.0",
"a@a.0",
"a@.a",
"a@a-.a",
"a@-a.a",
"a@a-a.com",
"a@0-a.com",
"a@a-0.com",
"a@a-a.a-a",
"a@abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890.com",
"a@abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ012345678901.com",
"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/@example.com",
"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/a@example.com"
]


emails.each do |email|
  if email.scan(/[a-zA-Z0-9!#\$%&'*+\-\/=\?\^_`{\|}~\.]+@[a-zA-Z0-9\-\.]+/).first
    print "true", "\t"
  else
    print "false", "\t"
  end
  puts email
end

