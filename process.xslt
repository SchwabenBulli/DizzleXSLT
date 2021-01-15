<xsl:stylesheet version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:svg="http://www.w3.org/2000/svg"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:fn_wb="http://multimedia.informatik.htw-aalen.de/xslt">
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

<xsl:template match="/DizzleSheet">

    <xsl:variable name="FieldSize">60</xsl:variable>
    <xsl:variable name="OffsetTop">100</xsl:variable>
    <xsl:variable name="OffsetLeft">50</xsl:variable>
    <xsl:variable name="OffsetBottom">50</xsl:variable>
    <xsl:variable name="OffsetRight">60</xsl:variable>
    <xsl:variable name="GameFieldWidth"><xsl:value-of select="count(./GameField/GameColumn) * $FieldSize"/></xsl:variable>
    <xsl:variable name="GameFieldHeight"><xsl:value-of select="count(./GameField/GameColumn[1]/Field) * $FieldSize"/></xsl:variable>
    <xsl:variable name="CategoryWidth">200</xsl:variable>
    <xsl:variable name="CategoryHeight">50</xsl:variable>

    <svg xmlns="http://www.w3.org/2000/svg" width="{$OffsetLeft + $GameFieldWidth + $CategoryWidth + $OffsetRight}" height="{$OffsetTop + $GameFieldHeight + $OffsetBottom}">
        <title>Dizzle Blatt Level <xsl:value-of select="./Property/Level/text()"/></title>
        <desc>Version <xsl:value-of select="./Property/Version/text()"/>. DizzleSheet created by <xsl:value-of select="./Property/CreatorName/text()"/> at <xsl:value-of select="./Property/CreationDate/text()"/></desc>

        <defs>
            <!-- circles as eyes of a dice and rect as field-->
            <circle id="DiceEye" cx="0" cy="0" r="6" stroke="grey" stroke-width="1" fill="white" fill-opacity="70%"/>
            <rect id="Field" width="60" height="60" fill="white" stroke="black" stroke-width="1px"/>

            <g id="Start">
                <image href="src/Start.png" x="3" y="3" width="55" height="55" />
            </g>
            <g id="Dice1">
                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#DiceEye" x="30" y="30"/>
            </g>
            <g id="Dice2">
                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#DiceEye" x="15" y="15"/>
                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#DiceEye" x="45" y="45"/>
            </g>
            <g id="Dice3">
                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#DiceEye" x="45" y="15"/>
                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#DiceEye" x="30" y="30"/>
                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#DiceEye" x="15" y="45"/>
            </g>
            <g id="Dice4">
                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#DiceEye" x="45" y="15"/>
                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#DiceEye" x="45" y="45"/>
                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#DiceEye" x="15" y="45"/>
                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#DiceEye" x="15" y="15"/>
            </g>
            <g id="Dice5">
                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#DiceEye" x="45" y="15"/>
                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#DiceEye" x="45" y="45"/>
                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#DiceEye" x="15" y="45"/>
                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#DiceEye" x="15" y="15"/>
                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#DiceEye" x="30" y="30"/>
            </g>
            <g id="Dice6">
                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#DiceEye" x="45" y="15"/>
                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#DiceEye" x="45" y="45"/>
                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#DiceEye" x="15" y="45"/>
                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#DiceEye" x="15" y="15"/>
                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#DiceEye" x="15" y="30"/>
                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#DiceEye" x="45" y="30"/>
            </g>

            <line id="CategoryLine" x1="90" x2="190" y1="45" y2="45" stroke="black" stroke-width="2px" stroke-dasharray="17 3"/>
            <line id="TotalLine" x1="70" x2="190" y1="45" y2="45" stroke="black" stroke-width="2px" stroke-dasharray="17 3"/>

            <rect id="PlayerCount" x="0" y="0" width="24" height="24" fill="white" stroke="black"/>
			<image id="Player" href="src/User.png" width="15" height="15" />
			 <g id="Player1">
                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#Player" x="0" y="0"/>
            </g>
            <g id="Player2">
                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#Player" x="0" y="0"/>
                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#Player" x="7" y="2"/>
            </g>
            <g id="Player3">
                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#Player" x="0" y="0"/>
                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#Player" x="7" y="2"/>
                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#Player" x="14" y="0"/>
            </g>
            <g id="Player4">
                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#Player" x="0" y="0"/>
                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#Player" x="7" y="2"/>
                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#Player" x="14" y="0"/>
                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#Player" x="21" y="2"/>
            </g>

            <path id="ArrowToRotate" d="M 10 10 l 20 0 l 0 -10 l 20 15 l -20 15 l 0 -10 l -20 0 z" fill="black" stroke="white" stroke-width="2px" transform="scale(0.5,0.5)"/>
            <use id="Arrow_r" xmlns="http://www.w3.org/2000/svg" xlink:href="#ArrowToRotate" x="32" y="22" transform="rotate(0,12.5,7.5)"/>
            <use id="Arrow_d" xmlns="http://www.w3.org/2000/svg" xlink:href="#ArrowToRotate" x="38" y="-17" transform="rotate(90,12.5,7.5)"/>
            <use id="Arrow_l" xmlns="http://www.w3.org/2000/svg" xlink:href="#ArrowToRotate" x="-3" y="-22" transform="rotate(180,12.5,7.5)"/>
            <use id="Arrow_u" xmlns="http://www.w3.org/2000/svg" xlink:href="#ArrowToRotate" x="-7" y="17" transform="rotate(270,12.5,7.5)"/>
        </defs>

        <style type="text/css">
        	<![CDATA[
				text {
					font-family: Arial, sans-serif;
					font-weight: bold;
				}

				#TextArrowPoints {
					font-size: 0.9em;
					letter-spacing: -.1rem;
				}

				#TextCategory {
					text-anchor: end;
				}
				
				#TextTitle {
					font-size: 1.5em;
				}

				#TextPlayerCount {
					text-anchor: middle;
					letter-spacing: -.1rem;
				}
		    ]]>
        </style>

		<!-- Main / Header -->
		<rect width="100%" height="100%" stroke="none">
			<xsl:attribute name="fill">#<xsl:value-of select="./Property/BGColor/text()"/></xsl:attribute>
		</rect>
		<image href="src/Logo.png" x="20" y="0" width="150" height="65"/>
		<text id="TextTitle" x="170" y="50" fill="white">LEVEL <xsl:value-of select="./Property/Level/text()"/></text>

		<!-- PlayerCount Rounds -->
		<g transform="translate(420 10)">
			<rect x="0" y="0" width="410" height="50" fill="white" fill-opacity="25%" rx="4" ry="4"/>
			<line x1="10" x2="382" y1="32" y2="32" stroke="black" stroke-width="1px" stroke-dasharray="24 4 8 4"/>

			<use xmlns="http://www.w3.org/2000/svg" xlink:href="#PlayerCount" x="10" y="20"/>
			<text id="TextPlayerCount" x="21" y="38">1</text>
			<use xmlns="http://www.w3.org/2000/svg" xlink:href="#PlayerCount" x="50" y="20"/>
			<text id="TextPlayerCount" x="61" y="38">2</text>
			<use xmlns="http://www.w3.org/2000/svg" xlink:href="#PlayerCount" x="90" y="20"/>
			<text id="TextPlayerCount" x="101" y="38">3</text>
			<use xmlns="http://www.w3.org/2000/svg" xlink:href="#Player4" x="84" y="1"/>
			<use xmlns="http://www.w3.org/2000/svg" xlink:href="#PlayerCount" x="130" y="20"/>
			<text id="TextPlayerCount" x="141" y="38">4</text>
			<use xmlns="http://www.w3.org/2000/svg" xlink:href="#Player3" x="128" y="1"/>
			<use xmlns="http://www.w3.org/2000/svg" xlink:href="#PlayerCount" x="170" y="20"/>
			<text id="TextPlayerCount" x="181" y="38">5</text>
			<use xmlns="http://www.w3.org/2000/svg" xlink:href="#PlayerCount" x="210" y="20"/>
			<text id="TextPlayerCount" x="221" y="38">6</text>
			<use xmlns="http://www.w3.org/2000/svg" xlink:href="#Player2" x="212" y="1"/>
			<use xmlns="http://www.w3.org/2000/svg" xlink:href="#PlayerCount" x="250" y="20"/>
			<text id="TextPlayerCount" x="261" y="38">7</text>
			<use xmlns="http://www.w3.org/2000/svg" xlink:href="#PlayerCount" x="290" y="20"/>
			<text id="TextPlayerCount" x="301" y="38">8</text>
			<use xmlns="http://www.w3.org/2000/svg" xlink:href="#PlayerCount" x="330" y="20"/>
			<text id="TextPlayerCount" x="341" y="38">9</text>
			<use xmlns="http://www.w3.org/2000/svg" xlink:href="#PlayerCount" x="370" y="20"/>
			<text id="TextPlayerCount" x="381" y="38">10</text>
			<use xmlns="http://www.w3.org/2000/svg" xlink:href="#Player1" x="375" y="3"/>
		</g>

		<!-- Background -->
		<rect x="20" y="{$OffsetTop - 30}" fill="white" fill-opacity="25%" stroke="white" stroke-width="1px" rx="5" ry="5">
			<xsl:attribute name="width"><xsl:value-of select="$GameFieldWidth + 60"/></xsl:attribute>
			<xsl:attribute name="height"><xsl:value-of select="$GameFieldHeight + 60"/></xsl:attribute>
		</rect>

		<!-- GameField -->
		<xsl:for-each select="./GameField/GameColumn">
		    <xsl:variable name="ColNo"><xsl:number/></xsl:variable>
		    <xsl:for-each select="./Field">
		        <xsl:variable name="RowNo"><xsl:number/></xsl:variable>
		        <xsl:element name="g">
		            <xsl:attribute name="id">FieldCol<xsl:value-of select="$ColNo"/>Row<xsl:value-of select="$RowNo"/></xsl:attribute>
		            <xsl:attribute name="transform">translate(<xsl:value-of select="($ColNo - 1) * $FieldSize + $OffsetLeft"/><xsl:value-of select="' '"/><xsl:value-of select="($RowNo - 1) * $FieldSize + $OffsetTop"/>)</xsl:attribute>

		            <xsl:choose>
		                <xsl:when test="number(.) = .">
		                	<!-- White field -->
		           			<use xmlns="http://www.w3.org/2000/svg" xlink:href="#Field" x="0" y="0"/>
		                	<!-- field category -->
		                	<xsl:if test="./@category">
			                    <image x="2.5" y="2.5" width="54" height="54" opacity="0.9">
			                		<xsl:attribute name="href">src/<xsl:value-of select="fn_wb:CategoryFieldIconGet(./@category)"/></xsl:attribute>
			                	</image>
		                	</xsl:if>
		                	<!-- field dice -->
		                    <xsl:variable name="DiceNumber" select="number(.)" as="xs:double"/>
		                    <use xmlns="http://www.w3.org/2000/svg" xlink:href="{concat('#Dice',$DiceNumber)}"/>
		                </xsl:when>
		                <xsl:when test=". = 'S'">
		                	<!-- White field -->
		           			<use xmlns="http://www.w3.org/2000/svg" xlink:href="#Field" x="0" y="0"/>
		                	<!-- start field -->
		                    <use xmlns="http://www.w3.org/2000/svg" xlink:href="#Start"/>
		                </xsl:when>
		                <xsl:otherwise>
		                </xsl:otherwise>
		            </xsl:choose>

		        </xsl:element>
		    </xsl:for-each>
		</xsl:for-each>

		<!-- Arrows Rows -->
		<xsl:for-each select="./Category/FieldCategory[@Name='RowCompleted']/Range">
		    <xsl:variable name="RowNo"><xsl:value-of select="./@RowStart"/></xsl:variable>
			<xsl:choose>
				<xsl:when test="./@arrow = 'left'">
					<xsl:variable name="ColNo"><xsl:value-of select="./@ColStart - 1"/></xsl:variable>
					<g>
						<xsl:attribute name="id">ArrowCol<xsl:value-of select="$ColNo"/>Row<xsl:value-of select="$RowNo"/></xsl:attribute>
						<xsl:attribute name="transform">translate(<xsl:value-of select="($ColNo - 1) * $FieldSize + $OffsetLeft"/>,<xsl:value-of select="($RowNo - 1) * $FieldSize + $OffsetTop"/>)</xsl:attribute>
						<use xmlns="http://www.w3.org/2000/svg" xlink:href="#Arrow_r"/>
						<text id="TextArrowPoints" text-anchor="start" x="38" y="50"><xsl:value-of select="./@Points"/></text>
					</g>
				</xsl:when>
				<xsl:when test="./@arrow = 'right'">
					<xsl:variable name="ColNo"><xsl:value-of select="./@ColEnd + 1"/></xsl:variable>
					<g>
						<xsl:attribute name="id">ArrowCol<xsl:value-of select="$ColNo"/>Row<xsl:value-of select="$RowNo"/></xsl:attribute>
						<xsl:attribute name="transform">translate(<xsl:value-of select="($ColNo - 1) * $FieldSize + $OffsetLeft"/>,<xsl:value-of select="($RowNo - 1) * $FieldSize + $OffsetTop"/>)</xsl:attribute>
						<use xmlns="http://www.w3.org/2000/svg" xlink:href="#Arrow_l"/>
						<text id="TextArrowPoints" text-anchor="end" x="23" y="50"><xsl:value-of select="./@Points"/></text>
					</g>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>

		<!-- Arrows Cols -->
		<xsl:for-each select="./Category/FieldCategory[@Name='ColCompleted']/Range">
		    <xsl:variable name="ColNo"><xsl:value-of select="./@ColStart"/></xsl:variable>
			<xsl:choose>
				<xsl:when test="./@arrow = 'top'">
					<xsl:variable name="RowNo"><xsl:value-of select="./@RowStart - 1"/></xsl:variable>
					<g>
						<xsl:attribute name="id">ArrowCol<xsl:value-of select="$ColNo"/>Row<xsl:value-of select="$RowNo"/></xsl:attribute>
						<xsl:attribute name="transform">translate(<xsl:value-of select="($ColNo - 1) * $FieldSize + $OffsetLeft"/>,<xsl:value-of select="($RowNo - 1) * $FieldSize + $OffsetTop"/>)</xsl:attribute>
						<use xmlns="http://www.w3.org/2000/svg" xlink:href="#Arrow_d"/>
						<text id="TextArrowPoints" text-anchor="start" x="38" y="49"><xsl:value-of select="./@Points"/></text>						
					</g>
				</xsl:when>
				<xsl:when test="./@arrow = 'bottom'">
					<xsl:variable name="RowNo"><xsl:value-of select="./@RowEnd + 1"/></xsl:variable>
					<g>
						<xsl:attribute name="id">ArrowCol<xsl:value-of select="$ColNo"/>Row<xsl:value-of select="$RowNo"/></xsl:attribute>
						<xsl:attribute name="transform">translate(<xsl:value-of select="($ColNo - 1) * $FieldSize + $OffsetLeft"/>,<xsl:value-of select="($RowNo - 1) * $FieldSize + $OffsetTop"/>)</xsl:attribute>
						<use xmlns="http://www.w3.org/2000/svg" xlink:href="#Arrow_u"/>
						<text id="TextArrowPoints" text-anchor="start" x="38" y="22"><xsl:value-of select="./@Points"/></text>	
					</g>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>

		<!-- FieldCategories -->
		<g transform="translate({$OffsetLeft + $GameFieldWidth + 40} {$OffsetTop - 30})">
			<rect width="{$CategoryWidth}" height="{$GameFieldHeight + 60}" fill="white" stroke="black" stroke-opacity="50%" stroke-width="1px" rx="5" ry="5"/>
			<xsl:for-each select="./Category/FieldCategory">
			    <xsl:variable name="CategoryNo"><xsl:number/></xsl:variable>
			    <g>
			        <xsl:attribute name="transform">translate(0 <xsl:value-of select="($CategoryNo - 1) * $CategoryHeight"/>)</xsl:attribute>

			        <!-- Category Icon -->
			        <image href="src/Logo.png" x="20" y="30" transform="scale(0.55)" height="65">
			        	<xsl:attribute name="href">src/<xsl:value-of select="fn_wb:CategoryListIconGet(./@Name)"/></xsl:attribute>
			        </image>

			        <!-- Category Text -->
			        <xsl:choose>
			            <xsl:when test="number(./@Points) &gt; 0">
			                <text id="TextCategory" x="88" y="40">(+<xsl:value-of select="./@Points"/>)</text>
			                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#CategoryLine"/>
			            </xsl:when>
			            <xsl:when test="number(./@Points) &lt; 0">
			                <text id="TextCategory" x="88" y="40">(<xsl:value-of select="./@Points"/>)</text>
			                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#CategoryLine"/>
			            </xsl:when>
			            <xsl:when test="./@Points">
			                <text id="TextCategory" x="150" y="45"><xsl:value-of select="replace(./@Points,',',' - ')"/></text>
			            </xsl:when>
			            <xsl:otherwise>
							<text id="TextCategory" x="88" y="40">(+?)</text>
			                <use xmlns="http://www.w3.org/2000/svg" xlink:href="#CategoryLine"/>
			            </xsl:otherwise>
			        </xsl:choose>
			    </g>
			</xsl:for-each>

			<!-- Total -->
			<text x="70" y="458" font-weight="bold" font-family="Arial, sans-serif" text-anchor="end">Total:</text>
			<use y="415" xmlns="http://www.w3.org/2000/svg" xlink:href="#TotalLine"/>
		</g>
		
	</svg>	
