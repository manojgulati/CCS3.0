<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="7.3.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="6" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="Amphenol-coax-connector">
<packages>
<package name="31-5329">
<description>&lt;b&gt;BNC CONNECTOR&lt;/b&gt;&lt;p&gt;
M/A COM&lt;p&gt;
www.macom.com&lt;p&gt;
distributor Farnell 149-452</description>
<wire x1="-1.5" y1="0.5" x2="1.5" y2="0.5" width="0.3048" layer="21" curve="-143.130102"/>
<wire x1="-1.5" y1="-0.5" x2="1.5" y2="-0.5" width="0.3048" layer="21" curve="143.130102"/>
<wire x1="-7.512" y1="1.016" x2="-8.636" y2="1.016" width="0.254" layer="21"/>
<wire x1="-8.636" y1="1.016" x2="-8.636" y2="-1.016" width="0.254" layer="21"/>
<wire x1="-8.636" y1="-1.016" x2="-7.512" y2="-1.016" width="0.254" layer="21"/>
<wire x1="7.512" y1="-1.016" x2="8.636" y2="-1.016" width="0.254" layer="21"/>
<wire x1="8.636" y1="-1.016" x2="8.636" y2="1.016" width="0.254" layer="21"/>
<wire x1="8.636" y1="1.016" x2="7.512" y2="1.016" width="0.254" layer="21"/>
<wire x1="-4.1" y1="2.1" x2="-2.1" y2="4.1" width="0.254" layer="51" curve="-35.757393"/>
<wire x1="-4.1" y1="-2.1" x2="-4.1" y2="2.1" width="0.254" layer="21" curve="-54.242607"/>
<wire x1="-4.1" y1="-2.1" x2="-2.1" y2="-4.1" width="0.254" layer="51" curve="35.757393"/>
<wire x1="-2.1" y1="-4.1" x2="2.1" y2="-4.1" width="0.254" layer="21" curve="54.242607"/>
<wire x1="2.1" y1="-4.1" x2="4.1" y2="-2.1" width="0.254" layer="51" curve="35.757393"/>
<wire x1="4.1" y1="2.1" x2="4.1" y2="-2.1" width="0.254" layer="21" curve="-54.242607"/>
<wire x1="2.1" y1="4.1" x2="4.1" y2="2.1" width="0.254" layer="51" curve="-35.757393"/>
<wire x1="-2.1" y1="4.1" x2="2.1" y2="4.1" width="0.254" layer="21" curve="-54.242607"/>
<pad name="1" x="0" y="0" drill="1.4"/>
<pad name="2" x="3.81" y="3.81" drill="2.6"/>
<pad name="3" x="-3.81" y="3.81" drill="2.6"/>
<pad name="4" x="-3.81" y="-3.81" drill="2.6"/>
<pad name="5" x="3.81" y="-3.81" drill="2.6"/>
<text x="4.445" y="6.985" size="1.27" layer="25">&gt;NAME</text>
<text x="5.715" y="-6.35" size="1.27" layer="27">&gt;VALUE</text>
<circle x="0" y="0" radius="5.5" width="0.127" layer="21"/>
<circle x="0" y="0" radius="7.5" width="0.127" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="BU-BNC">
<wire x1="-2.54" y1="2.54" x2="-2.54" y2="-2.54" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="0" y1="-2.54" x2="-0.762" y2="-1.778" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-0.508" y2="0" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="0.254" x2="-0.762" y2="0.254" width="0.254" layer="94"/>
<wire x1="-0.762" y1="0.254" x2="-0.508" y2="0" width="0.254" layer="94"/>
<wire x1="-0.508" y1="0" x2="-0.762" y2="-0.254" width="0.254" layer="94"/>
<wire x1="-0.762" y1="-0.254" x2="-2.54" y2="-0.254" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<text x="-2.54" y="3.302" size="1.778" layer="95">&gt;NAME</text>
<pin name="1" x="2.54" y="0" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="2" x="2.54" y="-2.54" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="31-5329-52RFX" prefix="X">
<gates>
<gate name="G$1" symbol="BU-BNC" x="0" y="0"/>
</gates>
<devices>
<device name="31-5329-52RFX" package="31-5329">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2 3 4 5"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="jumper">
<description>&lt;b&gt;Jumpers&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="JP1">
<description>&lt;b&gt;JUMPER&lt;/b&gt;</description>
<wire x1="-1.016" y1="0" x2="-1.27" y2="0.254" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="0" x2="-1.27" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="1.016" y1="0" x2="1.27" y2="0.254" width="0.1524" layer="21"/>
<wire x1="1.016" y1="0" x2="1.27" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-0.254" x2="1.27" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="1.016" y1="-2.54" x2="1.27" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="1.27" y1="2.286" x2="1.016" y2="2.54" width="0.1524" layer="21"/>
<wire x1="1.27" y1="2.286" x2="1.27" y2="0.254" width="0.1524" layer="21"/>
<wire x1="1.016" y1="2.54" x2="-1.016" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="2.286" x2="-1.016" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="2.286" x2="-1.27" y2="0.254" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-0.254" x2="-1.27" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="-2.54" x2="-1.27" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="-2.54" x2="1.016" y2="-2.54" width="0.1524" layer="21"/>
<pad name="1" x="0" y="-1.27" drill="0.9144" shape="long"/>
<pad name="2" x="0" y="1.27" drill="0.9144" shape="long"/>
<text x="-1.651" y="-2.54" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="2.921" y="-2.54" size="1.27" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<rectangle x1="-0.3048" y1="0.9652" x2="0.3048" y2="1.5748" layer="51"/>
<rectangle x1="-0.3048" y1="-1.5748" x2="0.3048" y2="-0.9652" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="JP2E">
<wire x1="0" y1="0" x2="0" y2="1.27" width="0.1524" layer="94"/>
<wire x1="0" y1="2.54" x2="0" y2="1.27" width="0.4064" layer="94"/>
<wire x1="2.54" y1="0" x2="2.54" y2="1.27" width="0.1524" layer="94"/>
<wire x1="2.54" y1="2.54" x2="2.54" y2="1.27" width="0.4064" layer="94"/>
<wire x1="-0.635" y1="0" x2="3.175" y2="0" width="0.4064" layer="94"/>
<wire x1="3.175" y1="0" x2="3.175" y2="0.635" width="0.4064" layer="94"/>
<wire x1="3.175" y1="0.635" x2="-0.635" y2="0.635" width="0.4064" layer="94"/>
<wire x1="-0.635" y1="0.635" x2="-0.635" y2="0" width="0.4064" layer="94"/>
<text x="-1.27" y="0" size="1.778" layer="95" rot="R90">&gt;NAME</text>
<text x="5.715" y="0" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="1" x="0" y="-2.54" visible="pad" length="short" direction="pas" rot="R90"/>
<pin name="2" x="2.54" y="-2.54" visible="pad" length="short" direction="pas" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="JP1E" prefix="JP" uservalue="yes">
<description>&lt;b&gt;JUMPER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="JP2E" x="2.54" y="0"/>
</gates>
<devices>
<device name="" package="JP1">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="X1" library="Amphenol-coax-connector" deviceset="31-5329-52RFX" device="31-5329-52RFX" value="COAX"/>
<part name="JP1" library="jumper" deviceset="JP1E" device=""/>
<part name="JP2" library="jumper" deviceset="JP1E" device=""/>
<part name="X2" library="Amphenol-coax-connector" deviceset="31-5329-52RFX" device="31-5329-52RFX" value="COAX"/>
<part name="JP3" library="jumper" deviceset="JP1E" device=""/>
<part name="JP4" library="jumper" deviceset="JP1E" device=""/>
<part name="X3" library="Amphenol-coax-connector" deviceset="31-5329-52RFX" device="31-5329-52RFX" value="COAX"/>
<part name="JP5" library="jumper" deviceset="JP1E" device=""/>
<part name="JP6" library="jumper" deviceset="JP1E" device=""/>
<part name="X4" library="Amphenol-coax-connector" deviceset="31-5329-52RFX" device="31-5329-52RFX" value="COAX"/>
<part name="JP7" library="jumper" deviceset="JP1E" device=""/>
<part name="JP8" library="jumper" deviceset="JP1E" device=""/>
<part name="X5" library="Amphenol-coax-connector" deviceset="31-5329-52RFX" device="31-5329-52RFX" value="COAX"/>
<part name="JP9" library="jumper" deviceset="JP1E" device=""/>
<part name="JP10" library="jumper" deviceset="JP1E" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="X1" gate="G$1" x="27.94" y="63.5"/>
<instance part="JP1" gate="A" x="30.48" y="71.12"/>
<instance part="JP2" gate="A" x="30.48" y="78.74"/>
<instance part="X2" gate="G$1" x="40.64" y="63.5"/>
<instance part="JP3" gate="A" x="43.18" y="71.12"/>
<instance part="JP4" gate="A" x="43.18" y="78.74"/>
<instance part="X3" gate="G$1" x="53.34" y="63.5"/>
<instance part="JP5" gate="A" x="55.88" y="71.12"/>
<instance part="JP6" gate="A" x="55.88" y="78.74"/>
<instance part="X4" gate="G$1" x="66.04" y="63.5"/>
<instance part="JP7" gate="A" x="68.58" y="71.12"/>
<instance part="JP8" gate="A" x="68.58" y="78.74"/>
<instance part="X5" gate="G$1" x="78.74" y="63.5"/>
<instance part="JP9" gate="A" x="81.28" y="71.12"/>
<instance part="JP10" gate="A" x="81.28" y="78.74"/>
</instances>
<busses>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<pinref part="X1" gate="G$1" pin="1"/>
<pinref part="JP1" gate="A" pin="1"/>
<wire x1="30.48" y1="63.5" x2="30.48" y2="68.58" width="0.1524" layer="91"/>
<pinref part="JP2" gate="A" pin="1"/>
<wire x1="30.48" y1="68.58" x2="30.48" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="JP2" gate="A" pin="2"/>
<pinref part="JP1" gate="A" pin="2"/>
<wire x1="33.02" y1="76.2" x2="33.02" y2="68.58" width="0.1524" layer="91"/>
<wire x1="33.02" y1="68.58" x2="33.02" y2="60.96" width="0.1524" layer="91"/>
<pinref part="X1" gate="G$1" pin="2"/>
<wire x1="33.02" y1="60.96" x2="30.48" y2="60.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="X2" gate="G$1" pin="1"/>
<pinref part="JP3" gate="A" pin="1"/>
<wire x1="43.18" y1="63.5" x2="43.18" y2="68.58" width="0.1524" layer="91"/>
<pinref part="JP4" gate="A" pin="1"/>
<wire x1="43.18" y1="68.58" x2="43.18" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="JP4" gate="A" pin="2"/>
<pinref part="JP3" gate="A" pin="2"/>
<wire x1="45.72" y1="76.2" x2="45.72" y2="68.58" width="0.1524" layer="91"/>
<wire x1="45.72" y1="68.58" x2="45.72" y2="60.96" width="0.1524" layer="91"/>
<pinref part="X2" gate="G$1" pin="2"/>
<wire x1="45.72" y1="60.96" x2="43.18" y2="60.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="1"/>
<pinref part="JP5" gate="A" pin="1"/>
<wire x1="55.88" y1="63.5" x2="55.88" y2="68.58" width="0.1524" layer="91"/>
<pinref part="JP6" gate="A" pin="1"/>
<wire x1="55.88" y1="68.58" x2="55.88" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="JP6" gate="A" pin="2"/>
<pinref part="JP5" gate="A" pin="2"/>
<wire x1="58.42" y1="76.2" x2="58.42" y2="68.58" width="0.1524" layer="91"/>
<wire x1="58.42" y1="68.58" x2="58.42" y2="60.96" width="0.1524" layer="91"/>
<pinref part="X3" gate="G$1" pin="2"/>
<wire x1="58.42" y1="60.96" x2="55.88" y2="60.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="X4" gate="G$1" pin="1"/>
<pinref part="JP7" gate="A" pin="1"/>
<wire x1="68.58" y1="63.5" x2="68.58" y2="68.58" width="0.1524" layer="91"/>
<pinref part="JP8" gate="A" pin="1"/>
<wire x1="68.58" y1="68.58" x2="68.58" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="JP8" gate="A" pin="2"/>
<pinref part="JP7" gate="A" pin="2"/>
<wire x1="71.12" y1="76.2" x2="71.12" y2="68.58" width="0.1524" layer="91"/>
<wire x1="71.12" y1="68.58" x2="71.12" y2="60.96" width="0.1524" layer="91"/>
<pinref part="X4" gate="G$1" pin="2"/>
<wire x1="71.12" y1="60.96" x2="68.58" y2="60.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="X5" gate="G$1" pin="1"/>
<pinref part="JP9" gate="A" pin="1"/>
<wire x1="81.28" y1="63.5" x2="81.28" y2="68.58" width="0.1524" layer="91"/>
<pinref part="JP10" gate="A" pin="1"/>
<wire x1="81.28" y1="68.58" x2="81.28" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="JP10" gate="A" pin="2"/>
<pinref part="JP9" gate="A" pin="2"/>
<wire x1="83.82" y1="76.2" x2="83.82" y2="68.58" width="0.1524" layer="91"/>
<wire x1="83.82" y1="68.58" x2="83.82" y2="60.96" width="0.1524" layer="91"/>
<pinref part="X5" gate="G$1" pin="2"/>
<wire x1="83.82" y1="60.96" x2="81.28" y2="60.96" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
