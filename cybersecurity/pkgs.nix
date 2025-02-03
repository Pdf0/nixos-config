{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [

        # Exploits
        exploitdb

        # Forensics
        gef
        stegseek
        sleuthkit

        # Fuzzers
        ffuf
        gobuster
        wfuzz
        zzuf
        dirbuster

        # Bin
        ghidra-bin
        gdb
        python3Packages.binwalk

        # Network
        netcat-gnu
        iputils
        putty
        whois
        
        # Password
        hashcat
        hashcat-utils
        john

        # Port Scanners
        nmap
        ipscan
        rustscan

        # Proxy
        burpsuite
        zap

        # Traffic
        tcpdump
        wireshark
        wireshark-cli

        # Web
        wpscan
        katana
        jwt-hack

        # Windows (F)
        enum4linux
        enum4linux-ng
        samba
        smbmap
        smbscan

        # Wireless
        aircrack-ng
        netscanner

        # Misc
        libressl
        pwntools
        metasploit
    ];
}