Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B8189C776
	for <lists+uboot-stm32@lfdr.de>; Mon,  8 Apr 2024 16:48:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02083C712BE;
	Mon,  8 Apr 2024 14:48:42 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4090C69066
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Apr 2024 07:26:53 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43874TkE013500; Mon, 8 Apr 2024 09:26:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 content-type:message-id:date:mime-version:subject:to:references
 :cc:from:in-reply-to; s=selector1; bh=tSQM/b4gLcPEsA1sLb/DatFH7z
 SjD+nv9xmsNXjabOE=; b=PCaC39HNXN/iYoMtVL9eLgpradfWkWCBveLcdUyiZI
 +WV1cNL8L/71FMBLLY7zvcnTH2g9+PCZ4DZTwFNBdrhdGJ51s+dCYn2MHemdRz59
 qLo6RImz+rvmrbp7vF16QzTrtUp3iAMY//i4pk/mvC02XWOTl11qWaD2pU8Q2lZ/
 f3jFh3JGLE7i3iZBRa/GRPmPnSFKTx4Ba+DxYWz7cZYApQbhZ/iECd/UZ/FbDkpu
 vSh9LMfIvtvqjx47vWbdJxRbsGWA/j5/NladIKm583hHv6rHOkZCclakEjaHoMN4
 4sS/Gs787mWfzD4Mqu01GGdP6TWXZobzhlm5saESZtaQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xbhbhu8hb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Apr 2024 09:26:39 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 844CD40044;
 Mon,  8 Apr 2024 09:26:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E721620CB13;
 Mon,  8 Apr 2024 09:26:10 +0200 (CEST)
Received: from [10.48.86.106] (10.48.86.106) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 8 Apr
 2024 09:26:10 +0200
Message-ID: <36109f71-081a-4dca-b852-c14ac39a318f@foss.st.com>
Date: Mon, 8 Apr 2024 09:26:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240326120745.27581-1-marex@denx.de>
 <20240326120745.27581-3-marex@denx.de>
 <DU2PR10MB7787578063068AFCDA4543388F002@DU2PR10MB7787.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <DU2PR10MB7787578063068AFCDA4543388F002@DU2PR10MB7787.EURPRD10.PROD.OUTLOOK.COM>
X-Originating-IP: [10.48.86.106]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_05,2024-04-05_02,2023-05-22_02
X-Mailman-Approved-At: Mon, 08 Apr 2024 14:48:39 +0000
Cc: u-boot@dh-electronics.com, Christophe ROULLIER <christophe.roullier@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Ramon Fried <rfried.dev@gmail.com>,
 Patrick DELAUNAY - foss <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 02/11] net: dwc_eth_qos: Rename
 eqos_stm32_config to eqos_stm32mp15_config
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
Content-Type: multipart/mixed; boundary="===============2531784778134015436=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============2531784778134015436==
Content-Type: multipart/alternative;
	boundary="------------qeWvsPFdpSoyjKpah9hBwVoZ"
Content-Language: en-US

--------------qeWvsPFdpSoyjKpah9hBwVoZ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

