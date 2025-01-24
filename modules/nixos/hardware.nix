{ config, lib, ... }: {
  options = {
    system.cpu = lib.mkOption {
      default = null;
      type = lib.types.nullOr (lib.types.enum [ "intel" "amd" ]);
      description = ''
        Specify the cpu use by host.
      '';
    };
  };
  config = {
    hardware.cpu.intel.updateMicrocode = (config.system.cpu == "intel");
    hardware.cpu.amd.updateMicrocode = (config.system.cpu == "amd");
    hardware.enableRedistributableFirmware = true;
  };
}
