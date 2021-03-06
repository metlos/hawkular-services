<?xml version="1.0" encoding="UTF-8"?>
<!--

    Copyright 2016 Red Hat, Inc. and/or its affiliates
    and other contributors as indicated by the @author tags.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xalan="http://xml.apache.org/xalan" version="2.0" exclude-result-prefixes="xalan">

  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" xalan:indent-amount="4" standalone="no" />

  <xsl:template match="//*[local-name()='config']/*[local-name()='supplement' and @name='default']/*[local-name()='replacement' and @placeholder='CACHE-CONTAINERS']">
    <xsl:copy>
      <xsl:apply-templates select="node()|comment()|@*" />
      <cache-container name="hawkular-alerts" default-cache="triggers" statistics-enabled="true">
        <local-cache name="partition"/>
        <local-cache name="triggers"/>
        <local-cache name="data"/>
      </cache-container>
      <cache-container name="hawkular-services" default-cache="backfill" statistics-enabled="true">
        <local-cache name="backfill"/>
      </cache-container>
      <cache-container name="hawkular-metrics" default-cache="publish" statistics-enabled="true">
        <local-cache name="publish"/>
      </cache-container>
    </xsl:copy>
  </xsl:template>

  <!-- copy everything else as-is -->
  <xsl:template match="node()|comment()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|comment()|@*" />
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
