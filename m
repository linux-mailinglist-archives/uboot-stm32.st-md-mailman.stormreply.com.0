Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 172BB89C8C9
	for <lists+uboot-stm32@lfdr.de>; Mon,  8 Apr 2024 17:51:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 931C8C7128A;
	Mon,  8 Apr 2024 15:51:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 902D1C6C858
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Apr 2024 15:51:12 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 438BiFOd010796; Mon, 8 Apr 2024 17:51:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 content-type:message-id:date:mime-version:subject:to:references
 :cc:from:in-reply-to; s=selector1; bh=89BumtlToVlgIYtuLo/TZfICF4
 0r4QaD8XTXYEmTg5Q=; b=AFwOs/wL0BYYALT8xei1mcEhh6KFnyYC0pSXci7emZ
 bblYxLyHOyXK7qrCyuNX6K7y4sKazsahDu4Qn4slgB6HxI3/kmNUYJKJGimHmkCP
 sZcuL0+LYexp3jB37wYgiO80rrp5vyZmsBlDuB5TUK9q+8I/aqs9Vkd5pjSxbg2Z
 9aZA1r/0pcEj6t3CDJNgu/4fmMGBBe/ATsqltiShCykghHgs+K+vyqrlr/jxKHCY
 4fSavy6Te2zBHFvXSCJoDa2HJ8Z5yEAbI/TFHKJa9v2reECn/uVxdqkEOBqPo4Hh
 kQyEEd8dXHOjOQPtsBGQICKJQGm2Donms7Z09wegWekw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xautfqr0y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Apr 2024 17:50:59 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1CC8F40044;
 Mon,  8 Apr 2024 17:50:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E3122223F17;
 Mon,  8 Apr 2024 17:50:30 +0200 (CEST)
Received: from [10.48.86.106] (10.48.86.106) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 8 Apr
 2024 17:50:30 +0200
Message-ID: <e5230a47-e4ef-4f68-a3a0-006a3d2819ca@foss.st.com>
Date: Mon, 8 Apr 2024 17:50:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240326120745.27581-1-marex@denx.de>
 <20240326120745.27581-10-marex@denx.de>
 <DU2PR10MB7787F61FC3E236ED43D750418F002@DU2PR10MB7787.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <DU2PR10MB7787F61FC3E236ED43D750418F002@DU2PR10MB7787.EURPRD10.PROD.OUTLOOK.COM>
X-Originating-IP: [10.48.86.106]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_14,2024-04-05_02,2023-05-22_02
Cc: u-boot@dh-electronics.com, Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Ramon Fried <rfried.dev@gmail.com>,
 Patrick DELAUNAY - foss <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 09/11] net: dwc_eth_qos: Add DT parsing
 for STM32MP13xx platform
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
Content-Type: multipart/mixed; boundary="===============4638251393229172292=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============4638251393229172292==
Content-Type: multipart/alternative;
	boundary="------------X5bJZZkddtDiiXMfND4NXrJz"
Content-Language: en-US

--------------X5bJZZkddtDiiXMfND4NXrJz
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

