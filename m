Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 430B689C8D6
	for <lists+uboot-stm32@lfdr.de>; Mon,  8 Apr 2024 17:53:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2221C7128B;
	Mon,  8 Apr 2024 15:53:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FF70C7128B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Apr 2024 15:53:13 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 438BgM3A009772; Mon, 8 Apr 2024 17:52:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 content-type:message-id:date:mime-version:subject:to:references
 :cc:from:in-reply-to; s=selector1; bh=CJRarlM4KMZn567U8ymj1LKj+B
 vAL7+gnFUwOFXTE9Y=; b=2SFG+SFV8jNfJbS87QgYRAFVkBe0p2SEFZxFJhjovK
 jFrGlbcgimNYmVH3YywvYPDM+mJR0ceZ+E6Rd3H+SM2rngrgMCnL9loh/YvvpAqu
 NcyGkjO+tlpsOuC1vAd66LX+G2N37U/E6yBnRVBw/qXd+X6qXevZEA+l541pd9Ow
 rhhxX0MlaQuvgcF7Ftkn5VvXeVogScv67A1H7TKGkaIrCsC7TaL7mCtl0+TOhdD3
 bG4AEvRpGYOVYoJNgCYeYfXVSgItIWCTReY5oY/+4iFVXsBXE/zOhLCqLEp3nYlB
 p1IdcVoVKjtxrhuirkFEZwraiBynSONwADDPWCe09wbQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xbfy0nk2a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Apr 2024 17:52:59 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 09A994002D;
 Mon,  8 Apr 2024 17:52:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 61E54223F1E;
 Mon,  8 Apr 2024 17:52:31 +0200 (CEST)
Received: from [10.48.86.106] (10.48.86.106) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 8 Apr
 2024 17:52:30 +0200
Message-ID: <f643acf7-bb3b-4e77-9a92-c65c24ff496e@foss.st.com>
Date: Mon, 8 Apr 2024 17:52:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240326120745.27581-1-marex@denx.de>
 <20240326120745.27581-12-marex@denx.de>
 <DU2PR10MB7787D22F0E32E7ADB04C3E9E8F002@DU2PR10MB7787.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <DU2PR10MB7787D22F0E32E7ADB04C3E9E8F002@DU2PR10MB7787.EURPRD10.PROD.OUTLOOK.COM>
X-Originating-IP: [10.48.86.106]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_14,2024-04-05_02,2023-05-22_02
Cc: u-boot@dh-electronics.com, Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Ramon Fried <rfried.dev@gmail.com>,
 Patrick DELAUNAY - foss <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 11/11] net: dwc_eth_qos: Add support
 for st, ext-phyclk property
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
Content-Type: multipart/mixed; boundary="===============7839062559492790387=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============7839062559492790387==
Content-Type: multipart/alternative;
	boundary="------------MYNVeK6PwlEFvMGAhatVDW0s"
Content-Language: en-US

--------------MYNVeK6PwlEFvMGAhatVDW0s
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

