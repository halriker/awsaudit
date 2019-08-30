
require 'aws-sdk-ec2'  # v2: require 'aws-sdk'

ec2 = Aws::EC2::Client.new(region: 'us-east-1')

ec2inst = {}
tags_array = []

instance_id = "i-00f13ba67a3f7e733" # For example, "i-0a123456b7c8defg9"
instance_id_list = ["i-00f13ba67a3f7e733"] 

# require 'yaml'
# config_file = "config.yml"
# config = YAML.load(File.read(config_file))
# AWS.config(config)

# Get information about available instances.
puts "\nAvailable instances:"

describe_instances_result = ec2.describe_instances({ instance_ids: instance_id_list })

describe_instances_result.reservations.each do |reservation|
  if reservation.instances.count > 0
    reservation.instances.each do |instance|

      puts "=" * (instance.instance_id.length + 13)
      inst_id = instance.instance_id
      ec2inst["inst_id"] = inst_id.to_s
      puts "Instance ID: #{instance.instance_id}"
      state = instance.state.name
      ec2inst["state"] = state.to_s
      puts "State: #{instance.state.name}"
      image_id = instance.image_id
      ec2inst["image_id"] = image_id
      puts "Image ID: #{instance.image_id}"
      instance_type = instance.instance_type
      ec2inst["instance_type"] = instance_type
      puts "Instance Type: #{instance.instance_type}"
      inst_arch = instance.architecture
      ec2inst["instance_type"] = instance_type
      puts "Architecture: #{instance.architecture}"
      iam_instance_profile = instance.iam_instance_profile
      ec2inst["iam_instance_profile"] = iam_instance_profile
      puts "IAM Instance Profile: #{instance.iam_instance_profile}"
      key_name = instance.key_name
      ec2inst["key_name"] = key_name
      puts "Key Name: #{instance.key_name}"
      lauch_time = instance.launch_time
      ec2inst["lauch_time"] = lauch_time
      puts "Launch Time: #{instance.launch_time}"
      det_mon_state = instance.monitoring.state
      ec2inst["det_mon_state"] = det_mon_state
      puts "Detailed Monitoring State: #{instance.monitoring.state}"
      public_ip_address = instance.public_ip_address
      ec2inst["public_ip_address"] = public_ip_address
      puts "Public IP Address: #{instance.public_ip_address}"
      public_dns_name = instance.public_dns_name
      ec2inst["public_dns_name"] = public_dns_name
      puts "Public DNS Name: #{instance.public_dns_name}"
      vpc_id = instance.vpc_id
      ec2inst["vpc_id"] = vpc_id
      puts "VPC ID: #{instance.vpc_id}"
      subnet_id = instance.subnet_id
      ec2inst["subnet_id"] = subnet_id
      puts "Subnet ID: #{instance.subnet_id}"

      puts "=" * (instance.instance_id.length + 13)
      puts "EC2 Instance Information:"

      current_inst = ec2inst.to_a
      puts current_inst.to_s

      puts "=" * (instance.instance_id.length + 13)

      if instance.tags.count > 0
        puts "Tags:"
        tags = {}
        instance.tags.each do |tag|
          tags[tag.key] = tag.value
          tags_array = tags.to_a

          
        end
        puts tags_array.to_s

        puts "=" * (instance.instance_id.length + 13)

      end
    end
  end

end