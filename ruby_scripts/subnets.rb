require 'aws-sdk-ec2'  # v2: require 'aws-sdk'

# ec2 = Aws::EC2::Resource.new(region: 'us-east-1')

ec2 = Aws::EC2::Client.new(region: 'us-east-1')

vpcid = ec2.describe_subnets({
  filters: [
    {
      name: "vpc-id", 
      values: [
        "vpc-999423e2", 
      ], 
    }, 
  ], 
})


subresults = vpcid.to_h

puts subresults

# subresults.each do |i|

# 	puts i

# end

# vpcid.each do |i|
# 	puts i
# 	# i.each do |s|
# 	# = i.availability_zone #=> String
# 	# 	s.availability_zone_id #=> String
# 	# 	s.available_ip_address_count #=> Integer
# 	# 	s.cidr_block #=> String
# 	# 	s.default_for_az #=> Boolean
# 	# 	s.subnet_id #=> String
# 	# 	s.vpc_id #=> String
# 	# end
# 	puts i.class
 	#.tags #=> Array
# tags[0].key #=> String
# tags[0].value #=> String
# subnet_arn #=> String
# resp.next_token #=> String


# end

