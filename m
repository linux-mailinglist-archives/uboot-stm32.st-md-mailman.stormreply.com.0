Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38104264949
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Sep 2020 18:04:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDAC5C3FAFE
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Sep 2020 16:04:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1042C3FAE3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 16:04:15 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08AG2vXf031426; Thu, 10 Sep 2020 18:04:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=IJnmEpBVMy8UzKmB3DgzGm3htT+BbALniWCckwyBAgw=;
 b=T7prvA/+VNNe5dxLTb8kJVz471Ikc41OcyoIDGGmgvr0NmkUoUW6hJ1AhLM8yq3WovMb
 dz3oG4A7rfEyr2/t6DCpDrFG3B8qD5IB5uPinOHh3vt6NVh0x29i0aOXJ9HYjirBoXEz
 h3rgN9wi80z1wQLf4VxPRg1Q16WBb29L62Bu6VaxAHdQU1Gb8xszCNHs0Wqiy3LGQKoO
 8BY97Mactcic3IWes02dWE2haWAVxhw9c9PYPtZzJxCTZjLdAEWgr2rcZs0gtXClZfXr
 QUBUj7M8S/LOVRuseUxAY/SoaycE0pV4Uky9VR9ij+KO1PeYWhlJFoJR/D0k9mz0kkXF 5Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33c051m525-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Sep 2020 18:04:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B3C8B10002A;
 Thu, 10 Sep 2020 18:04:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A63462B8A29;
 Thu, 10 Sep 2020 18:04:11 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 10 Sep
 2020 18:04:11 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 10 Sep 2020 18:04:11 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, Yann GAUTIER
 <yann.gautier@st.com>
Thread-Topic: [PATCH] mmc: stm32_sdmmc2: Use mmc_of_parse() to read host
 capabilities
Thread-Index: AQHWhvPBpA6CLj++jEKGeAsJCXckZ6lh6s/Q
Date: Thu, 10 Sep 2020 16:04:11 +0000
Message-ID: <f48f0991628c4dda87089f1464da65d5@SFHDAG6NODE3.st.com>
References: <20200909215402.366561-1-mr.nuke.me@gmail.com>
In-Reply-To: <20200909215402.366561-1-mr.nuke.me@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-10_04:2020-09-10,
 2020-09-10 signatures=0
Cc: "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Peng Fan <peng.fan@nxp.com>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH] mmc: stm32_sdmmc2: Use mmc_of_parse() to
 read host capabilities
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

Hi Alexandru,

> Sent: mercredi 9 septembre 2020 23:54
> To: uboot-stm32@st-md-mailman.stormreply.com
> Cc: Alexandru Gagniuc <mr.nuke.me@gmail.com>; Patrick DELAUNAY
> <patrick.delaunay@st.com>; Patrice CHOTARD <patrice.chotard@st.com>; Peng
> Fan <peng.fan@nxp.com>; u-boot@lists.denx.de
> Subject: [PATCH] mmc: stm32_sdmmc2: Use mmc_of_parse() to read host
> capabilities
> Importance: High
> 
> mmc_of_parse() can populate the 'f_max' and 'host_caps' fields of struct
> mmc_config from devicetree.
> The same logic is duplicated in stm32_sdmmc2_probe(). Use mmc_of_parse(),
> which is more generic.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---

Thanks for the patch, I miss the addition of this new API.

>  drivers/mmc/stm32_sdmmc2.c | 18 ++----------------
>  1 file changed, 2 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c index
> 6d50356217..77871d5afc 100644
> --- a/drivers/mmc/stm32_sdmmc2.c
> +++ b/drivers/mmc/stm32_sdmmc2.c
> @@ -676,27 +676,13 @@ static int stm32_sdmmc2_probe(struct udevice *dev)
>  			     GPIOD_IS_IN);
> 
>  	cfg->f_min = 400000;
> -	cfg->f_max = dev_read_u32_default(dev, "max-frequency", 52000000);
>  	cfg->voltages = MMC_VDD_32_33 | MMC_VDD_33_34 |
> MMC_VDD_165_195;
>  	cfg->b_max = CONFIG_SYS_MMC_MAX_BLK_COUNT;
>  	cfg->name = "STM32 SD/MMC";
> 
>  	cfg->host_caps = 0;
> -	if (cfg->f_max > 25000000)
> -		cfg->host_caps |= MMC_MODE_HS_52MHz | MMC_MODE_HS;
> -
> -	switch (dev_read_u32_default(dev, "bus-width", 1)) {
> -	case 8:
> -		cfg->host_caps |= MMC_MODE_8BIT;
> -		/* fall through */
> -	case 4:
> -		cfg->host_caps |= MMC_MODE_4BIT;
> -		break;
> -	case 1:
> -		break;
> -	default:
> -		pr_err("invalid \"bus-width\" property, force to 1\n");
> -	}
> +	cfg->f_max = 52000000;
> +	mmc_of_parse(dev, cfg);

Result of mmc_of_parse is not tested ?

I proposed:

+	ret = mmc_of_parse(dev, cfg);
+	if (ret)
+		return ret;

