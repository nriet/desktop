#!/usr/bin/env bash
set -ex

echo "Finalshell installation"

wget www.hostbuf.com/downloads/finalshell_install_linux.sh
chmod +x finalshell_install_linux.sh
./finalshell_install_linux.sh
chmod +x /usr/lib/FinalShell/bin/FinalShell
rm -rf finalshell_install_linux.sh finalshell_data_linux.zip