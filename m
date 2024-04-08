Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 069C889C8CE
	for <lists+uboot-stm32@lfdr.de>; Mon,  8 Apr 2024 17:52:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5D9DC7128A;
	Mon,  8 Apr 2024 15:52:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2795C6C858
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Apr 2024 15:52:12 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 438BrlCr029165; Mon, 8 Apr 2024 17:51:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 content-type:message-id:date:mime-version:subject:to:references
 :cc:from:in-reply-to; s=selector1; bh=5Ip9UDLsXDUJSH1hGrxWd8gmvU
 Co8YfObnEYklH8Di8=; b=vcta7CSoiSYtzg4e8hoL9gzUwXrXNIk2I5TdOdrTb/
 PDQwKaVZOrNgX6bQD2qsKiYuO9usEW04POuHHbRUM+wgVxY3IprEIXvfkVyVg1y6
 HkX2BAPk06UQS4JN+LFfBKkkCSYIC83gFJ1Bwoel1CFK6lhxX7Tctzm8BV4mZH/A
 LBuIqdvVd7tQqMdtMVAnzgarUlk9OO0DLdG4iuwpAalkEUY/Q5qZchT/lsoULDF6
 o6St0V5xPOQRocI0XwJMSdLPaufUR6o3sQ0qw63UwFaGrRgISB5svm34OXTxQq/V
 PChOG/oZfdhWMmj6tA3Dpp0wiq/oXAGcfi7Ekzurj+7g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xauh4yjtt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Apr 2024 17:51:58 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 654514002D;
 Mon,  8 Apr 2024 17:51:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C6D6D216EE1;
 Mon,  8 Apr 2024 17:51:29 +0200 (CEST)
Received: from [10.48.86.106] (10.48.86.106) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 8 Apr
 2024 17:51:28 +0200
Message-ID: <62fb769e-51fd-4c07-9af6-da751f6f0736@foss.st.com>
Date: Mon, 8 Apr 2024 17:51:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240326120745.27581-1-marex@denx.de>
 <20240326120745.27581-11-marex@denx.de>
 <DU2PR10MB7787E5DD3C53330D616436E68F002@DU2PR10MB7787.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <DU2PR10MB7787E5DD3C53330D616436E68F002@DU2PR10MB7787.EURPRD10.PROD.OUTLOOK.COM>
X-Originating-IP: [10.48.86.106]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_14,2024-04-05_02,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, u-boot@dh-electronics.com,
 Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Ramon Fried <rfried.dev@gmail.com>,
 Patrick DELAUNAY - foss <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 10/11] net: dwc_eth_qos: Add support of
 STM32MP13xx platform
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
Content-Type: multipart/mixed; boundary="===============1672758748800451466=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============1672758748800451466==
Content-Type: multipart/alternative;
	boundary="------------TXDbhrL8lw0T10iajnM6UVlK"
Content-Language: en-US

--------------TXDbhrL8lw0T10iajnM6UVlK
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