> 
>  	upriv->mmc = &plat->mmc;
> 
> --
> 2.25.4

I test this patch with a trace in stm32_sdmmc2_probe on STM32MP157C-EV1

Before the patch :
cfg->host_caps = 0x2000000e (SD card)
cfg->host_caps = 0x6000000e (eMMC)

After the patch:
cfg->host_caps = 0x300001e6 (SD card)
cfg->host_caps = 0x70004006 (eMMC)


I see 2 problem here :

1/ MMC_MODE_HS_52MHz = MMC_CAP(MMC_HS_52) is removed
    and the eMMC on EV1 use only at 26MHz instead 52MHz before the patch

	Mode: MMC High Speed (52MHz)
	=>
	Mode: MMC High Speed (26MHz)

The "cap-mmc-highspeed" is used in Linux for MMC HS at 26MHz or 52MHz

./Documentation/devicetree/bindings/mmc/mmc-controller.yaml:122: 
cap-mmc-highspeed:
    $ref: /schemas/types.yaml#/definitions/flag
    description:
      MMC high-speed timing is supported.

And in Linux mmc/core/mmc.c
	static void mmc_select_card_type(struct mmc_card *card)
	{
	.....

	if (caps & MMC_CAP_MMC_HIGHSPEED &&
	    card_type & EXT_CSD_CARD_TYPE_HS_26) {
		hs_max_dtr = MMC_HIGH_26_MAX_DTR;
		avail_type |= EXT_CSD_CARD_TYPE_HS_26;
	}

	if (caps & MMC_CAP_MMC_HIGHSPEED &&
	    card_type & EXT_CSD_CARD_TYPE_HS_52) {
		hs_max_dtr = MMC_HIGH_52_MAX_DTR;
		avail_type |= EXT_CSD_CARD_TYPE_HS_52;
	}
	....

include/linux/mmc/mmc.h:347:
	#define EXT_CSD_CARD_TYPE_HS_26	(1<<0)	/* Card can run at 26MHz */
	#define EXT_CSD_CARD_TYPE_HS_52	(1<<1)	/* Card can run at 52MHz */

I think that it is a issue U-Boot, in mmc uclass in mmc_of_parse():

	if (dev_read_bool(dev, "cap-mmc-highspeed"))
-		cfg->host_caps |= MMC_CAP(MMC_HS);
+		cfg->host_caps |= MMC_CAP(MMC_HS) | MMC_CAP(MMC_HS_52);

In U-Boot this capability is splitted in 2 bits = one for 26MHz one for 52MHz
And  for card side it is managed on card side by mmc_get_capabilities()

include/mmc.h:254:
	#define EXT_CSD_CARD_TYPE_26	(1 << 0)	/* Card can run at 26MHz */
	#define EXT_CSD_CARD_TYPE_52	(1 << 1)	/* Card can run at 52MHz */

A other solution is to only impact the sdmmc driver..... 
and to activate 52MHZ mode support is frequency is >= 26MHz

	cfg->f_max = 52000000;
	ret = mmc_of_parse(dev, cfg);
	if (ret)
		return ret;

	if ((cfg->host_caps & MMC_HS) && 
	    cfg->f_max > 26000000)
		cfg->host_caps |= MMC_HS_52;

but I prefer the previous generic solution in u-class.


2) some host caps can be added in device tree (they are supported by SOC and by Linux driver)
    but they are not supported by U-Boot driver, for example:

#define MMC_MODE_DDR_52MHz	MMC_CAP(MMC_DDR_52)
#define MMC_MODE_HS200		MMC_CAP(MMC_HS_200)
#define MMC_MODE_HS400		MMC_CAP(MMC_HS_400)
#define MMC_MODE_HS400_ES	MMC_CAP(MMC_HS_400_ES)

MMC_CAP(UHS_SDR12)
MMC_CAP(UHS_SDR25) 
MMC_CAP(UHS_SDR50)
MMC_CAP(UHS_SDR104)
MMC_CAP(UHS_DDR50)

I afraid (I don't sure) that this added caps change the mmc core behavior in U-Boot =
U-Boot try to select  the high speed mode even if not supported by driver....

The host_caps bitfield should be limited by the supported features in the driver  (or remove the unsupported features)

#define SDMMC_SUPPORTED_CAPS (MMC_MODE_1BIT | MMC_MODE_4BIT | MMC_MODE_8BIT | MMC_CAP_CD_ACTIVE_HIGH | MMC_CAP_NEEDS_POLL |  MMC_CAP_NONREMOVABLE | MMC_MODE_HS | MMC_MODE_HS_52MHz)
or
#define SDMMC_UNSUPPORTED_CAPS (MMC_MODE_DDR_52MHz | MMC_MODE_HS200 | MMC_MODE_HS400 | MMC_MODE_HS400_ES | UHS_CAPS)
 
	cfg->f_max = 52000000;
	ret = mmc_of_parse(dev, cfg);
	if (ret)
		return ret;

	cfg->host_caps &= SDMMC_SUPPORTED_CAPS;
or 
	cfg->host_caps |= ~SDMMC_UNSUPPORTED_CAPS;


Best Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
