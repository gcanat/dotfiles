#!/usr/bin/env ruby

def dconf(schema, name, val)
  system "gsettings", "set", schema, name, val
end

def foot_theme(colors)
  config = File.join(ENV.fetch("XDG_CONFIG_HOME", File.join(Dir.home, ".config")), "foot", "foot.ini")

  if File.exist?(config)
    text = File.read(config)
    text = text.gsub(/^(\s*initial-color-theme\s*=\s*)\S+/) { "#{$1}#{colors}" }
    File.write(config, text)
end

  # SIGUSR1 = switch running foot instances to dark, SIGUSR2 = to light
  signal = colors == "dark" ? "SIGUSR1" : "SIGUSR2"
  system "pkill", "-u", ENV.fetch("USER"), "--signal", signal, "-x", "foot"
end

def dconf_gnome_interface(name, val)
  dconf("org.gnome.desktop.interface", name, val)
end

dconf_gnome_interface "text-scaling-factor", "1.0"
dconf_gnome_interface "cursor-size", "24"

colors = case ARGV[0]
         when "dark"
           "dark"
          when "toggle"
            theme = IO.popen("gsettings get org.gnome.desktop.interface gtk-theme").read
            if theme.include? "dark"
              "light"
            else
              "dark"
            end
          else
            "light"
          end

case colors
when "dark"
  dconf_gnome_interface "color-scheme", "prefer-dark"
  dconf_gnome_interface "gtk-theme", "Yaru-dark"
  dconf_gnome_interface "icon-theme", "Yaru-dark"
  dconf_gnome_interface "cursor-theme", "Yaru"
  # dconf "org.gnome.gedit.preferences.editor", "scheme", "oblivion"
else 
  dconf_gnome_interface "color-scheme", "prefer-light"
  dconf_gnome_interface "gtk-theme", "Yaru"
  dconf_gnome_interface "icon-theme", "Yaru"
  dconf_gnome_interface "cursor-theme", "Yaru"
  # dconf "org.gnome.gedit.preferences.editor", "scheme", "kate"
end

foot_theme(colors)
