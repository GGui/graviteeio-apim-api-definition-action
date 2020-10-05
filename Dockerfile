FROM graviteeio/cli:0.1
 
COPY entrypoint.sh /entrypoint.sh
 
ENTRYPOINT [ "/entrypoint.sh" ]
