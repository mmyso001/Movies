<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
      <html>
      <body>
        <table border='1' cellpadding='6' style='font-family: sans-serif;'>
          <tr>
            <th style='background: #000000; color:#FFA500;'>MovieID</th>
            <th style='background: #000000; color:#FFA500;'>Title</th>
            <th style='background: #000000; color:#FFA500;'>Director</th>
            <th style='background: #000000; color:#FFA500;'>Year</th>
            <th style='background: #000000; color:#FFA500;'>Genre</th>
            <th style='background: #000000; color:#FFA500;'>URL</th>
          </tr>
          <xsl:apply-templates select="movies/movie[year>=2005]">
            <xsl:sort select="title"/>
          </xsl:apply-templates>
          <tr>
            <td>Number of Movies:</td>
            <td>
              <xsl:value-of select="count(movies/movie[year>=2005])"/>
            </td>
          </tr>
        </table>
        <ul>
          <xsl:for-each select="movies/movie[year>=2005]">
            <li>
              <xsl:value-of select="director"/>
            </li>
          </xsl:for-each>
        </ul>
        <table border='1' cellpadding='6' style='font-family: sans-serif;'>
          <tr>
            <th style='background: #000000; color:#FFA500;'>MovieID</th>
            <th style='background: #000000; color:#FFA500;'>Title</th>
            <th style='background: #000000; color:#FFA500;'>Director</th>
            <th style='background: #000000; color:#FFA500;'>Year</th>
            <th style='background: #000000; color:#FFA500;'>Genre</th>
            <th style='background: #000000; color:#FFA500;'>URL</th>
          </tr>
          
          <xsl:apply-templates select="movies/movie[year&lt;2005]">
            <xsl:sort select="title"/>
          </xsl:apply-templates>
          <tr>
            <td>Number of Movies:</td>
            <td>
              <xsl:value-of select="count(movies/movie[year&lt;2005])"/>
            </td>
          </tr>
        </table>
        <ul>
          <xsl:for-each select="movies/movie[year&lt;2005]">
            <li>
              <xsl:value-of select="director"/>
            </li>
          </xsl:for-each>
        </ul>
      </body>
      </html>
    </xsl:template>

    <xsl:template match="movies/movie">
      <tr>
        <td>
          <xsl:apply-templates select="movieID" />
        </td>
        <td>
          <xsl:apply-templates select="title" />
        </td>
        <td>
          <xsl:apply-templates select="director" />
        </td>
        <td>
          <xsl:apply-templates select="year" />
        </td>
        <td>
          <xsl:apply-templates select="genre" />
        </td>
          <td>
            <a href="{link}">IMDb</a>
          </td>
      </tr>
    </xsl:template>

    <xsl:template match="movieID">
      <xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="title">
      <xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="director">
      <xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="year">
      <xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="url">
      <xsl:value-of select="."/>
    </xsl:template>
    <xsl:template match="genre">
      <xsl:for-each select=".">
        <xsl:value-of select="text()"/>,
      </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
