<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" encoding="utf-8" indent="yes" omit-xml-declaration="no"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match='repositories'>
        <xsl:copy>
            <xsl:apply-templates select="repository/id[text()='codehaus.snapshots']/.."/>
            <xsl:apply-templates select="repository/id[text()='tapestry-snapshots']/.."/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>