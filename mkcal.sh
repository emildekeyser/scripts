#!/usr/bin/env sh
curl -u radicale:radicale -X MKCOL 'http://localhost:5232/radicale/'$1 --data \
'<?xml version="1.0" encoding="UTF-8" ?>
<create xmlns="DAV:" xmlns:C="urn:ietf:params:xml:ns:caldav" xmlns:I="http://apple.com/ns/ical/">
  <set>
    <prop>
      <resourcetype>
        <collection />
        <C:calendar />
      </resourcetype>
      <C:supported-calendar-component-set>
        <C:comp name="VEVENT" />
      </C:supported-calendar-component-set>
      <displayname>'$1'</displayname>
      <I:calendar-color>'$2'</I:calendar-color>
      <C:calendar-description>'$3'</C:calendar-description>
    </prop>
  </set>
</create>'
