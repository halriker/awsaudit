
require 'aws-sdk-rds'  # v3: require 'aws-sdk'


rds = Aws::RDS::Client.new(region: 'us-east-1')

db_instance_identifier = 'corepoint-mssql-prod'

resp = rds.describe_db_instances({
  db_instance_identifier: db_instance_identifier, 
})

resphash = resp.to_h

db_instance_identifier = resp.db_instances[0].db_instance_identifier #=> String
puts "DB Instance Identifier: " + db_instance_identifier
db_instance_class = resp.db_instances[0].db_instance_class #=> String
puts "DB Instance Class: " + db_instance_class
engine = resp.db_instances[0].engine #=> String
puts "Engine: " + engine
db_instance_status = resp.db_instances[0].db_instance_status #=> String
puts "DB Instance Status: " + db_instance_status.to_s
master_username = resp.db_instances[0].master_username #=> String
puts "Master Username: " + master_username
db_name = resp.db_instances[0].db_name #=> String
puts "DB Name: " + db_name.to_s 
endpointaddress = resp.db_instances[0].endpoint.address #=> String
puts "End Point Address: " + endpointaddress
endpointport = resp.db_instances[0].endpoint.port #=> Integer
puts "Endpoint: " + endpointport.to_s
endpointhosted_zone_id = resp.db_instances[0].endpoint.hosted_zone_id #=> String
puts "Endpoint Hosted Zone ID: " + endpointhosted_zone_id
allocated_storage = resp.db_instances[0].allocated_storage #=> Integer
puts "Allocated Storage: " + allocated_storage.to_s
instance_create_time = resp.db_instances[0].instance_create_time #=> Time
puts "Instance Create Time: " + instance_create_time.to_s
preferred_backup_window = resp.db_instances[0].preferred_backup_window #=> String
puts "Preferred Backup Window: " + preferred_backup_window
backup_retention_period = resp.db_instances[0].backup_retention_period #=> Integer
puts "Backup Retention Period: " + backup_retention_period.to_s

db_security_groups = resp.db_instances[0].db_security_groups #=> Array

	db_security_groups.each do |i| 
		# Note: Returning nil
		puts "DB Security Groups: " + i.status
	end 

# db_security_groups_status = resp.db_instances[0].db_security_groups[0].status #=> String
vpc_security_groups = resp.db_instances[0].vpc_security_groups #=> Array

	vpc_security_groups.each do |i| 
		puts "VPC Security Group: " + i.vpc_security_group_id
		puts "VPC Security Group Status: " + i.status 
	end 

db_parameter_groups = resp.db_instances[0].db_parameter_groups #=> Array

	db_parameter_groups.each do |i|
		puts "DB Parameter Group Name: " + i.db_parameter_group_name
		puts "DB Parameter Group Apply Status: " + i.parameter_apply_status
	end

availability_zone = resp.db_instances[0].availability_zone #=> String
puts "Availability Zone: " + availability_zone
db_subnet_group_name = resp.db_instances[0].db_subnet_group.db_subnet_group_name #=> String
puts "DB Subnet Group Name: " + db_subnet_group_name
db_subnet_group_description = resp.db_instances[0].db_subnet_group.db_subnet_group_description #=> String
puts "DB Subnet Group Description: " + db_subnet_group_description
vpc_id = resp.db_instances[0].db_subnet_group.vpc_id #=> String
puts "VPC ID: " + vpc_id
subnet_group_status = resp.db_instances[0].db_subnet_group.subnet_group_status #=> String
puts "Subnet Group Status: " + subnet_group_status

# Note: Add incremanting Subnet # i.e. "Subnet Identifier 1..."
subnets = resp.db_instances[0].db_subnet_group.subnets #=> Array
	subnets.each do |i| 
		puts "Subnet Identifier: " + i.subnet_identifier
		puts "Subnet Availability Zone Name: " + i.subnet_availability_zone.name
		puts "Subnet Status: " + i.subnet_status
	end 

