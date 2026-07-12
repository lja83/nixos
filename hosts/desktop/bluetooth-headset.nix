{ config, pkgs, lib, ... }:

{
  my.bluetooth.class = "0x20041C";

  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        Class = "0x20041C";
      };
      LE = {
        # Reduce Bluetooth LE connection latency for faster response times
        MinConnectionInterval = 16;
        MaxConnectionInterval = 16;
        ConnectionLatency = 10;
        ConnectionSupervisionTimeout = 100;
      };
    };
  };

  # Ensure PipeWire is enabled and configured for desktop audio
  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };
}
