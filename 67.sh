sudo sh -c 'command -v dracut >/dev/null || { echo "dracut not found — this system is not supported"; exit 1; }; \
[ -f /etc/modprobe.d/nvidia.conf ] || touch /etc/modprobe.d/nvidia.conf; \
grep -qxF "options nvidia_drm modeset=1" /etc/modprobe.d/nvidia.conf || echo "options nvidia_drm modeset=1" >> /etc/modprobe.d/nvidia.conf; \
[ -f /etc/dracut.conf.d/nvidia.conf ] || touch /etc/dracut.conf.d/nvidia.conf; \
grep -qxF "add_drivers+=\" nvidia nvidia_modeset nvidia_uvm nvidia_drm \"" /etc/dracut.conf.d/nvidia.conf || echo "add_drivers+=\" nvidia nvidia_modeset nvidia_uvm nvidia_drm \"" >> /etc/dracut.conf.d/nvidia.conf; \
grep -qxF "install_items+=\" /etc/modprobe.d/nvidia.conf \"" /etc/dracut.conf.d/nvidia.conf || echo "install_items+=\" /etc/modprobe.d/nvidia.conf \"" >> /etc/dracut.conf.d/nvidia.conf; \
dracut -f && echo "Done. Reboot to apply."'