> -----Original Message-----
> From: Marek Vasut<marex@denx.de>
> Sent: Tuesday, March 26, 2024 1:08 PM
> To:u-boot@lists.denx.de
> Cc: Marek Vasut<marex@denx.de>; Christophe ROULLIER<christophe.roullier@st.com>; Joe Hershberger<joe.hershberger@ni.com>; Patrice CHOTARD - foss<patrice.chotard@foss.st.com>; Patrick DELAUNAY - foss<patrick.delaunay@foss.st.com>; Ramon Fried<rfried.dev@gmail.com>;u-boot@dh-electronics.com;uboot-stm32@st-md-mailman.stormreply.com
> Subject: [PATCH v2 11/11] net: dwc_eth_qos: Add support for st,ext-phyclk property
>
> The "st,ext-phyclk" property is a unification of "st,eth-clk-sel"
> and "st,eth-ref-clk-sel" properties. All three properties define ETH CK clock direction, however:
> - "st,eth-clk-sel" selects clock direction for GMII/RGMII mode
> - "st,eth-ref-clk-sel" selects clock direction for RMII mode
> - "st,ext-phyclk" selects clock direction for all RMII/GMII/RGMII modes The "st,ext-phyclk" is the preferrable property to use.
>
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
> V2: New patch
> ---
>   drivers/net/dwc_eth_qos_stm32.c | 30 +++++++++++++++++++++++++++---
>   1 file changed, 27 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/dwc_eth_qos_stm32.c b/drivers/net/dwc_eth_qos_stm32.c index 435473f99a6..9ee82b54c62 100644
> --- a/drivers/net/dwc_eth_qos_stm32.c
> +++ b/drivers/net/dwc_eth_qos_stm32.c
> @@ -140,6 +140,8 @@ static int eqos_probe_syscfg_stm32(struct udevice *dev,
>          const bool is_mp13 = device_is_compatible(dev, "st,stm32mp13-dwmac");
>          /* Gigabit Ethernet 125MHz clock selection. */
>          const bool eth_clk_sel = dev_read_bool(dev, "st,eth-clk-sel");
> +       /* Ethernet clock source is RCC. */
> +       const bool ext_phyclk = dev_read_bool(dev, "st,ext-phyclk");
>          struct regmap *regmap;
>          u32 regmap_mask;
>          u32 value;
> @@ -156,6 +158,12 @@ static int eqos_probe_syscfg_stm32(struct udevice *dev,
>                  dev_dbg(dev, "PHY_INTERFACE_MODE_MII\n");
>                  value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
>                                     SYSCFG_PMCSETR_ETH_SEL_GMII_MII);
> +               /*
> +                * STM32MP15xx supports both MII and GMII, STM32MP13xx MII only.
> +                * SYSCFG_PMCSETR ETH_SELMII is present only on STM32MP15xx and
> +                * acts as a selector between 0:GMII and 1:MII. As STM32MP13xx
> +                * supports only MII, ETH_SELMII is not present.
> +                */
>                  if (!is_mp13)   /* Select MII mode on STM32MP15xx */
>                          value |= SYSCFG_PMCSETR_ETH_SELMII;
>                  break;
> @@ -163,14 +171,25 @@ static int eqos_probe_syscfg_stm32(struct udevice *dev,
>                  dev_dbg(dev, "PHY_INTERFACE_MODE_GMII\n");
>                  value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
>                                     SYSCFG_PMCSETR_ETH_SEL_GMII_MII);
> -               if (eth_clk_sel)
> +               /*
> +                * If eth_clk_sel is set, use internal ETH_CLKx clock from RCC,
> +                * otherwise use external clock from IO pin (requires matching
> +                * GPIO block AF setting of that pin).
> +                */
> +               if (eth_clk_sel || ext_phyclk)
>                          value |= SYSCFG_PMCSETR_ETH_CLK_SEL;
>                  break;
>          case PHY_INTERFACE_MODE_RMII:
>                  dev_dbg(dev, "PHY_INTERFACE_MODE_RMII\n");
>                  value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
>                                     SYSCFG_PMCSETR_ETH_SEL_RMII);
> -               if (eth_ref_clk_sel)
> +               /*
> +                * If eth_ref_clk_sel is set, use internal clock from RCC,
> +                * otherwise use external clock from ETHn_RX_CLK/ETHn_REF_CLK
> +                * IO pin (requires matching GPIO block AF setting of that
> +                * pin).
> +                */
> +               if (eth_ref_clk_sel || ext_phyclk)
>                          value |= SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
>                  break;
>          case PHY_INTERFACE_MODE_RGMII:
> @@ -180,7 +199,12 @@ static int eqos_probe_syscfg_stm32(struct udevice *dev,
>                  dev_dbg(dev, "PHY_INTERFACE_MODE_RGMII\n");
>                  value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
>                                     SYSCFG_PMCSETR_ETH_SEL_RGMII);
> -               if (eth_clk_sel)
> +               /*
> +                * If eth_clk_sel is set, use internal ETH_CLKx clock from RCC,
> +                * otherwise use external clock from ETHx_CLK125 pin (requires
> +                * matching GPIO block AF setting of that pin).
> +                */
> +               if (eth_clk_sel || ext_phyclk)
>                          value |= SYSCFG_PMCSETR_ETH_CLK_SEL;
>                  break;
>          default:
> --
> 2.43.0
>
Reviewed-by: Christophe ROULLIER <christophe.roullier@foss.st.com>
--------------MYNVeK6PwlEFvMGAhatVDW0s
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
cite=3D"mid:DU2PR10MB7787D22F0E32E7ADB04C3E9E8F002@DU2PR10MB7787.EURPRD10=
=2EPROD.OUTLOOK.COM">
      <pre class=3D"moz-quote-pre" wrap=3D"">-----Original Message-----
From: Marek Vasut <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:marex=
@denx.de">&lt;marex@denx.de&gt;</a>
Sent: Tuesday, March 26, 2024 1:08 PM
To: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:u-boot@lists.den=
x.de">u-boot@lists.denx.de</a>
Cc: Marek Vasut <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:marex@d=
enx.de">&lt;marex@denx.de&gt;</a>; Christophe ROULLIER <a class=3D"moz-tx=
t-link-rfc2396E" href=3D"mailto:christophe.roullier@st.com">&lt;christoph=
e.roullier@st.com&gt;</a>; Joe Hershberger <a class=3D"moz-txt-link-rfc23=
96E" href=3D"mailto:joe.hershberger@ni.com">&lt;joe.hershberger@ni.com&gt=
;</a>; Patrice CHOTARD - foss <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:patrice.chotard@foss.st.com">&lt;patrice.chotard@foss.st.com&gt;</=
a>; Patrick DELAUNAY - foss <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:patrick.delaunay@foss.st.com">&lt;patrick.delaunay@foss.st.com&gt;</=
a>; Ramon Fried <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:rfried.=
dev@gmail.com">&lt;rfried.dev@gmail.com&gt;</a>; <a class=3D"moz-txt-link=
-abbreviated" href=3D"mailto:u-boot@dh-electronics.com">u-boot@dh-electro=
nics.com</a>; <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:uboot-=
stm32@st-md-mailman.stormreply.com">uboot-stm32@st-md-mailman.stormreply.=
com</a>
Subject: [PATCH v2 11/11] net: dwc_eth_qos: Add support for st,ext-phyclk=
 property

