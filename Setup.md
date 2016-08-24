# Nginx Configurations

We had 2 separate droplets on Digital Ocean. One for gathering a web server log
and host course material, and one for students to login and work on.

For the web server log, we used the following log format:

~~~
log_format csv '$remote_addr"$time_iso8601"$request"$http_user_agent';
~~~

The use of the unconventional `"` separator is intentional, as it cannot be
generated as part of either of the columns involved.

For the work server, we have set up hosting of the `public_html` subdirectory
(if any) for every user on the system. This is useful for exercises in using
`gnuplot` to produce SVG plots. It is configured as follows:

~~~
location ~ "^/~([a-z]{3}[0-9]{3})(/.*?)?$" {
  alias /home/$1/public_html/$2;
  autoindex on;
}
~~~

# FreeBSD Configurations

For now particular reason we chose FreeBSD in 2016.

We make use of `bash` as the default login shell for all students. To use
process substitution, i.e. `<()`, in FreeBSD, it is necessary to mount
`fdescfs` under `/dev/fd`. We don't know if this has any negative effects on
the rest of the system, so use at your own risk.

~~~
$ mount -t fdescfs fdesc /dev/fd
~~~
