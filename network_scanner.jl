using Sockets

function scan(ip_address::String, port_range::Tuple{Int, Int})
  open_ports = []
  for port in port_range[1]:port_range[2]
    s = connect(ip_address, port)
    if s != 0
      push!(open_ports, port)
    end
  end
  return open_ports
end

function main()
  ip_address = "192.168.1.1"
  port_range = (1, 1024)
  open_ports = scan(ip_address, port_range)
  println("Open ports on ", ip_address, ": ", open_ports)
end

main()