</xsl:template>

<!-- BEGIN[FUNCTIONS] -->
<xsl:function name="fn_wb:CategoryListIconGet">
    <xsl:param name="CategoryName" as="xs:string"/>

    <xsl:choose>
		<xsl:when test="$CategoryName = 'OrangeGem'">
			<xsl:value-of select="'OrangeGem.png'"/>
		</xsl:when>
		<xsl:when test="$CategoryName = 'PurpleGem'">
			<xsl:value-of select="'PurpleGem.png'"/>
		</xsl:when>
		<xsl:when test="$CategoryName = 'YellowGem'">
			<xsl:value-of select="'YellowGem.png'"/>
		</xsl:when>
		<xsl:when test="$CategoryName = 'RowCompleted'">
			<xsl:value-of select="'Arrow_right.png'"/>
		</xsl:when>
		<xsl:when test="$CategoryName = 'ColCompleted'">
			<xsl:value-of select="'Arrow_up.png'"/>
		</xsl:when>
		<xsl:when test="$CategoryName = 'CrossedField'">
			<xsl:value-of select="'CrossedField.png'"/>
		</xsl:when>
		<xsl:when test="$CategoryName = 'BlueFlag'">
			<xsl:value-of select="'BlueFlag.png'"/>
		</xsl:when>
		<xsl:when test="$CategoryName = 'BluePuzzle'">
			<xsl:value-of select="'BluePuzzle.png'"/>
		</xsl:when>
    </xsl:choose>
