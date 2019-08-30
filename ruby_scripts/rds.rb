
require 'aws-sdk-rds'  # v3: require 'aws-sdk'


rds = Aws::RDS::Client.new(region: 'us-east-1')

db_instance_identifier = 'corepoint-mssql-prod'

resp = rds.describe_db_instances({
  db_instance_identifier: db_instance_identifier, 
})

resphash = resp.to_h

db_instance_identifier = resp.db_instances[0].db_instance_identifier #=> String
db_instance_class = resp.db_instances[0].db_instance_class #=> String
engine = resp.db_instances[0].engine #=> String
db_instance_status = resp.db_instances[0].db_instance_status #=> String
master_username = resp.db_instances[0].master_username #=> String
db_name = resp.db_instances[0].db_name #=> String
endpointaddress = resp.db_instances[0].endpoint.address #=> String
endpointport = resp.db_instances[0].endpoint.port #=> Integer
endpointhosted_zone_id = resp.db_instances[0].endpoint.hosted_zone_id #=> String
allocated_storage = resp.db_instances[0].allocated_storage #=> Integer
instance_create_time = resp.db_instances[0].instance_create_time #=> Time
preferred_backup_window = resp.db_instances[0].preferred_backup_window #=> String
backup_retention_period = resp.db_instances[0].backup_retention_period #=> Integer
db_security_groups = resp.db_instances[0].db_security_groups #=> Array

	db_security_groups.each do |i| 
		puts i
		puts i.status
	end 

# db_security_groups_status = resp.db_instances[0].db_security_groups[0].status #=> String
vpc_security_groups = resp.db_instances[0].vpc_security_groups #=> Array

	vpc_security_groups.each do |i| 
		puts i.vpc_security_group_id
		puts i.status 
	end 

db_parameter_groups = resp.db_instances[0].db_parameter_groups #=> Array

	db_parameter_groups.each do |i|
		puts i.db_parameter_group_name
		puts i.parameter_apply_status
	end

availability_zone = resp.db_instances[0].availability_zone #=> String
db_subnet_group_name = resp.db_instances[0].db_subnet_group.db_subnet_group_name #=> String
db_subnet_group_description = resp.db_instances[0].db_subnet_group.db_subnet_group_description #=> String
vpc_id = resp.db_instances[0].db_subnet_group.vpc_id #=> String
subnet_group_status = resp.db_instances[0].db_subnet_group.subnet_group_status #=> String

subnets = resp.db_instances[0].db_subnet_group.subnets #=> Array
	subnets.each do |i| 
		puts i.subnet_identifier
		puts i.subnet_availability_zone.name
		puts i.subnet_status
	end 

db_subnet_group_arn = resp.db_instances[0].db_subnet_group.db_subnet_group_arn #=> String
preferred_maintenance_window = resp.db_instances[0].preferred_maintenance_window #=> String
latest_restorable_time = resp.db_instances[0].latest_restorable_time #=> Time
multi_az = resp.db_instances[0].multi_az #=> Boolean
engine_version = resp.db_instances[0].engine_version #=> String
auto_minor_version_upgrade = resp.db_instances[0].auto_minor_version_upgrade #=> Boolean
read_replica_source_db_instance_identifier = resp.db_instances[0].read_replica_source_db_instance_identifier #=> String
read_replica_db_instance_identifiers = resp.db_instances[0].read_replica_db_instance_identifiers #=> Array
	read_replica_db_instance_identifiers.each do |i|
		puts i.read_replica_db_instance_identifiers
	end 
read_replica_db_cluster_identifiers = resp.db_instances[0].read_replica_db_cluster_identifiers #=> Array
	read_replica_db_cluster_identifiers.each do |i| 
		i.read_replica_db_cluster_identifiers
	end
license_model = resp.db_instances[0].license_model #=> String
iops = resp.db_instances[0].iops #=> Integer
option_group_memberships = resp.db_instances[0].option_group_memberships #=> Array
	option_group_memberships.each do |i|
		i.option_group_name
		i.status
	end

character_set_name = resp.db_instances[0].character_set_name #=> String
secondary_availability_zone = resp.db_instances[0].secondary_availability_zone #=> String
publicly_accessible = resp.db_instances[0].publicly_accessible #=> Boolean
status_infos = resp.db_instances[0].status_infos #=> Array
	status_infos.each do |i|
		i.status_type
		i.normal
		i.status
		i.message
	end

storage_type = resp.db_instances[0].storage_type #=> String
tde_credential_arn = resp.db_instances[0].tde_credential_arn #=> String
db_instance_port = resp.db_instances[0].db_instance_port #=> Integer
db_cluster_identifier = resp.db_instances[0].db_cluster_identifier #=> String
storage_encrypted = resp.db_instances[0].storage_encrypted #=> Boolean
kms_key_id = resp.db_instances[0].kms_key_id #=> String
dbi_resource_id = resp.db_instances[0].dbi_resource_id #=> String
ca_certificate_identifier = resp.db_instances[0].ca_certificate_identifier #=> String
domain_memberships = resp.db_instances[0].domain_memberships #=> Array
	domain_memberships.each do |i|
		i.domain
		i.status
		i.fqdn
		i.iam_role_name
	end

copy_tags_to_snapshot = resp.db_instances[0].copy_tags_to_snapshot #=> Boolean
monitoring_interval = resp.db_instances[0].monitoring_interval #=> Integer
enhanced_monitoring_resource_arn = resp.db_instances[0].enhanced_monitoring_resource_arn #=> String
monitoring_role_arn = resp.db_instances[0].monitoring_role_arn #=> String
promotion_tier = resp.db_instances[0].promotion_tier #=> Integer
db_instance_arn = resp.db_instances[0].db_instance_arn #=> String
timezone = resp.db_instances[0].timezone #=> String
iam_database_authentication_enabled = resp.db_instances[0].iam_database_authentication_enabled #=> Boolean
performance_insights_enabled = resp.db_instances[0].performance_insights_enabled #=> Boolean
performance_insights_kms_key_id = resp.db_instances[0].performance_insights_kms_key_id #=> String
performance_insights_retention_period = resp.db_instances[0].performance_insights_retention_period #=> Integer

enabled_cloudwatch_logs_exports = resp.db_instances[0].enabled_cloudwatch_logs_exports #=> Array
	enabled_cloudwatch_logs_exports.each do |i|
		puts i
	end
enabled_cloudwatch_logs_exports = resp.db_instances[0].enabled_cloudwatch_logs_exports[0] #=> String
puts enabled_cloudwatch_logs_exports

processor_features = resp.db_instances[0].processor_features #=> Array
	processor_features.each do |i| 
		puts i.name
		puts i.value
	end

deletion_protection = resp.db_instances[0].deletion_protection #=> Boolean
puts deletion_protection

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

# listener_endpoint_address = resp.db_instances[0].listener_endpoint.address #=> String
# listener_endpoint_port = resp.db_instances[0].listener_endpoint.port #=> Integer
# listener_endpoint_hosted_zone_id = resp.db_instances[0].listener_endpoint.hosted_zone_id #=> String
max_allocated_storage = resp.db_instances[0].max_allocated_storage #=> Integer

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