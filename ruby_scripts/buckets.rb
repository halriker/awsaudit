require 'aws-sdk-s3'  # v2: require 'aws-sdk'

region = 'us-east-1'
client = Aws::S3::Client.new(region: region)
#resource = Aws::S3::Resource.new(client: client)

bucket1 = 's4-corepoint-configuration-backup'

s3 = Aws::S3::Resource.new(region: region)

# reference an existing bucket by name
bucket = s3.bucket('s4-corepoint-configuration-backup')

# Show only the first 50 items
bucket.objects.limit(50).each do |item|
  # puts "Name:  #{item.key}"
  # puts "URL:   #{item.presigned_url(:get)}"

end


resp = client.get_bucket_acl({
  bucket: bucket1, # required
  use_accelerate_endpoint: false,
})

puts resp.class



# Broad search with limit
# s3.buckets.limit(50).each do |b|
#   puts "#{b.name}"
# end

#enumerate every object in a bucket
# bucket.each do |obj|
#   puts "#{obj.key} => #{obj.etag}"
# end

# Resource Waiter: Poll until desired state
# instance = Aws::EC2::Instance.new('i-12345678')
# instance.stop
# instance.wait_until_stopped
# puts instance.id + ' is stopped'