</xsl:function>

<xsl:function name="fn_wb:CategoryFieldIconGet">
    <xsl:param name="CategoryName" as="xs:string"/>

    <xsl:choose>
		<xsl:when test="$CategoryName = 'OrangeGem'">
			<xsl:value-of select="'OrangeGem.png'"/>
		</xsl:when>
		<xsl:when test="$CategoryName = 'PurpleGem'">
			<xsl:value-of select="'PurpleGem.png'"/>
		</xsl:when>
		<xsl:when test="$CategoryName = 'YellowGem'">
			<xsl:value-of select="'YellowGem.png'"/>
		</xsl:when>
		<xsl:when test="$CategoryName = 'RowCompleted'">
			<xsl:value-of select="'Arrow_right.png'"/>
		</xsl:when>
		<xsl:when test="$CategoryName = 'ColCompleted'">
			<xsl:value-of select="'Arrow_up.png'"/>
		</xsl:when>
		<xsl:when test="$CategoryName = 'CrossedField_Shit'">
			<xsl:value-of select="'CrossedField_Shit.png'"/>
		</xsl:when>
		<xsl:when test="$CategoryName = 'CrossedField_Bomb'">
			<xsl:value-of select="'CrossedField_Bomb.png'"/>
		</xsl:when>
		<xsl:when test="$CategoryName = 'BlueFlag'">
			<xsl:value-of select="'BlueFlag.png'"/>
		</xsl:when>
		<xsl:when test="$CategoryName = 'RedFlag'">
			<xsl:value-of select="'RedFlag.png'"/>
		</xsl:when>
		<xsl:when test="$CategoryName = 'BluePuzzle'">
			<xsl:value-of select="'BluePuzzle_single.png'"/>
		</xsl:when>
		<xsl:when test="$CategoryName = 'GoldenLock_Key'">
			<xsl:value-of select="'GoldenLock_Key.png'"/>
		</xsl:when>
		<xsl:when test="$CategoryName = 'GoldenLock_Lock'">
			<xsl:value-of select="'GoldenLock_Lock.png'"/>
		</xsl:when>
		<xsl:when test="$CategoryName = 'Travel_Rocket'">
			<xsl:value-of select="'Travel_Rocket.png'"/>
		</xsl:when>
		<xsl:when test="$CategoryName = 'Travel_Planet'">
			<xsl:value-of select="'Travel_Planet.png'"/>
		</xsl:when>
    </xsl:choose>
</xsl:function>
<!-- END[FUNCTIONS] -->

</xsl:stylesheet>