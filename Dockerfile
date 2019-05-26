FROM python
RUN apt-get update && apt-get install -y sqlite3 libsqlite3-dev
RUN groupadd -g 1000 user
RUN useradd -d /home/user -m -u 1000 -g 1000 -p WY4VEcficQT6M user
CMD ["/myapp/run.sh"]
