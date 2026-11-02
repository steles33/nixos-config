{ config, pkgs, ... }:
{
  # Create mpd config file manually
  home.file.".config/mpd/mpd.conf".text = ''
    # Files and directories
    music_directory		"~/Sync/music"
    playlist_directory		"~/.config/mpd/playlists"
    db_file			"~/.config/mpd/database"
    log_file			"~/.config/mpd/log"
    pid_file			"~/.config/mpd/pid"
    state_file			"~/.config/mpd/state"
    sticker_file			"~/.config/mpd/sticker.sql"

    # General music daemon options
    bind_to_address		"127.0.0.1"
    port				"6600"
    restore_paused "yes"
    auto_update	"yes"
    follow_outside_symlinks	"yes"
    follow_inside_symlinks		"yes"

    # Input plugins
    input {
      plugin "curl"
    }

    # Audio outputs
    audio_output {
      type		"pipewire"
      name		"pipewire"
    }

    audio_output {
      type            "fifo"
      name            "my_fifo"
      path            "/tmp/mpd.fifo"
      format          "44100:16:2"
    }
  '';

  # Create ncmpcpp config file manually
  home.file.".config/ncmpcpp/config".text = ''
    ncmpcpp_directory = ~/.config/ncmpcpp

    mpd_host = localhost
    mpd_port = 6600
    mpd_connection_timeout = 5

    mpd_music_dir = ~/Sync/music
    mpd_crossfade_time = 5

    visualizer_data_source = /tmp/mpd.fifo
    visualizer_output_name = my_fifo
    visualizer_in_stereo = yes
    visualizer_type = spectrum
    visualizer_look = ●▮
    visualizer_spectrum_smooth_look = yes
    visualizer_spectrum_dft_size = 5
    visualizer_spectrum_gain = 10
    visualizer_spectrum_hz_min = 20
    visualizer_spectrum_hz_max = 20000
    visualizer_spectrum_log_scale_x = yes
    visualizer_spectrum_log_scale_y = yes
  '';

  # Create necessary directories
  home.file.".config/mpd/playlists/.keep".text = "";
  home.file.".config/ncmpcpp/.keep".text = "";

  # Install mpd and ncmpcpp as user packages
  home.packages = with pkgs; [
    mpd
    ncmpcpp
    mpc
  ];

  # Optional: Create a systemd user service for mpd
  systemd.user.services.mpd = {
    Unit = {
      Description = "Music Player Daemon";
      After = [ "network.target" "sound.target" ];
    };
    
    Service = {
      Type = "notify";
      ExecStart = "${pkgs.mpd}/bin/mpd --no-daemon %h/.config/mpd/mpd.conf";
      Restart = "on-failure";
      RestartSec = 5;
    };
    
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
