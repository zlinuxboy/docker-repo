FROM zouyq/tailscale

COPY start.sh /start.sh
RUN ["chmod", "+x", "/start.sh"]

EXPOSE 41641/tcp

CMD ["/app/start.sh"]