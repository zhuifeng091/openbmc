FILES_${PN}-catalog-extralocales = \
            "${exec_prefix}/lib/systemd/catalog/*.*.catalog"
PACKAGES =+ "${PN}-catalog-extralocales"
PACKAGECONFIG_append = " networkd"
PACKAGECONFIG_remove = "machined hibernate ldconfig binfmt backlight localed \
                        quotacheck kdbus ima smack polkit logind bootchart utmp \
                        manpages"
FILESEXTRAPATHS_append := "${THISDIR}/${PN}:"
SRC_URI += "file://default.network"
SRC_URI += "file://0001-sd-bus-Don-t-automatically-add-ObjectManager.patch"
SRC_URI += "file://0006-core-fix-the-check-if-CONFIG_CGROUP_BPF-is-on.patch"

RRECOMMENDS_${PN} += "obmc-targets"
FILES_${PN} += "${systemd_unitdir}/network/default.network"

do_install_append() {
        install -m 644 ${WORKDIR}/default.network ${D}${systemd_unitdir}/network/
}