> -----Original Message-----
> From: Marek Vasut<marex@denx.de>
> Sent: Tuesday, March 26, 2024 1:07 PM
> To:u-boot@lists.denx.de
> Cc: Marek Vasut<marex@denx.de>; Patrice CHOTARD - foss<patrice.chotard@foss.st.com>; Christophe ROULLIER<christophe.roullier@st.com>; Joe Hershberger<joe.hershberger@ni.com>; Patrick DELAUNAY - foss<patrick.delaunay@foss.st.com>; Ramon Fried<rfried.dev@gmail.com>;u-boot@dh-electronics.com;uboot-stm32@st-md-mailman.stormreply.com
> Subject: [PATCH v2 02/11] net: dwc_eth_qos: Rename eqos_stm32_config to eqos_stm32mp15_config
>
> The current glue code is specific to STM32MP15xx, the upcoming STM32MP13xx will introduce another entry specific to the STM32MP13xx. Rename the current entry to eqos_stm32mp15_config in preparation for STM32MP13xx addition. No functional change.
>
> Reviewed-by: Patrice Chotard<patrice.chotard@foss.st.com>
> Signed-off-by: Marek Vasut<marex@denx.de>
> ---
> Cc: Christophe Roullier<christophe.roullier@st.com>
> Cc: Joe Hershberger<joe.hershberger@ni.com>
> Cc: Patrice Chotard<patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay<patrick.delaunay@foss.st.com>
> Cc: Ramon Fried<rfried.dev@gmail.com>
> Cc:u-boot@dh-electronics.com
> Cc:uboot-stm32@st-md-mailman.stormreply.com
> ---
> V2: Add RB from Patrice
> ---
>   drivers/net/dwc_eth_qos.c       | 2 +-
>   drivers/net/dwc_eth_qos.h       | 2 +-
>   drivers/net/dwc_eth_qos_stm32.c | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c index 533c2bf070b..203bfc0848c 100644
> --- a/drivers/net/dwc_eth_qos.c
> +++ b/drivers/net/dwc_eth_qos.c
> @@ -1507,7 +1507,7 @@ static const struct udevice_id eqos_ids[] = {  #if IS_ENABLED(CONFIG_DWC_ETH_QOS_STM32)
>          {
>                  .compatible = "st,stm32mp1-dwmac",
> -               .data = (ulong)&eqos_stm32_config
> +               .data = (ulong)&eqos_stm32mp15_config
>          },
>   #endif
>   #if IS_ENABLED(CONFIG_DWC_ETH_QOS_IMX)
> diff --git a/drivers/net/dwc_eth_qos.h b/drivers/net/dwc_eth_qos.h index a6087f191ab..bafd0d339fb 100644
> --- a/drivers/net/dwc_eth_qos.h
> +++ b/drivers/net/dwc_eth_qos.h
> @@ -290,5 +290,5 @@ int eqos_null_ops(struct udevice *dev);  extern struct eqos_config eqos_imx_config;  extern struct eqos_config eqos_rockchip_config;  extern struct eqos_config eqos_qcom_config; -extern struct eqos_config eqos_stm32_config;
> +extern struct eqos_config eqos_stm32mp15_config;
>   extern struct eqos_config eqos_jh7110_config; diff --git a/drivers/net/dwc_eth_qos_stm32.c b/drivers/net/dwc_eth_qos_stm32.c index cfda757133e..fd29a604987 100644
> --- a/drivers/net/dwc_eth_qos_stm32.c
> +++ b/drivers/net/dwc_eth_qos_stm32.c
> @@ -184,7 +184,7 @@ static struct eqos_ops eqos_stm32_ops = {
>          .eqos_get_tick_clk_rate = eqos_get_tick_clk_rate_stm32  };
>
> -struct eqos_config __maybe_unused eqos_stm32_config = {
> +struct eqos_config __maybe_unused eqos_stm32mp15_config = {
>          .reg_access_always_ok = false,
>          .mdio_wait = 10000,
>          .swr_wait = 50,
> --
> 2.43.0
>
Reviewed-by: Christophe ROULLIER <christophe.roullier@foss.st.com>
--------------qeWvsPFdpSoyjKpah9hBwVoZ
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <span style=3D"white-space: pre-wrap">
</span>
    <blockquote type=3D"cite"
cite=3D"mid:DU2PR10MB7787578063068AFCDA4543388F002@DU2PR10MB7787.EURPRD10=
=2EPROD.OUTLOOK.COM">
      <pre class=3D"moz-quote-pre" wrap=3D"">-----Original Message-----
From: Marek Vasut <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:marex=
@denx.de">&lt;marex@denx.de&gt;</a>
Sent: Tuesday, March 26, 2024 1:07 PM
To: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:u-boot@lists.den=
x.de">u-boot@lists.denx.de</a>
Cc: Marek Vasut <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:marex@d=
enx.de">&lt;marex@denx.de&gt;</a>; Patrice CHOTARD - foss <a class=3D"moz=
-txt-link-rfc2396E" href=3D"mailto:patrice.chotard@foss.st.com">&lt;patri=
ce.chotard@foss.st.com&gt;</a>; Christophe ROULLIER <a class=3D"moz-txt-l=
ink-rfc2396E" href=3D"mailto:christophe.roullier@st.com">&lt;christophe.r=
oullier@st.com&gt;</a>; Joe Hershberger <a class=3D"moz-txt-link-rfc2396E=
" href=3D"mailto:joe.hershberger@ni.com">&lt;joe.hershberger@ni.com&gt;</=
a>; Patrick DELAUNAY - foss <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:patrick.delaunay@foss.st.com">&lt;patrick.delaunay@foss.st.com&gt;</=
a>; Ramon Fried <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:rfried.=
dev@gmail.com">&lt;rfried.dev@gmail.com&gt;</a>; <a class=3D"moz-txt-link=
-abbreviated" href=3D"mailto:u-boot@dh-electronics.com">u-boot@dh-electro=
nics.com</a>; <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:uboot-=
stm32@st-md-mailman.stormreply.com">uboot-stm32@st-md-mailman.stormreply.=
com</a>
Subject: [PATCH v2 02/11] net: dwc_eth_qos: Rename eqos_stm32_config to e=
qos_stm32mp15_config

The current glue code is specific to STM32MP15xx, the upcoming STM32MP13x=
x will introduce another entry specific to the STM32MP13xx. Rename the cu=
rrent entry to eqos_stm32mp15_config in preparation for STM32MP13xx addit=
ion. No functional change.

Reviewed-by: Patrice Chotard <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:patrice.chotard@foss.st.com">&lt;patrice.chotard@foss.st.com&gt;</a=
>
Signed-off-by: Marek Vasut <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:marex@denx.de">&lt;marex@denx.de&gt;</a>
---
Cc: Christophe Roullier <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:christophe.roullier@st.com">&lt;christophe.roullier@st.com&gt;</a>
Cc: Joe Hershberger <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:joe=
=2Ehershberger@ni.com">&lt;joe.hershberger@ni.com&gt;</a>
Cc: Patrice Chotard <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:pat=
rice.chotard@foss.st.com">&lt;patrice.chotard@foss.st.com&gt;</a>
Cc: Patrick Delaunay <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:pa=
trick.delaunay@foss.st.com">&lt;patrick.delaunay@foss.st.com&gt;</a>
Cc: Ramon Fried <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:rfried.=
dev@gmail.com">&lt;rfried.dev@gmail.com&gt;</a>
Cc: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:u-boot@dh-electr=
onics.com">u-boot@dh-electronics.com</a>
Cc: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:uboot-stm32@st-m=
d-mailman.stormreply.com">uboot-stm32@st-md-mailman.stormreply.com</a>
---
V2: Add RB from Patrice
---
 drivers/net/dwc_eth_qos.c       | 2 +-
 drivers/net/dwc_eth_qos.h       | 2 +-
 drivers/net/dwc_eth_qos_stm32.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c index =
533c2bf070b..203bfc0848c 100644
--- a/drivers/net/dwc_eth_qos.c
+++ b/drivers/net/dwc_eth_qos.c
@@ -1507,7 +1507,7 @@ static const struct udevice_id eqos_ids[] =3D {  #i=
f IS_ENABLED(CONFIG_DWC_ETH_QOS_STM32)
        {
                .compatible =3D "st,stm32mp1-dwmac",
-               .data =3D (ulong)&amp;eqos_stm32_config
+               .data =3D (ulong)&amp;eqos_stm32mp15_config
        },
 #endif
 #if IS_ENABLED(CONFIG_DWC_ETH_QOS_IMX)
diff --git a/drivers/net/dwc_eth_qos.h b/drivers/net/dwc_eth_qos.h index =
a6087f191ab..bafd0d339fb 100644
--- a/drivers/net/dwc_eth_qos.h
+++ b/drivers/net/dwc_eth_qos.h
@@ -290,5 +290,5 @@ int eqos_null_ops(struct udevice *dev);  extern struc=
t eqos_config eqos_imx_config;  extern struct eqos_config eqos_rockchip_c=
onfig;  extern struct eqos_config eqos_qcom_config; -extern struct eqos_c=
onfig eqos_stm32_config;
+extern struct eqos_config eqos_stm32mp15_config;
 extern struct eqos_config eqos_jh7110_config; diff --git a/drivers/net/d=
wc_eth_qos_stm32.c b/drivers/net/dwc_eth_qos_stm32.c index cfda757133e..f=
d29a604987 100644
--- a/drivers/net/dwc_eth_qos_stm32.c
+++ b/drivers/net/dwc_eth_qos_stm32.c
@@ -184,7 +184,7 @@ static struct eqos_ops eqos_stm32_ops =3D {
        .eqos_get_tick_clk_rate =3D eqos_get_tick_clk_rate_stm32  };

-struct eqos_config __maybe_unused eqos_stm32_config =3D {
+struct eqos_config __maybe_unused eqos_stm32mp15_config =3D {
        .reg_access_always_ok =3D false,
        .mdio_wait =3D 10000,
        .swr_wait =3D 50,
--
2.43.0

</pre>
    </blockquote>
    Reviewed-by: Christophe ROULLIER
    <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:christophe.roullier=
@foss.st.com">&lt;christophe.roullier@foss.st.com&gt;</a><br>
  </body>
</html>

--------------qeWvsPFdpSoyjKpah9hBwVoZ--

--===============2531784778134015436==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2531784778134015436==--
