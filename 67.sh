sudo sh -c 'echo ":3 OwO starting n-nvidia setup..."; \
command -v dracut >/dev/null || { echo ":3 OwO dracut not found >.< cannot continue"; exit 1; }; \
if ! lsmod | grep -q nvidia; then echo ":3 OwO nvidia module missing, installing now >w<"; \
dnf install -y akmod-nvidia kernel-devel kernel-headers || { echo ":3 OwO failed to install nvidia >w<"; exit 1; }; fi; \
[ -f /etc/modprobe.d/nvidia.conf ] || { touch /etc/modprobe.d/nvidia.conf; echo ":3 OwO created modprobe config >w<"; }; \
grep -qxF "options nvidia_drm modeset=1" /etc/modprobe.d/nvidia.conf || echo "options nvidia_drm modeset=1" >> /etc/modprobe.d/nvidia.conf; \
[ -f /etc/dracut.conf.d/nvidia.conf ] || { touch /etc/dracut.conf.d/nvidia.conf; echo ":3 OwO created dracut config >w<"; }; \
grep -qxF "add_drivers+=\" nvidia nvidia_modeset nvidia_uvm nvidia_drm \"" /etc/dracut.conf.d/nvidia.conf || echo "add_drivers+=\" nvidia nvidia_modeset nvidia_uvm nvidia_drm \"" >> /etc/dracut.conf.d/nvidia.conf; \
grep -qxF "install_items+=\" /etc/modprobe.d/nvidia.conf \"" /etc/dracut.conf.d/nvidia.conf || echo "install_items+=\" /etc/modprobe.d/nvidia.conf \"" >> /etc/dracut.conf.d/nvidia.conf; \
echo ":3 OwO regenerating initramfs with dracut... >w<"; dracut -f && echo ":3 OwO done! Reboot meow >w<"'
