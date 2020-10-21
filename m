Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8A4294BDE
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 13:43:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 768FCC3FAE0;
	Wed, 21 Oct 2020 11:43:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC8BEC3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 11:43:24 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LBhICZ003277; Wed, 21 Oct 2020 13:43:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=jTg9MhpxrsMQqJtvKTU/aqsK0wb0OSun39f1Pyk60KY=;
 b=ikqRT893UaWQdQm/WRPC7K7sEDbO5BHYZuIJHJU2WDjJIyZzdfTu92ppIoZ8M7LQSEAR
 EtoxMUy7Qw7At/07ozcmyT9jC5lkQNlCj2Xt5aSKzPf2fpddcsrRBpgCKKN16XIJODs/
 imnni0QXMPIQZIOL2wY9Lxefd0hEb5zEUSxQJTVGJakMgBJ0IwhIEIwZyItJbBjmHa8x
 U2NpwLSwKq583TBFqb7uaauchoQrm+UpUhApnbZm9YQQaYWg1/i1Q3xcMuodCSGqXPW2
 ArE+btMLb6NPdFtSMF20KN7l7LPYEQyveeoTtmzzoxT3cqRH+h5so+X/zkjKGyTj9wF9 hA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347nr8jr50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 13:43:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0446110002A;
 Wed, 21 Oct 2020 13:43:18 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ED6AF2DC320;
 Wed, 21 Oct 2020 13:43:17 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 13:43:17 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 13:43:17 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 2/3] remoteproc: stm32: use reset for hold boot
Thread-Index: AQHWovNEO/xUMGJwSUCQE0PopgSoM6mh10oA
Date: Wed, 21 Oct 2020 11:43:17 +0000
Message-ID: <8a3dcb0e-4360-b49c-bf32-f8e6ff464f32@st.com>
References: <20201015150101.1.Ic4f6a36fa0594203b3f994a9e1d48143b420f072@changeid>
 <20201015130115.14470-1-patrick.delaunay@st.com>
In-Reply-To: <20201015130115.14470-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <ED63ED665899BC44BF4EB4673F58CE54@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_05:2020-10-20,
 2020-10-21 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
 Fabien DESSENNE <fabien.dessenne@st.com>
Subject: Re: [Uboot-stm32] [PATCH 2/3] remoteproc: stm32: use reset for hold
	boot
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

Hi Patrick

