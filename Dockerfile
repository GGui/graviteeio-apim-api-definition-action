FROM graviteeio/cli:1.0
 
COPY entrypoint.sh /entrypoint.sh
 
ENTRYPOINT [ "/entrypoint.sh" ]
