{ config, pkgs, ... }:
{
  programs.mpd = {
    enable = true;
    
    # Files and directories
    musicDirectory = "${config.home.homeDirectory}/Sync/music";
    playlistDirectory = "${config.xdg.configHome}/mpd/playlists";
    dbFile = "${config.xdg.configHome}/mpd/database";
    logFile = "${config.xdg.configHome}/mpd/log";
    pidFile = "${config.xdg.configHome}/mpd/pid";
    stateFile = "${config.xdg.configHome}/mpd/state";
    
    # General music daemon options
    bind_to_address = "127.0.0.1";
    port = 6600;
    restore_paused = true;
    auto_update = true;
    follow_outside_symlinks = true;
    follow_inside_symlinks = true;
    
    # Input plugins
    inputs.curl.enabled = true;
    
    # Audio outputs
    outputs = {
      pipewire = {
        type = "pipewire";
        name = "pipewire";
      };
      fifo = {
        type = "fifo";
        name = "my_fifo";
        path = "/tmp/mpd.fifo";
        format = "44100:16:2";
      };
    };
  };

  programs.ncmpcpp = {
    enable = true;
    settings = {
      # Connection settings
      ncmpcpp_directory = "${config.xdg.configHome}/ncmpcpp";
      mpd_host = "localhost";
      mpd_port = 6600;
      mpd_connection_timeout = 5;
      mpd_music_dir = "${config.home.homeDirectory}/Sync/music";
      mpd_crossfade_time = 5;
      
      # Visualizer settings
      visualizer_data_source = "/tmp/mpd.fifo";
      visualizer_output_name = "my_fifo";
      visualizer_in_stereo = "yes";
      visualizer_type = "spectrum";
      visualizer_look = "●▮";
      visualizer_spectrum_smooth_look = "yes";
      visualizer_spectrum_dft_size = 5;
      visualizer_spectrum_gain = 10;
      visualizer_spectrum_hz_min = 20;
      visualizer_spectrum_hz_max = 20000;
      visualizer_spectrum_log_scale_x = "yes";
      visualizer_spectrum_log_scale_y = "yes";
    };
  };

  # Optional: mpc-cli for command-line control
  home.packages = with pkgs; [
    mpc-cli
  ];
}