db_subnet_group_arn = resp.db_instances[0].db_subnet_group.db_subnet_group_arn #=> String
puts "DB Subnet Group ARN: " + db_subnet_group_arn.to_s
preferred_maintenance_window = resp.db_instances[0].preferred_maintenance_window #=> String
puts "Preferred Maintanence Window: " + preferred_maintenance_window
latest_restorable_time = resp.db_instances[0].latest_restorable_time #=> Time
puts "Latest Restorable Time: " + latest_restorable_time.to_s
multi_az = resp.db_instances[0].multi_az #=> Boolean
puts "Multi AZ Enabled: " + multi_az.to_s
engine_version = resp.db_instances[0].engine_version #=> String
puts "Engine Version: " + engine_version
auto_minor_version_upgrade = resp.db_instances[0].auto_minor_version_upgrade #=> Boolean
puts "Auto Minor Version Upgrade: " + auto_minor_version_upgrade.to_s
read_replica_source_db_instance_identifier = resp.db_instances[0].read_replica_source_db_instance_identifier #=> String
puts "Read Replica Source DB Instance Identifier: " + read_replica_source_db_instance_identifier.to_s 
read_replica_db_instance_identifiers = resp.db_instances[0].read_replica_db_instance_identifiers #=> Array
	read_replica_db_instance_identifiers.each do |i|
		puts "Read Replica DB Instance Identifiers: " + i.read_replica_db_instance_identifiers
	end 
read_replica_db_cluster_identifiers = resp.db_instances[0].read_replica_db_cluster_identifiers #=> Array
	read_replica_db_cluster_identifiers.each do |i| 
		puts "Read Replica DB Cluster Identifiers: " + i.read_replica_db_cluster_identifiers
	end
license_model = resp.db_instances[0].license_model #=> String
puts "License Model: " + license_model
iops = resp.db_instances[0].iops #=> Integer
puts "IOPS: " + iops.to_s
option_group_memberships = resp.db_instances[0].option_group_memberships #=> Array
	option_group_memberships.each do |i|
		puts "Option Group Memberships - Option Group Name: " + i.option_group_name
		puts "Option Group Memberships - Option Group Status: " + i.status
	end

character_set_name = resp.db_instances[0].character_set_name #=> String
puts "Character Set Name: " + character_set_name
secondary_availability_zone = resp.db_instances[0].secondary_availability_zone #=> String
puts "Secondary Availability Zone: " + secondary_availability_zone.to_s 
publicly_accessible = resp.db_instances[0].publicly_accessible #=> Boolean
puts "Publicly Accessible: " + publicly_accessible.to_s
status_infos = resp.db_instances[0].status_infos #=> Array
	status_infos.each do |i|
		puts "Status Infos - Status Type: " + i.status_type
		puts "Status Infos - Normal: " + i.normal
		puts "Status Infos - Status: " + i.status
		puts "Status Infos - Message: " + i.message
	end

storage_type = resp.db_instances[0].storage_type #=> String
puts "Storage Type: " + storage_type
tde_credential_arn = resp.db_instances[0].tde_credential_arn #=> String
puts "TDE Credential ARN: " + tde_credential_arn.to_s
db_instance_port = resp.db_instances[0].db_instance_port #=> Integer
puts "DB Instance Port: " + db_instance_port.to_s
db_cluster_identifier = resp.db_instances[0].db_cluster_identifier #=> String
puts "DB Cluster Identifier: " + db_cluster_identifier.to_s
storage_encrypted = resp.db_instances[0].storage_encrypted #=> Boolean
puts "Storage Encrypted: " + storage_encrypted.to_s
kms_key_id = resp.db_instances[0].kms_key_id #=> String
puts "KMS Key ID: " + kms_key_id
dbi_resource_id = resp.db_instances[0].dbi_resource_id #=> String
puts "DBI Resource ID: " + dbi_resource_id

