
require 'aws-sdk-ec2'  # v2: require 'aws-sdk'

vpc = Aws::EC2::Vpc.new(region: 'us-east-1')

# inst = vpc.instances(vpc_id: 'vpc-efa89194')
# instances = vpc.instances({
# filters: [
#   {
#   vpcid: ["vpc-efa89194"]
#   }
# ],
#   id: "vpc-efa89194"
# })
vpc.describe_attribute({
  attribute: "enableDnsSupport", # required, accepts enableDnsSupport, enableDnsHostnames
  dry_run: false,
})

