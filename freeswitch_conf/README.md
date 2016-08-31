# Default configuration for freeswitch

This includes directory includes the default configuration that ships
with freeswitch. Three files have been changed to make it compatible
with plivo. I believe these files still require some extra configuration.:

- autoload_configs/conference.conf.xml
- dialplan/default.xml
- dialplan/public.xml

Also the following file was added to permit outbound dialing to
cyberfonica as a carrier.

- sip_profiles/external/cyberfonica.xml

This will also have to be adjusted.


Idealy, files not used would later be removed.
