{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [

        # Exploits
        exploitdb

        # Forensics
        gef
        stegseek
        steghide
        stegsolve
        zsteg
        sleuthkit
        exif
        exiftool

        # Fuzzers
        ffuf
        gobuster
        wfuzz
        dirbuster

        # Bin
        ghidra-bin
        gdb
        binwalk

        # Network
        netcat-gnu
        iputils
        putty
        whois
        
        # Password
        hashcat
        hashcat-utils
        john
        thc-hydra
        ncrack

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

        # SQL
        sqlmap

        # Misc
        libressl
        pwntools
        metasploit
    ];
}