> -----Original Message-----
> From: Marek Vasut<marex@denx.de>
> Sent: Tuesday, March 26, 2024 1:08 PM
> To:u-boot@lists.denx.de
> Cc: Christophe ROULLIER<christophe.roullier@st.com>; Marek Vasut<marex@denx.de>; Joe Hershberger<joe.hershberger@ni.com>; Patrice CHOTARD - foss<patrice.chotard@foss.st.com>; Patrick DELAUNAY - foss<patrick.delaunay@foss.st.com>; Ramon Fried<rfried.dev@gmail.com>;u-boot@dh-electronics.com;uboot-stm32@st-md-mailman.stormreply.com
> Subject: [PATCH v2 09/11] net: dwc_eth_qos: Add DT parsing for STM32MP13xx platform
>
> From: Christophe Roullier<christophe.roullier@st.com>
>
> Manage 2 ethernet instances, select which instance to configure with mask If mask is not present in DT, it is stm32mp15 platform.
>
> Signed-off-by: Christophe Roullier<christophe.roullier@st.com>
> Signed-off-by: Marek Vasut<marex@denx.de>  # Rework the code
> ---
> Cc: Christophe Roullier<christophe.roullier@st.com>
> Cc: Joe Hershberger<joe.hershberger@ni.com>
> Cc: Patrice Chotard<patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay<patrick.delaunay@foss.st.com>
> Cc: Ramon Fried<rfried.dev@gmail.com>
> Cc:u-boot@dh-electronics.com
> Cc:uboot-stm32@st-md-mailman.stormreply.com
> ---
> V2: - Drop unrelated clock frequency validation
>      - Move "st,ext-phyclk" property support into separate patch
>      - This leaves only the regmap parts here
> ---
>   drivers/net/dwc_eth_qos_stm32.c | 41 ++++++++++++++++++++++-----------
>   1 file changed, 28 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/net/dwc_eth_qos_stm32.c b/drivers/net/dwc_eth_qos_stm32.c index 0b13d01346b..5a20fe5bea2 100644
> --- a/drivers/net/dwc_eth_qos_stm32.c
> +++ b/drivers/net/dwc_eth_qos_stm32.c
> @@ -23,6 +23,7 @@
>   #include <net.h>
>   #include <netdev.h>
>   #include <phy.h>
> +#include <regmap.h>
>   #include <reset.h>
>   #include <syscon.h>
>   #include <wait_bit.h>
> @@ -33,11 +34,16 @@
>
>   /* SYSCFG registers */
>   #define SYSCFG_PMCSETR         0x04
> -#define SYSCFG_PMCCLRR         0x44
> +#define SYSCFG_PMCCLRR_MP13    0x08
> +#define SYSCFG_PMCCLRR_MP15    0x44
> +
> +#define SYSCFG_PMCSETR_ETH1_MASK       GENMASK(23, 16)
> +#define SYSCFG_PMCSETR_ETH2_MASK       GENMASK(31, 24)
>
>   #define SYSCFG_PMCSETR_ETH_CLK_SEL     BIT(16)
>   #define SYSCFG_PMCSETR_ETH_REF_CLK_SEL BIT(17)
>
> +/* STM32MP15xx specific bit */
>   #define SYSCFG_PMCSETR_ETH_SELMII      BIT(20)
>
>   #define SYSCFG_PMCSETR_ETH_SEL_MASK    GENMASK(23, 21)
> @@ -130,23 +136,30 @@ static int eqos_probe_syscfg_stm32(struct udevice *dev,  {
>          /* Ethernet 50MHz RMII clock selection. */
>          const bool eth_ref_clk_sel = dev_read_bool(dev, "st,eth-ref-clk-sel");
> +       /* SoC is STM32MP13xx with two ethernet MACs */
> +       const bool is_mp13 = device_is_compatible(dev, "st,stm32mp13-dwmac");
>          /* Gigabit Ethernet 125MHz clock selection. */
>          const bool eth_clk_sel = dev_read_bool(dev, "st,eth-clk-sel");
> -       u8 *syscfg;
> +       struct regmap *regmap;
> +       u32 regmap_mask;
>          u32 value;
>
> -       syscfg = (u8 *)syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
> -       if (!syscfg)
> -               return -ENODEV;
> +       regmap = syscon_regmap_lookup_by_phandle(dev, "st,syscon");
> +       if (IS_ERR(regmap))
> +               return PTR_ERR(regmap);
> +
> +       regmap_mask = dev_read_u32_index_default(dev, "st,syscon", 2,
> +                                                SYSCFG_PMCSETR_ETH1_MASK);
>
>          switch (interface_type) {
>          case PHY_INTERFACE_MODE_MII:
>                  dev_dbg(dev, "PHY_INTERFACE_MODE_MII\n");
>                  value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
>                                     SYSCFG_PMCSETR_ETH_SEL_GMII_MII);
> -               value |= SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
> +               if (!is_mp13)   /* Select MII mode on STM32MP15xx */
> +                       value |= SYSCFG_PMCSETR_ETH_SELMII;
>                  break;
> -       case PHY_INTERFACE_MODE_GMII:
> +       case PHY_INTERFACE_MODE_GMII:   /* STM32MP15xx only */
>                  dev_dbg(dev, "PHY_INTERFACE_MODE_GMII\n");
>                  value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
>                                     SYSCFG_PMCSETR_ETH_SEL_GMII_MII); @@ -177,13 +190,15 @@ static int eqos_probe_syscfg_stm32(struct udevice *dev,
>                  return -EINVAL;
>          }
>
> -       /* clear and set ETH configuration bits */
> -       writel(SYSCFG_PMCSETR_ETH_SEL_MASK | SYSCFG_PMCSETR_ETH_SELMII |
> -              SYSCFG_PMCSETR_ETH_REF_CLK_SEL | SYSCFG_PMCSETR_ETH_CLK_SEL,
> -              syscfg + SYSCFG_PMCCLRR);
> -       writel(value, syscfg + SYSCFG_PMCSETR);
> +       /* Shift value at correct ethernet MAC offset in SYSCFG_PMCSETR */
> +       value <<= ffs(regmap_mask) - ffs(SYSCFG_PMCSETR_ETH1_MASK);
>
> -       return 0;
> +       /* Update PMCCLRR (clear register) */
> +       regmap_write(regmap, is_mp13 ?
> +                            SYSCFG_PMCCLRR_MP13 : SYSCFG_PMCCLRR_MP15,
> +                            regmap_mask);
> +
> +       return regmap_update_bits(regmap, SYSCFG_PMCSETR, regmap_mask, value);
>   }
>
>   static int eqos_probe_resources_stm32(struct udevice *dev)
> --
> 2.43.0
Reviewed-by: Christophe ROULLIER <christophe.roullier@foss.st.com>
--------------X5bJZZkddtDiiXMfND4NXrJz
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
cite=3D"mid:DU2PR10MB7787F61FC3E236ED43D750418F002@DU2PR10MB7787.EURPRD10=
=2EPROD.OUTLOOK.COM">
      <pre class=3D"moz-quote-pre" wrap=3D"">-----Original Message-----