> -----Original Message-----
> From: Marek Vasut<marex@denx.de>
> Sent: Tuesday, March 26, 2024 1:08 PM
> To:u-boot@lists.denx.de
> Cc: Christophe ROULLIER<christophe.roullier@st.com>; Patrice CHOTARD - foss<patrice.chotard@foss.st.com>; Marek Vasut<marex@denx.de>; Joe Hershberger<joe.hershberger@ni.com>; Patrick DELAUNAY - foss<patrick.delaunay@foss.st.com>; Ramon Fried<rfried.dev@gmail.com>;u-boot@dh-electronics.com;uboot-stm32@st-md-mailman.stormreply.com
> Subject: [PATCH v2 10/11] net: dwc_eth_qos: Add support of STM32MP13xx platform
>
> From: Christophe Roullier<christophe.roullier@st.com>
>
> Add compatible "st,stm32mp13-dwmac" to manage STM32MP13 boards.
>
> Reviewed-by: Patrice Chotard<patrice.chotard@foss.st.com>
> Signed-off-by: Christophe Roullier<christophe.roullier@st.com>
> Signed-off-by: Marek Vasut<marex@denx.de>  # Rebase, reshuffle, squash code
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
>   drivers/net/dwc_eth_qos.c       |  4 ++++
>   drivers/net/dwc_eth_qos.h       |  1 +
>   drivers/net/dwc_eth_qos_stm32.c | 11 +++++++++++
>   3 files changed, 16 insertions(+)
>
> diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c index 203bfc0848c..e02317905e5 100644
> --- a/drivers/net/dwc_eth_qos.c
> +++ b/drivers/net/dwc_eth_qos.c
> @@ -1505,6 +1505,10 @@ static const struct udevice_id eqos_ids[] = {
>          },
>   #endif
>   #if IS_ENABLED(CONFIG_DWC_ETH_QOS_STM32)
> +       {
> +               .compatible = "st,stm32mp13-dwmac",
> +               .data = (ulong)&eqos_stm32mp13_config
> +       },
>          {
>                  .compatible = "st,stm32mp1-dwmac",
>                  .data = (ulong)&eqos_stm32mp15_config diff --git a/drivers/net/dwc_eth_qos.h b/drivers/net/dwc_eth_qos.h index bafd0d339fb..8b3d0d464d3 100644
> --- a/drivers/net/dwc_eth_qos.h
> +++ b/drivers/net/dwc_eth_qos.h
> @@ -290,5 +290,6 @@ int eqos_null_ops(struct udevice *dev);  extern struct eqos_config eqos_imx_config;  extern struct eqos_config eqos_rockchip_config;  extern struct eqos_config eqos_qcom_config;
> +extern struct eqos_config eqos_stm32mp13_config;
>   extern struct eqos_config eqos_stm32mp15_config;  extern struct eqos_config eqos_jh7110_config; diff --git a/drivers/net/dwc_eth_qos_stm32.c b/drivers/net/dwc_eth_qos_stm32.c index 5a20fe5bea2..435473f99a6 100644
> --- a/drivers/net/dwc_eth_qos_stm32.c
> +++ b/drivers/net/dwc_eth_qos_stm32.c
> @@ -279,6 +279,17 @@ static struct eqos_ops eqos_stm32_ops = {
>          .eqos_get_tick_clk_rate = eqos_get_tick_clk_rate_stm32  };
>
> +struct eqos_config __maybe_unused eqos_stm32mp13_config = {
> +       .reg_access_always_ok = false,
> +       .mdio_wait = 10000,
> +       .swr_wait = 50,
> +       .config_mac = EQOS_MAC_RXQ_CTRL0_RXQ0EN_ENABLED_DCB,
> +       .config_mac_mdio = EQOS_MAC_MDIO_ADDRESS_CR_250_300,
> +       .axi_bus_width = EQOS_AXI_WIDTH_32,
> +       .interface = dev_read_phy_mode,
> +       .ops = &eqos_stm32_ops
> +};
> +
>   struct eqos_config __maybe_unused eqos_stm32mp15_config = {
>          .reg_access_always_ok = false,
>          .mdio_wait = 10000,
> --
> 2.43.0
>
Reviewed-by: Christophe ROULLIER <christophe.roullier@foss.st.com>
--------------TXDbhrL8lw0T10iajnM6UVlK
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
cite=3D"mid:DU2PR10MB7787E5DD3C53330D616436E68F002@DU2PR10MB7787.EURPRD10=
=2EPROD.OUTLOOK.COM">
      <pre class=3D"moz-quote-pre" wrap=3D"">-----Original Message-----
From: Marek Vasut <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:marex=
@denx.de">&lt;marex@denx.de&gt;</a>
Sent: Tuesday, March 26, 2024 1:08 PM
To: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:u-boot@lists.den=
x.de">u-boot@lists.denx.de</a>
Cc: Christophe ROULLIER <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:christophe.roullier@st.com">&lt;christophe.roullier@st.com&gt;</a>; Patr=
ice CHOTARD - foss <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:patr=
ice.chotard@foss.st.com">&lt;patrice.chotard@foss.st.com&gt;</a>; Marek V=
asut <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:marex@denx.de">&lt=
;marex@denx.de&gt;</a>; Joe Hershberger <a class=3D"moz-txt-link-rfc2396E=
" href=3D"mailto:joe.hershberger@ni.com">&lt;joe.hershberger@ni.com&gt;</=
a>; Patrick DELAUNAY - foss <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:patrick.delaunay@foss.st.com">&lt;patrick.delaunay@foss.st.com&gt;</=
a>; Ramon Fried <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:rfried.=
dev@gmail.com">&lt;rfried.dev@gmail.com&gt;</a>; <a class=3D"moz-txt-link=
-abbreviated" href=3D"mailto:u-boot@dh-electronics.com">u-boot@dh-electro=
nics.com</a>; <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:uboot-=
stm32@st-md-mailman.stormreply.com">uboot-stm32@st-md-mailman.stormreply.=
com</a>
Subject: [PATCH v2 10/11] net: dwc_eth_qos: Add support of STM32MP13xx pl=
atform

From: Christophe Roullier <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:christophe.roullier@st.com">&lt;christophe.roullier@st.com&gt;</a>

Add compatible "st,stm32mp13-dwmac" to manage STM32MP13 boards.

Reviewed-by: Patrice Chotard <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:patrice.chotard@foss.st.com">&lt;patrice.chotard@foss.st.com&gt;</a=
>
Signed-off-by: Christophe Roullier <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"mailto:christophe.roullier@st.com">&lt;christophe.roullier@st.com&gt=
;</a>
Signed-off-by: Marek Vasut <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:marex@denx.de">&lt;marex@denx.de&gt;</a> # Rebase, reshuffle, squash =
code
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
 drivers/net/dwc_eth_qos.c       |  4 ++++
 drivers/net/dwc_eth_qos.h       |  1 +
 drivers/net/dwc_eth_qos_stm32.c | 11 +++++++++++
 3 files changed, 16 insertions(+)

diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c index =
203bfc0848c..e02317905e5 100644
--- a/drivers/net/dwc_eth_qos.c
+++ b/drivers/net/dwc_eth_qos.c
@@ -1505,6 +1505,10 @@ static const struct udevice_id eqos_ids[] =3D {
        },
 #endif
 #if IS_ENABLED(CONFIG_DWC_ETH_QOS_STM32)
+       {
+               .compatible =3D "st,stm32mp13-dwmac",
+               .data =3D (ulong)&amp;eqos_stm32mp13_config
+       },
        {
                .compatible =3D "st,stm32mp1-dwmac",
                .data =3D (ulong)&amp;eqos_stm32mp15_config diff --git a/=
drivers/net/dwc_eth_qos.h b/drivers/net/dwc_eth_qos.h index bafd0d339fb..=
8b3d0d464d3 100644
--- a/drivers/net/dwc_eth_qos.h
+++ b/drivers/net/dwc_eth_qos.h
@@ -290,5 +290,6 @@ int eqos_null_ops(struct udevice *dev);  extern struc=
t eqos_config eqos_imx_config;  extern struct eqos_config eqos_rockchip_c=
onfig;  extern struct eqos_config eqos_qcom_config;
+extern struct eqos_config eqos_stm32mp13_config;
 extern struct eqos_config eqos_stm32mp15_config;  extern struct eqos_con=
fig eqos_jh7110_config; diff --git a/drivers/net/dwc_eth_qos_stm32.c b/dr=
ivers/net/dwc_eth_qos_stm32.c index 5a20fe5bea2..435473f99a6 100644
--- a/drivers/net/dwc_eth_qos_stm32.c
+++ b/drivers/net/dwc_eth_qos_stm32.c
@@ -279,6 +279,17 @@ static struct eqos_ops eqos_stm32_ops =3D {
        .eqos_get_tick_clk_rate =3D eqos_get_tick_clk_rate_stm32  };

+struct eqos_config __maybe_unused eqos_stm32mp13_config =3D {
+       .reg_access_always_ok =3D false,
+       .mdio_wait =3D 10000,
+       .swr_wait =3D 50,
+       .config_mac =3D EQOS_MAC_RXQ_CTRL0_RXQ0EN_ENABLED_DCB,
+       .config_mac_mdio =3D EQOS_MAC_MDIO_ADDRESS_CR_250_300,
+       .axi_bus_width =3D EQOS_AXI_WIDTH_32,
+       .interface =3D dev_read_phy_mode,
+       .ops =3D &amp;eqos_stm32_ops
+};
+
 struct eqos_config __maybe_unused eqos_stm32mp15_config =3D {
        .reg_access_always_ok =3D false,
        .mdio_wait =3D 10000,
--
2.43.0

</pre>
    </blockquote>
    Reviewed-by: Christophe ROULLIER
    <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:christophe.roullier=
@foss.st.com">&lt;christophe.roullier@foss.st.com&gt;</a><br>
  </body>
</html>

--------------TXDbhrL8lw0T10iajnM6UVlK--

--===============1672758748800451466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1672758748800451466==--
