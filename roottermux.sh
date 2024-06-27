if [ -z "\$1" ]; then
    exec \$command;
else
    \$command -c "\$com";
fi
EOM

    print_ew "info" "The start script has been successfully created!";

    print_ew "info" "Fixing shebang of start.sh, please wait...";
    
    termux-fix-shebang $bin > /dev/null 2>&1;
    
    print_ew "info" "Successfully fixed shebang of start.sh!";

    print_ew "info" "Making start.sh executable please wait...";

    chmod +x $bin > /dev/null 2>&1;

    print_ew "info" "Successfully made start.sh executable";

    print_ew "info" "Cleaning up please wait...";

    rm ubuntu.tar.gz -rf > /dev/null 2>&1;

    print_ew "info" "Successfully cleaned up!";

    print_ew "info" "installation completed! Run => bash start.sh";

    rm -rf .git 2>&1;

}

trap '' 2

    if [ "$1" == "-y" ]; then
        fn_install;
    elif [ "$1" == "" ]; then
        print_ew "question" "Do you want to install ubuntu-in-termux? [Y/n] " && read cmd;
        if [ "$cmd" == "y" ]; then
            fn_install;
        elif [ "$cmd" == "Y" ]; then
            fn_install;
        else
            print_ew "error" "Installation aborted.";
        fi
    else
        print_ew "error" "Installation aborted.";
    fi
