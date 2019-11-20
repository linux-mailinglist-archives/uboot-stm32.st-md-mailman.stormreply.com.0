Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B220C103733
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Nov 2019 11:04:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CAFFC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Nov 2019 10:04:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5629AC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2019 10:04:41 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAK9wTPq002538; Wed, 20 Nov 2019 11:04:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=STMicroelectronics;
 bh=AjkMaWDXFnMqi2V+oxwqhMLVEVrJ1hdgB7b8G8gVRoQ=;
 b=CrQFVDkOMOQNRxaOXjT7GizyRrFxkNTvxarWdBWvnxHe/Nj1lBmDACJJ3vxvPh6UDO+l
 Hcqruldza20tneKwSPOmDbDgYFXIvwfyLgRPpzsQKvK/Sq1J2xEgX7j1rp7v4BLT2HVT
 Hek+bGEfv0dY/B1ELkg1rNd1zrb43SNWXZiGXqwNVg/X0ygj2+IM6v+b6SbUaX1aIRsy
 Iictj1BrkLNPXUfiG01rSMzNLfto7U7yeyDNlEVzN8a1n3qPNoD8F9TAeS8Dju3wEkUL
 vTb1srwBC0KZe1Oq45XrnYZm9mp4Nu1hQ/FNLNpiZZ4uG7rQvzdj2Vl3cQKEtCukxde0 xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wa9up5axx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Nov 2019 11:04:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D3208100034;
 Wed, 20 Nov 2019 11:04:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A6D7E2BC0FF;
 Wed, 20 Nov 2019 11:04:27 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 20 Nov
 2019 11:04:27 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 20 Nov 2019 11:04:27 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
Thread-Topic: [PATCH v3 1/5] dm: clk: add stub for clk_disable_bulk when
 CONFIG_CLK is desactivated
Thread-Index: AQHVmT14rnLTQ8q+B0mTNWKgT9V1FqeHSAkAgABnYi0=
Date: Wed, 20 Nov 2019 10:04:27 +0000
Message-ID: <94c7cac6ac444640a09b091589fdd900@SFHDAG6NODE3.st.com>
References: <20191112094214.12686-1-patrick.delaunay@st.com>
 <20191112094214.12686-2-patrick.delaunay@st.com>,
 <CAAh8qsyBv4i+mbMMNe5c3Nu-wjY=+EhO6xQ5Ukpcr3rziNUuWQ@mail.gmail.com>
In-Reply-To: <CAAh8qsyBv4i+mbMMNe5c3Nu-wjY=+EhO6xQ5Ukpcr3rziNUuWQ@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-20_02:2019-11-15,2019-11-20 signatures=0
Cc: Peng Fan <peng.fan@nxp.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 Simon Glass <sjg@chromium.org>, Sekhar Nori <nsekhar@ti.com>,
 Lukasz Majewski <lukma@denx.de>, Ley Foon Tan <ley.foon.tan@intel.com>,
 "b.galvani@gmail.com" <b.galvani@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Jagan
 Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [Uboot-stm32] [PATCH v3 1/5] dm: clk: add stub for
 clk_disable_bulk when CONFIG_CLK is desactivated
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0400082723178795523=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============0400082723178795523==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_94c7cac6ac444640a09b091589fdd900SFHDAG6NODE3stcom_"

--_000_94c7cac6ac444640a09b091589fdd900SFHDAG6NODE3stcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Simon

