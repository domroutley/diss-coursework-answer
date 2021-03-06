resource "openstack_networking_secgroup_v2" "web_sec_group" {
  name        = "Web sec group"
  description = "Webserving security group"
}

resource "openstack_networking_secgroup_rule_v2" "web_sec_grp_rule_https" {
  description       = "HTTPS"
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 88
  port_range_max    = 88
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.web_sec_group.id}"
}

resource "openstack_networking_secgroup_rule_v2" "web_sec_grp_rule_http" {
  description       = "HTTP"
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.web_sec_group.id}"
}

resource "openstack_networking_secgroup_rule_v2" "sec_grp_rule_ssh" {
  description       = "SSH from everywhere"
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.web_sec_group.id}"
}