From: Marek Vasut <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:marex=
@denx.de">&lt;marex@denx.de&gt;</a>
Sent: Tuesday, March 26, 2024 1:08 PM
To: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:u-boot@lists.den=
x.de">u-boot@lists.denx.de</a>
Cc: Christophe ROULLIER <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:christophe.roullier@st.com">&lt;christophe.roullier@st.com&gt;</a>; Mare=
k Vasut <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:marex@denx.de">=
&lt;marex@denx.de&gt;</a>; Joe Hershberger <a class=3D"moz-txt-link-rfc23=
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
Subject: [PATCH v2 09/11] net: dwc_eth_qos: Add DT parsing for STM32MP13x=
x platform

From: Christophe Roullier <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:christophe.roullier@st.com">&lt;christophe.roullier@st.com&gt;</a>

Manage 2 ethernet instances, select which instance to configure with mask=
 If mask is not present in DT, it is stm32mp15 platform.

Signed-off-by: Christophe Roullier <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"mailto:christophe.roullier@st.com">&lt;christophe.roullier@st.com&gt=
;</a>
Signed-off-by: Marek Vasut <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:marex@denx.de">&lt;marex@denx.de&gt;</a> # Rework the code
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
V2: - Drop unrelated clock frequency validation
    - Move "st,ext-phyclk" property support into separate patch
    - This leaves only the regmap parts here
---
 drivers/net/dwc_eth_qos_stm32.c | 41 ++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/drivers/net/dwc_eth_qos_stm32.c b/drivers/net/dwc_eth_qos_st=
m32.c index 0b13d01346b..5a20fe5bea2 100644
--- a/drivers/net/dwc_eth_qos_stm32.c
+++ b/drivers/net/dwc_eth_qos_stm32.c
@@ -23,6 +23,7 @@
 #include &lt;net.h&gt;
 #include &lt;netdev.h&gt;
 #include &lt;phy.h&gt;
+#include &lt;regmap.h&gt;
 #include &lt;reset.h&gt;
 #include &lt;syscon.h&gt;
 #include &lt;wait_bit.h&gt;
@@ -33,11 +34,16 @@

 /* SYSCFG registers */
 #define SYSCFG_PMCSETR         0x04
-#define SYSCFG_PMCCLRR         0x44
+#define SYSCFG_PMCCLRR_MP13    0x08
+#define SYSCFG_PMCCLRR_MP15    0x44
+
+#define SYSCFG_PMCSETR_ETH1_MASK       GENMASK(23, 16)
+#define SYSCFG_PMCSETR_ETH2_MASK       GENMASK(31, 24)

 #define SYSCFG_PMCSETR_ETH_CLK_SEL     BIT(16)
 #define SYSCFG_PMCSETR_ETH_REF_CLK_SEL BIT(17)