The "st,ext-phyclk" property is a unification of "st,eth-clk-sel"
and "st,eth-ref-clk-sel" properties. All three properties define ETH CK c=
lock direction, however:
- "st,eth-clk-sel" selects clock direction for GMII/RGMII mode
- "st,eth-ref-clk-sel" selects clock direction for RMII mode
- "st,ext-phyclk" selects clock direction for all RMII/GMII/RGMII modes T=
he "st,ext-phyclk" is the preferrable property to use.

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
V2: New patch
---
 drivers/net/dwc_eth_qos_stm32.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dwc_eth_qos_stm32.c b/drivers/net/dwc_eth_qos_st=
m32.c index 435473f99a6..9ee82b54c62 100644
--- a/drivers/net/dwc_eth_qos_stm32.c
+++ b/drivers/net/dwc_eth_qos_stm32.c
@@ -140,6 +140,8 @@ static int eqos_probe_syscfg_stm32(struct udevice *de=
v,
        const bool is_mp13 =3D device_is_compatible(dev, "st,stm32mp13-dw=
mac");
        /* Gigabit Ethernet 125MHz clock selection. */
        const bool eth_clk_sel =3D dev_read_bool(dev, "st,eth-clk-sel");
+       /* Ethernet clock source is RCC. */
+       const bool ext_phyclk =3D dev_read_bool(dev, "st,ext-phyclk");
        struct regmap *regmap;
        u32 regmap_mask;
        u32 value;
@@ -156,6 +158,12 @@ static int eqos_probe_syscfg_stm32(struct udevice *d=
ev,
                dev_dbg(dev, "PHY_INTERFACE_MODE_MII\n");
                value =3D FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
                                   SYSCFG_PMCSETR_ETH_SEL_GMII_MII);
+               /*
+                * STM32MP15xx supports both MII and GMII, STM32MP13xx MI=
I only.
+                * SYSCFG_PMCSETR ETH_SELMII is present only on STM32MP15=
xx and
+                * acts as a selector between 0:GMII and 1:MII. As STM32M=
P13xx
+                * supports only MII, ETH_SELMII is not present.
+                */
                if (!is_mp13)   /* Select MII mode on STM32MP15xx */
                        value |=3D SYSCFG_PMCSETR_ETH_SELMII;
                break;
@@ -163,14 +171,25 @@ static int eqos_probe_syscfg_stm32(struct udevice *=
dev,
                dev_dbg(dev, "PHY_INTERFACE_MODE_GMII\n");
                value =3D FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
                                   SYSCFG_PMCSETR_ETH_SEL_GMII_MII);
-               if (eth_clk_sel)
+               /*
+                * If eth_clk_sel is set, use internal ETH_CLKx clock fro=
m RCC,
+                * otherwise use external clock from IO pin (requires mat=
ching
+                * GPIO block AF setting of that pin).
+                */
+               if (eth_clk_sel || ext_phyclk)
                        value |=3D SYSCFG_PMCSETR_ETH_CLK_SEL;
                break;
        case PHY_INTERFACE_MODE_RMII:
                dev_dbg(dev, "PHY_INTERFACE_MODE_RMII\n");
                value =3D FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
                                   SYSCFG_PMCSETR_ETH_SEL_RMII);
-               if (eth_ref_clk_sel)
+               /*
+                * If eth_ref_clk_sel is set, use internal clock from RCC=
,
+                * otherwise use external clock from ETHn_RX_CLK/ETHn_REF=
_CLK
+                * IO pin (requires matching GPIO block AF setting of tha=
t
+                * pin).
+                */
+               if (eth_ref_clk_sel || ext_phyclk)
                        value |=3D SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
                break;
        case PHY_INTERFACE_MODE_RGMII:
@@ -180,7 +199,12 @@ static int eqos_probe_syscfg_stm32(struct udevice *d=
ev,
                dev_dbg(dev, "PHY_INTERFACE_MODE_RGMII\n");
                value =3D FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
                                   SYSCFG_PMCSETR_ETH_SEL_RGMII);
-               if (eth_clk_sel)
+               /*
+                * If eth_clk_sel is set, use internal ETH_CLKx clock fro=
m RCC,
+                * otherwise use external clock from ETHx_CLK125 pin (req=
uires
+                * matching GPIO block AF setting of that pin).
+                */
+               if (eth_clk_sel || ext_phyclk)
                        value |=3D SYSCFG_PMCSETR_ETH_CLK_SEL;
                break;
        default:
--
2.43.0

</pre>
    </blockquote>
    Reviewed-by: Christophe ROULLIER
    <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:christophe.roullier=
@foss.st.com">&lt;christophe.roullier@foss.st.com&gt;</a><br>
  </body>
</html>

--------------MYNVeK6PwlEFvMGAhatVDW0s--

--===============7839062559492790387==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7839062559492790387==--
