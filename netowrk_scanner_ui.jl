using Gtk
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
  # create the main window
  win = Window()
  win.border_width = 10

  # create the text entry widgets
  ip_address_entry = Entry()
  port_range_entry = Entry()

  # create the scan button
  scan_button = Button("Scan")

  # create the vertical box layout
  vbox = Box(:vertical)

  # add the text entry widgets and buttons to the layout
  push!(vbox, ip_address_entry)
  push!(vbox, port_range_entry)
  push!(vbox, scan_button)

  # add the layout to the main window
  win.add(vbox)

  # show the main window
  showall(win)

  # connect the scan button to the scan function
  scan_button.on_clicked = () -> begin
    ip_address = ip_address_entry.text
    port_range = map(parse, split(port_range_entry.text, "-"))
    open_ports = scan(ip_address, port_range)
    message_dialog = MessageDialog(win, :destroy_with_parent, :info, :ok, "Open ports: $(open_ports)")
    message_dialog.run()
    destroy(message_dialog)
  end

  # start the GTK event loop
  Gtk.main()
end

main()
