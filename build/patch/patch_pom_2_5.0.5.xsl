<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!--Identity template,
   provides default behavior that copies all content into the output -->
   <xsl:template match="@*|node()">
       <xsl:copy>
           <xsl:apply-templates select="@*|node()"/>
       </xsl:copy>
   </xsl:template>
    <xsl:template match="//repositories/text()"/>
</xsl:stylesheet>