>De : Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
>Envoy=E9 : mardi 12 novembre 2019 11:40
>
>
>Patrick Delaunay <patrick.delaunay@st.com> schrieb am Di., 12. Nov. 2019, =
10:42:
>Add stub for clk_disable_bulk() when CONFIG_CLK is desactivated.
>
>That avoid compilation issue (undefined reference to
>`clk_disable_bulk') for code:
>
>clk_disable_bulk(&priv->clks);
>clk_release_bulk(&priv->clks);
>
>Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>---
>
>Changes in v3:
>- Add stub for clk_disable_bulk
>
>Changes in v2: None
>
> include/clk.h | 4 ++++
> 1 file changed, 4 insertions(+)
>
>diff --git a/include/clk.h b/include/clk.h
>index a5ee53d94a..6f0b0fe4bc 100644
>--- a/include/clk.h
>+++ b/include/clk.h
>@@ -379,7 +379,11 @@ int clk_disable(struct clk *clk);
>  *             by clk_get_bulk().
>  * @return zero on success, or -ve error code.
>  */
>+ #if CONFIG_IS_ENABLED(CLK)
> int clk_disable_bulk(struct clk_bulk *bulk);
>+#else
>+inline int clk_disable_bulk(struct clk_bulk *bulk) { return 0; }
>+#endif
>
>Doing this inline at this place seems quite different than what is done fo=
r the other functions?

which functions ?

I see:

static inline int clk_get_by_index(struct udevice *dev, int index,
   struct clk *clk)
{
return -ENOSYS;
}

static inline int clk_set_defaults(struct udevice *dev)
{
return 0;
}

But I agree, that it is a simplified stub....

Disable clk bulk if OK only if bulk.count =3D=3D0 but if should be always
the case if CONFIG_CLK is disabled (as clk_get_bulk return -ENOSYS).

A more complete (better ?) stub is :

inline int clk_disable_bulk(struct clk_bulk *bulk) {
if (bulk && bulk->count =3D=3D 0) return 0;
else return -ENOSYS;
}

I think about a other solution:

inline int clk_disable_bulk(struct clk_bulk *bulk) {
return -ENOSYS;
}

But that cause issue if the return value is tested by caller.

ret =3D clk_disable_bulk(bulk)
if (ret)
            return ret;

>Regards,
>Simon

Regards
Patrick

>
> /**
>  * clk_is_match - check if two clk's point to the same hardware clock
>--
>2.17.1
>



--_000_94c7cac6ac444640a09b091589fdd900SFHDAG6NODE3stcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" xmlns:m=3D"http://sc=
hemas.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-=
html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-compose;
	font-family:"Times New Roman",serif;
	color:black;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body bgcolor=3D"white" lang=3D"FR" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Hi Simo=
n<o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&gt;De =
: Simon Goldschmidt &lt;simon.k.r.goldschmidt@gmail.com&gt;<o:p></o:p></spa=
n></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;Envoy=E9 : mardi 12 novembre 2019 11:40<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;<o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;<o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;Patrick Delaunay &lt;patrick.delaunay@st.com&gt; schrieb am Di.=
, 12. Nov. 2019, 10:42:<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;Add stub for clk_disable_bulk() when CONFIG_CLK is desactivated=
.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;<o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;That avoid compilation issue (undefined reference to<o:p></o:p>=
</span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;`clk_disable_bulk') for code:<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;<o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;clk_disable_bulk(&amp;priv-&gt;clks);<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;clk_release_bulk(&amp;priv-&gt;clks);<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;<o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;Signed-off-by: Patrick Delaunay &lt;patrick.delaunay@st.com&gt;=
<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;---<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;<o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;Changes in v3:<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;- Add stub for clk_disable_bulk<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;<o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;Changes in v2: None<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;<o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt; include/clk.h | 4 &#43;&#43;&#43;&#43;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt; 1 file changed, 4 insertions(&#43;)<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;<o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;diff --git a/include/clk.h b/include/clk.h<o:p></o:p></span></p=
>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;index a5ee53d94a..6f0b0fe4bc 100644<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;--- a/include/clk.h<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;&#43;&#43;&#43; b/include/clk.h<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;@@ -379,7 &#43;379,11 @@ int clk_disable(struct clk *clk);<o:p>=
</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;&nbsp; *&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;by clk_=
get_bulk().<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;&nbsp; * @return zero on success, or -ve error code.<o:p></o:p>=
</span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;&nbsp; */<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;&#43; #if CONFIG_IS_ENABLED(CLK)<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt; int clk_disable_bulk(struct clk_bulk *bulk);<o:p></o:p></span>=
</p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;&#43;#else<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;&#43;inline int clk_disable_bulk(struct clk_bulk *bulk) { retur=
n 0; }<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;&#43;#endif<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;<o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;Doing this inline at this place seems quite different than what=
 is done for the other functions?<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">which functions ?<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">I see:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">static inline int clk_get_by_index(struct udevice *dev, int index,<=
o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&nbsp; &nbsp;struct clk *clk)<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">{<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">return -ENOSYS;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">}<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">static inline int clk_set_defaults(struct udevice *dev)<o:p></o:p><=
/span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">{<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">return 0;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">}<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">But&nbsp;I agree, that&nbsp;it is a simplified stub....<o:p></o:p><=
/span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">Disable clk bulk if OK only if bulk.count =3D=3D0 but if should be =
always
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">the case if&nbsp;CONFIG_CLK is disabled (as clk_get_bulk return -EN=
OSYS).<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">A more complete (better ?) stub is :<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">inline int clk_disable_bulk(struct clk_bulk *bulk) {&nbsp;<o:p></o:=
p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">if (bulk &amp;&amp; bulk-&gt;count =3D=3D 0) return 0;&nbsp;<o:p></=
o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">else return -ENOSYS;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">}<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">I think about a other solution:&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">inline int clk_disable_bulk(struct clk_bulk *bulk) {&nbsp;<o:p></o:=
p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">return -ENOSYS;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">}<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">But that cause issue if the return value is tested by caller.<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:35.4pt"><span lang=3D"EN-US" st=
yle=3D"font-size:12.0pt;color:black">ret =3D clk_disable_bulk(bulk)<o:p></o=
:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:35.4pt"><span lang=3D"EN-US" st=
yle=3D"font-size:12.0pt;color:black">if (ret)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:35.4pt"><span lang=3D"EN-US" st=
yle=3D"font-size:12.0pt;color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;Regards,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;Simon<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">Regards&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">Patrick<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;<o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt; /**<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:black">&gt;&nbsp; * clk_is_match - check if two clk's point to the same ha=
rdware clock<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&gt;--&=
nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&gt;2.1=
7.1<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&gt;<o:=
p>&nbsp;</o:p></span></p>
</div>
<p><span style=3D"font-size:12.0pt;color:black"><o:p>&nbsp;</o:p></span></p=
>
</div>
</body>
</html>

--_000_94c7cac6ac444640a09b091589fdd900SFHDAG6NODE3stcom_--

--===============0400082723178795523==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0400082723178795523==--
