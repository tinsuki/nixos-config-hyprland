# grub.bootloader.nix
{
    options = {
        enable = lib.mkOption {
            type = with lib.types; bool;
            default = true;
            description = ''
                Whether to enable the GRUB bootloader.
            '';
        };
        device = lib.mkOption {
            type = lib.types.device;
            default = "nodev";
            description = ''
                The device to install the bootloader on.
            '';
        };
        useOSProber = lib.mkOption {
            type = with lib.types; bool;
            default = true;
            description = ''
                Whether to use os-prober to detect other operating systems.
            '';
        };
        efiSupport = lib.mkOption {
            type = with lib.types; bool;
            default = true;
            description = ''
                Whether to enable EFI support.
            '';
        };
        enableCryptodisk = lib.mkOption {
            type = with lib.types; bool;
            default = false;
            description = ''
                Whether to enable cryptodisk support.
            '';
        };
        canTouchEfiVariables = lib.mkOption {
            type = with lib.types; bool;
            default = true;
            description = ''
                Whether to enable the ability to touch EFI variables.
            '';
        };
    };
    config = lib.mkIf options.enable {
        boot.loader.grub = {
            enable = ${options.enable};
            device = ${options.device};
            useOSProber = ${options.useOSProber};
            efiSupport = ${options.efiSupport};
            enableCryptodisk = ${options.enableCryptodisk};
            canTouchEfiVariables = ${options.canTouchEfiVariables};
        };
    };
}