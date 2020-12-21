FROM graviteeio/cli:0.3
 
COPY entrypoint.sh /entrypoint.sh
 
ENTRYPOINT [ "/entrypoint.sh" ]