# Note: No Return
ca_certificate_identifier = resp.db_instances[0].ca_certificate_identifier #=> String
puts "CA Certificate Identifier: " + ca_certificate_identifier
domain_memberships = resp.db_instances[0].domain_memberships #=> Array
	domain_memberships.each do |i|
		puts "Domain: " + i.domain
		puts "Domain Status: " + i.status
		puts "Domain FQDN: " + i.fqdn
		puts "Domain IAM Role: " + i.iam_role_name
	end

copy_tags_to_snapshot = resp.db_instances[0].copy_tags_to_snapshot #=> Boolean
puts "Copy Tags to Snapshot: " + copy_tags_to_snapshot.to_s
monitoring_interval = resp.db_instances[0].monitoring_interval #=> Integer
puts "Monitoring Interval: " + monitoring_interval.to_s
enhanced_monitoring_resource_arn = resp.db_instances[0].enhanced_monitoring_resource_arn #=> String
puts "Enhanced Monitoring Resource ARN: " + enhanced_monitoring_resource_arn.to_s
monitoring_role_arn = resp.db_instances[0].monitoring_role_arn #=> String
puts "Monitoring Role ARN: " + monitoring_role_arn.to_s
promotion_tier = resp.db_instances[0].promotion_tier #=> Integer
puts "Promotion Tier: " + promotion_tier.to_s
db_instance_arn = resp.db_instances[0].db_instance_arn #=> String
puts "DB Instance ARN: " + db_instance_arn
timezone = resp.db_instances[0].timezone #=> String
puts "Timezone: " + timezone.to_s
iam_database_authentication_enabled = resp.db_instances[0].iam_database_authentication_enabled #=> Boolean
puts "IAM Database Authentication Enabled: " + iam_database_authentication_enabled.to_s
performance_insights_enabled = resp.db_instances[0].performance_insights_enabled #=> Boolean
puts "Performance Insights Enabled: " + performance_insights_enabled.to_s
performance_insights_kms_key_id = resp.db_instances[0].performance_insights_kms_key_id #=> String
puts "Performance Insights KMS Key ID: " + performance_insights_kms_key_id.to_s
performance_insights_retention_period = resp.db_instances[0].performance_insights_retention_period #=> Integer
puts "Perfomance Insights Retention Period: " + performance_insights_retention_period.to_s

enabled_cloudwatch_logs_exports = resp.db_instances[0].enabled_cloudwatch_logs_exports #=> Array
	enabled_cloudwatch_logs_exports.each do |i|
		puts "Enabled Cloudwatch Logs Export: " + i.to_s
	end

# Note: No Return
processor_features = resp.db_instances[0].processor_features #=> Array
	processor_features.each do |i| 
		puts "Processor Features - Name: " + i.name
		puts "Processor Features - Value: " + i.value
	end

deletion_protection = resp.db_instances[0].deletion_protection #=> Boolean
puts "Deletion Protection: " + deletion_protection.to_s

# Note: No Return
associated_roles = resp.db_instances[0].associated_roles #=> Array
	associated_roles.each do |i| 
		puts i.role_arn
		puts i.feature_name
		puts i.status
		puts i.listener_endpoint.address
		puts i.listener_endpoint.port
		puts i.listener_endpoint.hosted_zone_id
		puts i.max_allocated_storage
	end


# % resp = client.describe_db_instances({
# %   db_instance_identifier: "String",
# %   filters: [
# %     {
# %       name: "String", # required
# %       values: ["String"], # required
# %     },
# %   ],
# %   max_records: 1,
# %   marker: "String",
# % })

