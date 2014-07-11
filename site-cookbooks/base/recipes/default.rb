%w{
  ip6tables
  iptables
}.each do |service_name|
  service service_name do
    action [ :disable, :stop ]
  end
end
