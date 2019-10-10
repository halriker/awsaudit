
require 'aws-sdk-ec2'  # v2: require 'aws-sdk'

# ec2 = Aws::EC2::Resource.new(region: 'us-east-1')

ec2 = Aws::EC2::Resource.new(region: 'us-east-1')

vpn = ec2.vpcs({vpc_ids: ["vpc-999423e2"]})

puts vpn