+/* STM32MP15xx specific bit */
 #define SYSCFG_PMCSETR_ETH_SELMII      BIT(20)

 #define SYSCFG_PMCSETR_ETH_SEL_MASK    GENMASK(23, 21)
@@ -130,23 +136,30 @@ static int eqos_probe_syscfg_stm32(struct udevice *=
dev,  {
        /* Ethernet 50MHz RMII clock selection. */
        const bool eth_ref_clk_sel =3D dev_read_bool(dev, "st,eth-ref-clk=
-sel");
+       /* SoC is STM32MP13xx with two ethernet MACs */
+       const bool is_mp13 =3D device_is_compatible(dev, "st,stm32mp13-dw=
mac");
        /* Gigabit Ethernet 125MHz clock selection. */
        const bool eth_clk_sel =3D dev_read_bool(dev, "st,eth-clk-sel");
-       u8 *syscfg;
+       struct regmap *regmap;
+       u32 regmap_mask;
        u32 value;

-       syscfg =3D (u8 *)syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
-       if (!syscfg)
-               return -ENODEV;
+       regmap =3D syscon_regmap_lookup_by_phandle(dev, "st,syscon");
+       if (IS_ERR(regmap))
+               return PTR_ERR(regmap);
+
+       regmap_mask =3D dev_read_u32_index_default(dev, "st,syscon", 2,
+                                                SYSCFG_PMCSETR_ETH1_MASK=
);

        switch (interface_type) {
        case PHY_INTERFACE_MODE_MII:
                dev_dbg(dev, "PHY_INTERFACE_MODE_MII\n");
                value =3D FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
                                   SYSCFG_PMCSETR_ETH_SEL_GMII_MII);
-               value |=3D SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
+               if (!is_mp13)   /* Select MII mode on STM32MP15xx */
+                       value |=3D SYSCFG_PMCSETR_ETH_SELMII;
                break;
-       case PHY_INTERFACE_MODE_GMII:
+       case PHY_INTERFACE_MODE_GMII:   /* STM32MP15xx only */
                dev_dbg(dev, "PHY_INTERFACE_MODE_GMII\n");
                value =3D FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
                                   SYSCFG_PMCSETR_ETH_SEL_GMII_MII); @@ -=
177,13 +190,15 @@ static int eqos_probe_syscfg_stm32(struct udevice *dev,=

                return -EINVAL;
        }

-       /* clear and set ETH configuration bits */
-       writel(SYSCFG_PMCSETR_ETH_SEL_MASK | SYSCFG_PMCSETR_ETH_SELMII |
-              SYSCFG_PMCSETR_ETH_REF_CLK_SEL | SYSCFG_PMCSETR_ETH_CLK_SE=
L,
-              syscfg + SYSCFG_PMCCLRR);
-       writel(value, syscfg + SYSCFG_PMCSETR);
+       /* Shift value at correct ethernet MAC offset in SYSCFG_PMCSETR *=
/
+       value &lt;&lt;=3D ffs(regmap_mask) - ffs(SYSCFG_PMCSETR_ETH1_MASK=
);

-       return 0;
+       /* Update PMCCLRR (clear register) */
+       regmap_write(regmap, is_mp13 ?
+                            SYSCFG_PMCCLRR_MP13 : SYSCFG_PMCCLRR_MP15,
+                            regmap_mask);
+
+       return regmap_update_bits(regmap, SYSCFG_PMCSETR, regmap_mask, va=
lue);
 }

 static int eqos_probe_resources_stm32(struct udevice *dev)
--
2.43.0
</pre>
    </blockquote>
    Reviewed-by: Christophe ROULLIER
    <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:christophe.roullier=
@foss.st.com">&lt;christophe.roullier@foss.st.com&gt;</a><br>
    <blockquote type=3D"cite"
cite=3D"mid:DU2PR10MB7787F61FC3E236ED43D750418F002@DU2PR10MB7787.EURPRD10=
=2EPROD.OUTLOOK.COM">
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
    </blockquote>
  </body>
</html>

--------------X5bJZZkddtDiiXMfND4NXrJz--

--===============4638251393229172292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4638251393229172292==--
