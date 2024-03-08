Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D7E87634F
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Mar 2024 12:27:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65CCEC6C83D;
	Fri,  8 Mar 2024 11:27:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9CC2C6B46B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Mar 2024 11:27:15 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 428A1W1l004218; Fri, 8 Mar 2024 12:27:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=i1p3npr10+X/DmPw0fUMQyy1FHn+C1D9lkX9VyKvjLQ=; b=UT
 RM5Uue2Jda4FqNiTIEvmTkPUgXxeGHNG9a8NYldMDnN7l6QQVV3OwXzA+ue7nGLL
 AvPnk+DaZ8XnDeqoBvUQBpSsrQfn9O7KyGp78mvT6K/eYRp9a0DJmicmN1NGQkd3
 8MfGfuFxAyywHtmM/cGsKSGf2BS+NUNGmneC5VKBKmz3xu8LxbtsQqgfYFMLcL+F
 dCiEXzIafAtlGef2KVGIqvKg4E66CIvXGN7J5ibZULMuQeyPS/Chp20GbC6QuieK
 +bHgd4qWQ0oChGzwbifxj/vvsuELBueoSCShl03z4ILDB1/27vwHTHAuCwGSF94W
 14lgvmGykPM5i6c4ukiQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wmej5jkwq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Mar 2024 12:27:04 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7CC4B4002D;
 Fri,  8 Mar 2024 12:26:59 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0F4E7244DBF;
 Fri,  8 Mar 2024 12:26:17 +0100 (CET)
Received: from [10.252.7.115] (10.252.7.115) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Mar
 2024 12:26:16 +0100
Message-ID: <7c1a912d-6d0b-4748-a605-b66a55b46b4c@foss.st.com>
Date: Fri, 8 Mar 2024 12:26:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>, <u-boot@lists.denx.de>
References: <20240306095406.314825-1-christophe.kerello@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240306095406.314825-1-christophe.kerello@foss.st.com>
X-Originating-IP: [10.252.7.115]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-08_08,2024-03-06_01,2023-05-22_02
Cc: Tom Rini <trini@konsulko.com>, Caleb Connolly <caleb.connolly@linaro.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Simon Glass <sjg@chromium.org>, Eugen Hristev <eugen.hristev@collabora.com>,
 Stefan Bosch <stefan_b@posteo.net>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Igor Prusov <ivprusov@salutedevices.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH] mtd: rawnand: stm32_fmc2: add MP25 support
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



On 3/6/24 10:54, Christophe Kerello wrote:
> FMC2 IP supports up to 4 chip select. On MP1 SoC, only 2 of them are
> available when on MP25 SoC, the 4 chip select are available.
> 
> Let's use a platform data structure for parameters that will differ.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> ---
> 
>  drivers/mtd/nand/raw/stm32_fmc2_nand.c | 47 ++++++++++++++++++++++----
>  1 file changed, 40 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> index 3528824575b..d284b8cbb12 100644
> --- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> +++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> @@ -34,7 +34,7 @@
>  #define FMC2_RB_DELAY_US		30
>  
>  /* Max chip enable */
> -#define FMC2_MAX_CE			2
> +#define FMC2_MAX_CE			4
>  
>  /* Timings */
>  #define FMC2_THIZ			1
> @@ -160,6 +160,11 @@ static inline struct stm32_fmc2_nand *to_fmc2_nand(struct nand_chip *chip)
>  	return container_of(chip, struct stm32_fmc2_nand, chip);
>  }
>  
> +struct stm32_fmc2_nfc_data {
> +	int max_ncs;
> +	struct udevice *(*get_cdev)(struct udevice *dev);
> +};
> +
>  struct stm32_fmc2_nfc {
>  	struct nand_hw_control base;
>  	struct stm32_fmc2_nand nand;
> @@ -169,6 +174,7 @@ struct stm32_fmc2_nfc {
>  	fdt_addr_t cmd_base[FMC2_MAX_CE];
>  	fdt_addr_t addr_base[FMC2_MAX_CE];
>  	struct clk clk;
> +	const struct stm32_fmc2_nfc_data *data;
>  
>  	u8 cs_assigned;
>  	int cs_sel;
> @@ -815,7 +821,7 @@ static int stm32_fmc2_nfc_parse_child(struct stm32_fmc2_nfc *nfc, ofnode node)
>  	}
>  
>  	for (i = 0; i < nand->ncs; i++) {
> -		if (cs[i] >= FMC2_MAX_CE) {
> +		if (cs[i] >= nfc->data->max_ncs) {
>  			log_err("Invalid reg value: %d\n", nand->cs_used[i]);
>  			return -EINVAL;
>  		}
> @@ -906,10 +912,18 @@ static int stm32_fmc2_nfc_probe(struct udevice *dev)
>  	spin_lock_init(&nfc->controller.lock);
>  	init_waitqueue_head(&nfc->controller.wq);
>  
> -	cdev = stm32_fmc2_nfc_get_cdev(dev);
> -	if (!cdev)
> +	nfc->data = (void *)dev_get_driver_data(dev);
> +	if (!nfc->data)
>  		return -EINVAL;
>  
> +	if (nfc->data->get_cdev) {
> +		cdev = nfc->data->get_cdev(dev);
> +		if (!cdev)
> +			return -EINVAL;
> +	} else {
> +		cdev = dev->parent;
> +	}
> +
>  	ret = stm32_fmc2_nfc_parse_dt(dev, nfc);
>  	if (ret)
>  		return ret;
> @@ -921,7 +935,7 @@ static int stm32_fmc2_nfc_probe(struct udevice *dev)
>  	if (dev == cdev)
>  		start_region = 1;
>  
> -	for (chip_cs = 0, mem_region = start_region; chip_cs < FMC2_MAX_CE;
> +	for (chip_cs = 0, mem_region = start_region; chip_cs < nfc->data->max_ncs;
>  	     chip_cs++, mem_region += 3) {
>  		if (!(nfc->cs_assigned & BIT(chip_cs)))
>  			continue;
> @@ -1033,9 +1047,28 @@ static int stm32_fmc2_nfc_probe(struct udevice *dev)
>  	return nand_register(0, mtd);
>  }
>  
> +static const struct stm32_fmc2_nfc_data stm32_fmc2_nfc_mp1_data = {
> +	.max_ncs = 2,
> +	.get_cdev = stm32_fmc2_nfc_get_cdev,
> +};
> +
> +static const struct stm32_fmc2_nfc_data stm32_fmc2_nfc_mp25_data = {
> +	.max_ncs = 4,
> +};
> +
>  static const struct udevice_id stm32_fmc2_nfc_match[] = {
> -	{ .compatible = "st,stm32mp15-fmc2" },
> -	{ .compatible = "st,stm32mp1-fmc2-nfc" },
> +	{
> +		.compatible = "st,stm32mp15-fmc2",
> +		.data = (ulong)&stm32_fmc2_nfc_mp1_data,
> +	},
> +	{
> +		.compatible = "st,stm32mp1-fmc2-nfc",
> +		.data = (ulong)&stm32_fmc2_nfc_mp1_data,
> +	},
> +	{
> +		.compatible = "st,stm32mp25-fmc2-nfc",
> +		.data = (ulong)&stm32_fmc2_nfc_mp25_data,
> +	},
>  	{ /* Sentinel */ }
>  };
>  
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
