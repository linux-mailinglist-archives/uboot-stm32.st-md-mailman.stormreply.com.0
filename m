Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B75ACD7AD
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Jun 2025 08:02:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A8BAC32EA8;
	Wed,  4 Jun 2025 06:02:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6541FC32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Jun 2025 06:02:22 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5543Ip75000326;
 Wed, 4 Jun 2025 08:02:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 +O+md1OmJms3DjRTWQb2PcAehT0Q+USc1WyORfAfJoY=; b=HNNpzxRKcfLt9Fwk
 BZ2Ug7n8QXu7lj3ogJSLvNiS/cCx+cnW9+LYgk+BY3Maz2ZKZlPE3LpQyE1B/omH
 FPxtOs5A/BfCVPzabIzcMBLCq+Wy8v+Knz0hXCS6a6oyrf4KsENUmqIOOyv2KH+L
 ya1wCnY+N3QCZlR2bkxrbZQsRwEeqEybnZw0aJ6xBPORngkP5HEAX7NmtQXmfDra
 df+PSikqVwYwMD0cGHDMjwgBtQFAipgbL2pvNRuJSTuHuZlXnn2CvCyWjtqnVkHx
 LKMIOCaDoOIjfqllJvze9zZw5zK9+lmLxK287Z8iPikjCMBTmqKmtbwPhMmrcdEA
 RFbDZg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 471g93fhtj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Jun 2025 08:02:14 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A7E484009C;
 Wed,  4 Jun 2025 08:00:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 41912AD1858;
 Wed,  4 Jun 2025 08:00:01 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Jun
 2025 08:00:00 +0200
Message-ID: <a92b2098-5ee3-4df0-a83f-b2bd5a7deaa7@foss.st.com>
Date: Wed, 4 Jun 2025 08:00:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <u-boot@lists.denx.de>
References: <20250527132755.2169508-1-patrice.chotard@foss.st.com>
 <20250527132755.2169508-10-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250527132755.2169508-10-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_01,2025-06-03_02,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>, Joe Hershberger <joe.hershberger@ni.com>,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 09/13] phy: stm32-usbphyc: manage
 properly the clk identifier with CCF
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>



On 5/27/25 15:27, Patrice Chotard wrote:
> From: Patrick Delaunay <patrick.delaunay@foss.st.com>
> 
> Add private uclass data for "stm32-usbphyc-clk" as it is not done
> by the driver model.
> 
> This clk struct is needed by CCF to save the unique id used to identify
> each clock.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Lukasz Majewski <lukma@denx.de>
> Cc: Sean Anderson <seanga2@gmail.com>
> ---
> 
> (no changes since v1)
> 
>  drivers/phy/phy-stm32-usbphyc.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/phy/phy-stm32-usbphyc.c b/drivers/phy/phy-stm32-usbphyc.c
> index 8d643b762f9..fcf8617ee9b 100644
> --- a/drivers/phy/phy-stm32-usbphyc.c
> +++ b/drivers/phy/phy-stm32-usbphyc.c
> @@ -16,7 +16,9 @@
>  #include <syscon.h>
>  #include <usb.h>
>  #include <asm/io.h>
> +#include <dm/device.h>
>  #include <dm/device_compat.h>
> +#include <dm/device-internal.h>
>  #include <dm/lists.h>
>  #include <dm/of_access.h>
>  #include <linux/bitfield.h>
> @@ -633,6 +635,7 @@ U_BOOT_DRIVER(stm32_usb_phyc) = {
>  
>  struct stm32_usbphyc_clk {
>  	bool enable;
> +	struct clk clkp;
>  };
>  
>  static ulong stm32_usbphyc_clk48_get_rate(struct clk *clk)
> @@ -687,9 +690,25 @@ const struct clk_ops usbphyc_clk48_ops = {
>  	.disable = stm32_usbphyc_clk48_disable,
>  };
>  
> +int usbphyc_clk48_probe(struct udevice *dev)
> +{
> +	struct stm32_usbphyc_clk *priv = dev_get_priv(dev);
> +
> +	/* prepare clkp to correctly register clock with CCF */
> +	priv->clkp.dev = dev;
> +	priv->clkp.id = CLK_ID(dev, 0);
> +
> +	/* Store back pointer to clk from udevice */
> +	/* FIXME: This is not allowed...should be allocated by driver model */
> +	dev_set_uclass_priv(dev, &priv->clkp);
> +
> +	return 0;
> +}
> +
>  U_BOOT_DRIVER(stm32_usb_phyc_clk) = {
>  	.name = "stm32-usbphyc-clk",
>  	.id = UCLASS_CLK,
>  	.ops = &usbphyc_clk48_ops,
> +	.probe = &usbphyc_clk48_probe,
>  	.priv_auto = sizeof(struct stm32_usbphyc_clk),
>  };
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