# % RETURN
# % resp.marker #=> String
# % resp.db_instances #=> Array
# % resp.db_instances[0].db_instance_identifier #=> String
# % resp.db_instances[0].db_instance_class #=> String
# % resp.db_instances[0].engine #=> String
# % resp.db_instances[0].db_instance_status #=> String
# % resp.db_instances[0].master_username #=> String
# % resp.db_instances[0].db_name #=> String
# % resp.db_instances[0].endpoint.address #=> String
# % resp.db_instances[0].endpoint.port #=> Integer
# % resp.db_instances[0].endpoint.hosted_zone_id #=> String
# % resp.db_instances[0].allocated_storage #=> Integer
# % resp.db_instances[0].instance_create_time #=> Time
# % resp.db_instances[0].preferred_backup_window #=> String
# % resp.db_instances[0].backup_retention_period #=> Integer
# % resp.db_instances[0].db_security_groups #=> Array
# % resp.db_instances[0].db_security_groups[0].db_security_group_name #=> String
# % resp.db_instances[0].db_security_groups[0].status #=> String
# % resp.db_instances[0].vpc_security_groups #=> Array
# % resp.db_instances[0].vpc_security_groups[0].vpc_security_group_id #=> String
# % resp.db_instances[0].vpc_security_groups[0].status #=> String
# % resp.db_instances[0].db_parameter_groups #=> Array
# % resp.db_instances[0].db_parameter_groups[0].db_parameter_group_name #=> String
# % resp.db_instances[0].db_parameter_groups[0].parameter_apply_status #=> String
# % resp.db_instances[0].availability_zone #=> String
# % resp.db_instances[0].db_subnet_group.db_subnet_group_name #=> String
# % resp.db_instances[0].db_subnet_group.db_subnet_group_description #=> String
# % resp.db_instances[0].db_subnet_group.vpc_id #=> String
# % resp.db_instances[0].db_subnet_group.subnet_group_status #=> String
# % resp.db_instances[0].db_subnet_group.subnets #=> Array
# % resp.db_instances[0].db_subnet_group.subnets[0].subnet_identifier #=> String
# % resp.db_instances[0].db_subnet_group.subnets[0].subnet_availability_zone.name #=> String
# % resp.db_instances[0].db_subnet_group.subnets[0].subnet_status #=> String
# % resp.db_instances[0].db_subnet_group.db_subnet_group_arn #=> String
# % resp.db_instances[0].preferred_maintenance_window #=> String
# % resp.db_instances[0].pending_modified_values.db_instance_class #=> String
# % resp.db_instances[0].pending_modified_values.allocated_storage #=> Integer
# % resp.db_instances[0].pending_modified_values.master_user_password #=> String
# % resp.db_instances[0].pending_modified_values.port #=> Integer
# % resp.db_instances[0].pending_modified_values.backup_retention_period #=> Integer
# % resp.db_instances[0].pending_modified_values.multi_az #=> Boolean
# % resp.db_instances[0].pending_modified_values.engine_version #=> String
# % resp.db_instances[0].pending_modified_values.license_model #=> String
# % resp.db_instances[0].pending_modified_values.iops #=> Integer
# % resp.db_instances[0].pending_modified_values.db_instance_identifier #=> String
# % resp.db_instances[0].pending_modified_values.storage_type #=> String
# % resp.db_instances[0].pending_modified_values.ca_certificate_identifier #=> String
# % resp.db_instances[0].pending_modified_values.db_subnet_group_name #=> String
# % resp.db_instances[0].pending_modified_values.pending_cloudwatch_logs_exports.log_types_to_enable #=> Array
# % resp.db_instances[0].pending_modified_values.pending_cloudwatch_logs_exports.log_types_to_enable[0] #=> String
# % resp.db_instances[0].pending_modified_values.pending_cloudwatch_logs_exports.log_types_to_disable #=> Array
# % resp.db_instances[0].pending_modified_values.pending_cloudwatch_logs_exports.log_types_to_disable[0] #=> String
# % resp.db_instances[0].pending_modified_values.processor_features #=> Array
# % resp.db_instances[0].pending_modified_values.processor_features[0].name #=> String
# % resp.db_instances[0].pending_modified_values.processor_features[0].value #=> String
# % resp.db_instances[0].latest_restorable_time #=> Time
# % resp.db_instances[0].multi_az #=> Boolean
# % resp.db_instances[0].engine_version #=> String
# % resp.db_instances[0].auto_minor_version_upgrade #=> Boolean
# % resp.db_instances[0].read_replica_source_db_instance_identifier #=> String
# % resp.db_instances[0].read_replica_db_instance_identifiers #=> Array
# % resp.db_instances[0].read_replica_db_instance_identifiers[0] #=> String
# % resp.db_instances[0].read_replica_db_cluster_identifiers #=> Array
# % resp.db_instances[0].read_replica_db_cluster_identifiers[0] #=> String
# % resp.db_instances[0].license_model #=> String
# % resp.db_instances[0].iops #=> Integer
# % resp.db_instances[0].option_group_memberships #=> Array
# % resp.db_instances[0].option_group_memberships[0].option_group_name #=> String
# % resp.db_instances[0].option_group_memberships[0].status #=> String
# % resp.db_instances[0].character_set_name #=> String
# % resp.db_instances[0].secondary_availability_zone #=> String
# % resp.db_instances[0].publicly_accessible #=> Boolean
# % resp.db_instances[0].status_infos #=> Array
# % resp.db_instances[0].status_infos[0].status_type #=> String
# % resp.db_instances[0].status_infos[0].normal #=> Boolean
# % resp.db_instances[0].status_infos[0].status #=> String
# % resp.db_instances[0].status_infos[0].message #=> String
# % resp.db_instances[0].storage_type #=> String
# % resp.db_instances[0].tde_credential_arn #=> String
# % resp.db_instances[0].db_instance_port #=> Integer
# % resp.db_instances[0].db_cluster_identifier #=> String
# % resp.db_instances[0].storage_encrypted #=> Boolean
# % resp.db_instances[0].kms_key_id #=> String
# % resp.db_instances[0].dbi_resource_id #=> String
# % resp.db_instances[0].ca_certificate_identifier #=> String
# % resp.db_instances[0].domain_memberships #=> Array
# % resp.db_instances[0].domain_memberships[0].domain #=> String
# % resp.db_instances[0].domain_memberships[0].status #=> String
# % resp.db_instances[0].domain_memberships[0].fqdn #=> String
# % resp.db_instances[0].domain_memberships[0].iam_role_name #=> String
# % resp.db_instances[0].copy_tags_to_snapshot #=> Boolean
# % resp.db_instances[0].monitoring_interval #=> Integer
# % resp.db_instances[0].enhanced_monitoring_resource_arn #=> String
# % resp.db_instances[0].monitoring_role_arn #=> String
# % resp.db_instances[0].promotion_tier #=> Integer
# % resp.db_instances[0].db_instance_arn #=> String
# % resp.db_instances[0].timezone #=> String
# % resp.db_instances[0].iam_database_authentication_enabled #=> Boolean
# % resp.db_instances[0].performance_insights_enabled #=> Boolean
# % resp.db_instances[0].performance_insights_kms_key_id #=> String
# % resp.db_instances[0].performance_insights_retention_period #=> Integer
# % resp.db_instances[0].enabled_cloudwatch_logs_exports #=> Array
# % resp.db_instances[0].enabled_cloudwatch_logs_exports[0] #=> String
# % resp.db_instances[0].processor_features #=> Array
# % resp.db_instances[0].processor_features[0].name #=> String
# % resp.db_instances[0].processor_features[0].value #=> String
# % resp.db_instances[0].deletion_protection #=> Boolean
# % resp.db_instances[0].associated_roles #=> Array
# % resp.db_instances[0].associated_roles[0].role_arn #=> String
# % resp.db_instances[0].associated_roles[0].feature_name #=> String
# % resp.db_instances[0].associated_roles[0].status #=> String
# % resp.db_instances[0].listener_endpoint.address #=> String
# % resp.db_instances[0].listener_endpoint.port #=> Integer
# % resp.db_instances[0].listener_endpoint.hosted_zone_id #=> String
# % resp.db_instances[0].max_allocated_storage #=> Integer