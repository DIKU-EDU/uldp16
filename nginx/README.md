# Nginx Configurations

We had 2 separate droplets on Digital Ocean. One for gathering a web server log
and host course material, and one for students to login and work on.

For the web server log, we used the following log format:

~~~
log_format csv '$remote_addr"$time_iso8601"$request"$http_user_agent';
~~~

The use of the unconventional `"` separator is intentional, as it cannot be
generated as part of either of the columns involved.
