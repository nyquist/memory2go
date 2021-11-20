## Enables or disables doh on errors


:local disableMsg "Disabling DoH";
:local enableMsg "Enabling DoH";
:local dohErrors [:len [/log find where time>([/system clock get time] - 5m) and message~"DoH server connection error"]];
:local dohStatus [/ip dns get use-doh-server];
:local dohDisabledRecently [:len [/log find where time>([/system clock get time] - 5m) and message~"$disableMsg"]];
#:log debug "debug: dohErrors: $dohErrors. dohStatus: $dohStatus. dohDisabledRecently: $dohDisabledRecently";
:if ($dohErrors>0 && $dohStatus!="") \
    do={ \
        :log info "dohErrors: $dohErrors. dohStatus: $dohStatus";
        :log info $disableMsg; 
        :put [ip dns set use-doh-server=""];
    } \
    else={ \
        :if ($dohStatus="" && $dohDisabledRecently=0)\
            do={ \
                :log info "dohErrors: $dohErrors. dohStatus: $dohStatus";
                :log info $enableMsg;
                :put [ip dns set use-doh-server="https://cloudflare-dns.com/dns-query"];
            }    
    }
