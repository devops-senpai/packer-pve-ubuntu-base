/*
    DESCRIPTION:
    Ubuntu Server 24.04 LTS variables used by the Packer Plugin for Proxmox (proxmox-iso).
*/

// Guest Operating System Metadata
vm_os_language   = "en_US"
vm_os_keyboard   = "us"
vm_os_timezone   = "UTC"
vm_os_family     = "linux"
vm_os_name       = "ubuntu"
vm_os_version    = "24.04-lts"

// Virtual Machine Guest Operating System Setting
vm_os_type       = "l26"
vm_cloudinit     = false

// Virtual Machine Hardware Settings
vm_bios                 = "ovmf"
vm_cpu_count            = 1
vm_cpu_sockets          = 1
vm_cpu_type             = "x86-64-v2-AES"
vm_mem_size             = 2048
vm_disk_type            = "scsi"
vm_disk_size            = "32G"
vm_disk_format          = "raw"
// vm_disk_controller_type = "virtio-scsi-pci"
vm_disk_controller_type = "virtio-scsi-single"
vm_network_card_model   = "virtio"

// Removable Media Settings
// iso_path     = "iso"
// iso_file     = "ubuntu-24.04-live-server-amd64.iso"
// iso_checksum = "https://releases.ubuntu.com/noble/SHA256SUMS"

// Boot Settings
//vm_boot      = "order=virtio0;ide2;net0"
vm_boot      = "order=scsi0;ide2;net0"
vm_boot_wait = "15s"

// EFI Settings
vm_firmware_path         = "./OVMF.fd"

// Network
// vm_dns_list = ["10.0.0.1", "1.1.1.1", "8.8.8.8" ]
// vm_ip_address  = "10.0.0.69"
// vm_ip_gateway  = "10.0.0.1"
// vm_ip_netmask  = 16
vm_network_device = "enp6s18"

// manually set
iso_path     = "iso"
iso_file = "ubuntu-24.04.3-live-server-amd64.iso"
iso_checksum = "sha256:c3514bf0056180d09376462a7a1b4f213c1d6e8ea67fae5c25099c6fd3d8274b"
common_iso_storage = "NFS"
proxmox_node = "proxmox01"
proxmox_hostname = "proxmox01"
proxmox_insecure_connection = "true"

vm_disk_partitions = [
    {
      "name": "bootefi",
      "size": 1024,
      "format": {
        "label": "EFIFS",
        "fstype": "fat32"
      },
      "mount": {
        "path": "/boot/efi",
        "options": ""
      },
      "volume_group": ""
    },
    {
      "name": "boot",
      "size": 1024,
      "format": {
        "label": "BOOTFS",
        "fstype": "ext4"
      },
      "mount": {
        "path": "/boot",
        "options": ""
      },
      "volume_group": ""
    },
    {
      "name": "root",
      "size": -1,
      "format": {
        "label": "",
        "fstype": ""
      },
      "mount": {
        "path": "",
        "options": ""
      },
      "volume_group": "sysvg"
    }
  ]
vm_disk_lvm = [
    {
      "name": "sysvg",
      "partitions": [
        {
          "name": "root-lv",
          "size": 15360,
          "format": {
            "label": "ROOTFS",
            "fstype": "ext4"
          },
          "mount": {
            "path": "/",
            "options": "defaults"
          }
        }
      ]
    }
  ]
vm_disk_device = "sda"
vm_disk_use_swap = "false"

// Boot and Provisioning Settings
common_data_source       = "http"
common_http_interface    = null
common_http_bind_address = null
common_http_port_min     = 8000
common_http_port_max     = 8099
common_ip_wait_timeout   = "20m"
common_shutdown_timeout  = "15m"

// Proxmox settings for VM templates
vm_bridge_interface  = "vmbr0"
vm_vlan_tag          = ""
vm_firewall          = true
vm_storage_pool = "iSCI-LVM"
vm_ssd          = true
vm_io_thread    = true
vm_machine      = "q35"
// vm_serials      = [ "socket", "/dev/ttyS0" ]
// vm_vga          = [
//   {
//     "type": "serial0",
//     "memory": 32
//   }
// ]

vm_efi_storage_pool      = "iSCI-LVM"
vm_efi_type              = "4m"
vm_efi_pre_enrolled_keys = true