On 10/15/20 3:01 PM, Patrick Delaunay wrote:
> Use the reset function to handle the hold boot bit in RCC
> with device tree handle with MCU_HOLD_BOOT identifier.
>
> This generic reset allows to remove the two specific properties:
> - st,syscfg-holdboot
> - st,syscfg-tz
>
> This patch prepares alignment with kernel device tree.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: Fabien DESSENNE <fabien.dessenne@st.com>
> Cc: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
> ---
>
>  arch/arm/dts/stm32mp15-u-boot.dtsi |  7 +++
>  drivers/remoteproc/stm32_copro.c   | 93 ++++++++----------------------
>  2 files changed, 32 insertions(+), 68 deletions(-)
>
> diff --git a/arch/arm/dts/stm32mp15-u-boot.dtsi b/arch/arm/dts/stm32mp15-u-boot.dtsi
> index 7ec90fe4a3..d0aa5eabe5 100644
> --- a/arch/arm/dts/stm32mp15-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp15-u-boot.dtsi
> @@ -159,6 +159,13 @@
>  	u-boot,dm-pre-proper;
>  };
>  
> +/* temp = waiting kernel update */
> +&m4_rproc {
> +	resets = <&rcc MCU_R>,
> +		 <&rcc MCU_HOLD_BOOT_R>;
> +	reset-names = "mcu_rst", "hold_boot";
> +};
> +
>  &pinctrl {
>  	u-boot,dm-pre-reloc;
>  };
> diff --git a/drivers/remoteproc/stm32_copro.c b/drivers/remoteproc/stm32_copro.c
> index 33b574b1bd..da678cb329 100644
> --- a/drivers/remoteproc/stm32_copro.c
> +++ b/drivers/remoteproc/stm32_copro.c
> @@ -8,30 +8,21 @@
>  #include <errno.h>
>  #include <fdtdec.h>
>  #include <log.h>
> -#include <regmap.h>
>  #include <remoteproc.h>
>  #include <reset.h>
> -#include <syscon.h>
>  #include <asm/io.h>
>  #include <dm/device_compat.h>
>  #include <linux/err.h>
>  
> -#define RCC_GCR_HOLD_BOOT	0
> -#define RCC_GCR_RELEASE_BOOT	1
> -
>  /**
>   * struct stm32_copro_privdata - power processor private data
>   * @reset_ctl:		reset controller handle
> - * @hold_boot_regmap:	regmap for remote processor reset hold boot
> - * @hold_boot_offset:	offset of the register controlling the hold boot setting
> - * @hold_boot_mask:	bitmask of the register for the hold boot field
> + * @hold_boot:		hold boot controller handle
>   * @rsc_table_addr:	resource table address
>   */
>  struct stm32_copro_privdata {
>  	struct reset_ctl reset_ctl;
> -	struct regmap *hold_boot_regmap;
> -	uint hold_boot_offset;
> -	uint hold_boot_mask;
> +	struct reset_ctl hold_boot;
>  	ulong rsc_table_addr;
>  };
>  
> @@ -43,32 +34,19 @@ struct stm32_copro_privdata {
>  static int stm32_copro_probe(struct udevice *dev)
>  {
>  	struct stm32_copro_privdata *priv;
> -	struct regmap *regmap;
> -	const fdt32_t *cell;
> -	int len, ret;
> +	int ret;
>  
>  	priv = dev_get_priv(dev);
>  
> -	regmap = syscon_regmap_lookup_by_phandle(dev, "st,syscfg-holdboot");
> -	if (IS_ERR(regmap)) {
> -		dev_err(dev, "unable to find holdboot regmap (%ld)\n",
> -			PTR_ERR(regmap));
> -		return PTR_ERR(regmap);
> -	}
> -
> -	cell = dev_read_prop(dev, "st,syscfg-holdboot", &len);
> -	if (len < 3 * sizeof(fdt32_t)) {
> -		dev_err(dev, "holdboot offset and mask not available\n");
> -		return -EINVAL;
> +	ret = reset_get_by_name(dev, "mcu_rst", &priv->reset_ctl);
> +	if (ret) {
> +		dev_err(dev, "failed to get reset (%d)\n", ret);
> +		return ret;
>  	}
>  
> -	priv->hold_boot_regmap = regmap;
> -	priv->hold_boot_offset = fdtdec_get_number(cell + 1, 1);
> -	priv->hold_boot_mask = fdtdec_get_number(cell + 2, 1);
> -
> -	ret = reset_get_by_index(dev, 0, &priv->reset_ctl);
> +	ret = reset_get_by_name(dev, "hold_boot", &priv->hold_boot);
>  	if (ret) {
> -		dev_err(dev, "failed to get reset (%d)\n", ret);
> +		dev_err(dev, "failed to get hold boot (%d)\n", ret);
>  		return ret;
>  	}
>  
> @@ -77,35 +55,6 @@ static int stm32_copro_probe(struct udevice *dev)
>  	return 0;
>  }
>  
> -/**
> - * stm32_copro_set_hold_boot() - Hold boot bit management
> - * @dev:	corresponding STM32 remote processor device
> - * @hold:	hold boot value
> - * @return 0 if all went ok, else corresponding -ve error
> - */
> -static int stm32_copro_set_hold_boot(struct udevice *dev, bool hold)
> -{
> -	struct stm32_copro_privdata *priv;
> -	uint val;
> -	int ret;
> -
> -	priv = dev_get_priv(dev);
> -
> -	val = hold ? RCC_GCR_HOLD_BOOT : RCC_GCR_RELEASE_BOOT;
> -
> -	/*
> -	 * Note: shall run an SMC call (STM32_SMC_RCC) if platform is secured.
> -	 * To be updated when the code for this SMC service is available which
> -	 * is not the case for the time being.
> -	 */
> -	ret = regmap_update_bits(priv->hold_boot_regmap, priv->hold_boot_offset,
> -				 priv->hold_boot_mask, val);
> -	if (ret)
> -		dev_err(dev, "failed to set hold boot\n");
> -
> -	return ret;
> -}
> -
>  /**
>   * stm32_copro_device_to_virt() - Convert device address to virtual address
>   * @dev:	corresponding STM32 remote processor device
> @@ -149,9 +98,11 @@ static int stm32_copro_load(struct udevice *dev, ulong addr, ulong size)
>  
>  	priv = dev_get_priv(dev);
>  
> -	ret = stm32_copro_set_hold_boot(dev, true);
> -	if (ret)
> +	ret = reset_assert(&priv->hold_boot);
> +	if (ret) {
> +		dev_err(dev, "Unable to assert hold boot (ret=%d)\n", ret);
>  		return ret;
> +	}
>  
>  	ret = reset_assert(&priv->reset_ctl);
>  	if (ret) {
> @@ -180,16 +131,20 @@ static int stm32_copro_start(struct udevice *dev)
>  
>  	priv = dev_get_priv(dev);
>  
> -	/* move hold boot from true to false start the copro */
> -	ret = stm32_copro_set_hold_boot(dev, false);
> -	if (ret)
> +	ret = reset_deassert(&priv->hold_boot);
> +	if (ret) {
> +		dev_err(dev, "Unable to deassert hold boot (ret=%d)\n", ret);
>  		return ret;
> +	}
>  
>  	/*
>  	 * Once copro running, reset hold boot flag to avoid copro
>  	 * rebooting autonomously
>  	 */
> -	ret = stm32_copro_set_hold_boot(dev, true);
> +	ret = reset_assert(&priv->hold_boot);
> +	if (ret)
> +		dev_err(dev, "Unable to assert hold boot (ret=%d)\n", ret);
> +
>  	writel(ret ? TAMP_COPRO_STATE_OFF : TAMP_COPRO_STATE_CRUN,
>  	       TAMP_COPRO_STATE);
>  	if (!ret)
> @@ -211,9 +166,11 @@ static int stm32_copro_reset(struct udevice *dev)
>  
>  	priv = dev_get_priv(dev);
>  
> -	ret = stm32_copro_set_hold_boot(dev, true);
> -	if (ret)
> +	ret = reset_assert(&priv->hold_boot);
> +	if (ret) {
> +		dev_err(dev, "Unable to assert hold boot (ret=%d)\n", ret);
>  		return ret;
> +	}
>  
>  	ret = reset_assert(&priv->reset_ctl);
>  	if (ret) {

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
