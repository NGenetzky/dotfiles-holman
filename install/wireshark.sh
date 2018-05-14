
# Dumpcap can be installed in a way that allows members of the "wireshark"
# system group to capture packets. This is recommended over the alternative of
# running Wireshark/Tshark directly as root, because less of the code will run
# with elevated privileges.
#
# For more detailed information please see
# /usr/share/doc/wireshark-common/README.Debian.
#
# Enabling this feature may be a security risk, so it is disabled by default.
# If in doubt, it is suggested to leave it disabled.
#
# Should non-superusers be able to capture packets?

PROG="wireshark"

command -v $PROG >/dev/null 2>&1 || ( \
    apt install $PROG \
)

sudo adduser $USER wireshark
