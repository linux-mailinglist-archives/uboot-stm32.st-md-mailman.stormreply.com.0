Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E44D814ACE
	for <lists+uboot-stm32@lfdr.de>; Fri, 15 Dec 2023 15:43:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E76DDC6DD6D;
	Fri, 15 Dec 2023 14:43:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C19CC6A5EA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 14:42:59 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3BF9dlOZ028436; Fri, 15 Dec 2023 15:42:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=b/C98XGIjDqbWuV1sdJNg197MkdvLee3eZPEnouT9no=; b=UR
 StHT58oziFqbJTF9/D6Vm3JGpimHC7P86KTcymv4iRuHcX13zieHLjW5g5q+oFRT
 Mc/mh1Lm3rHw9ZdFrhVtFuuYbKhdUoGjNXgdQ6g7FG0wLawsRxqcEaR0WVSZA8Hj
 J0uttvEmY5na5jk4i5+j97brignJ7ClSMOvM/9RRkxFYfWf2RY94QzxE0uu+NFG3
 Zwcmc0azYb/9nUwh5HP7Aig3d1rDn1tng1fLu2vIm6CzAuLBauent8HKTwasEMB8
 pirqSOtkWbEf09Xq5WCBRC0tC0IPD5ljC7XjiOrkLMc/Zny6mgllZtrP2qK+tqhr
 0DNWMBAhd8qFeclx9afg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uvehmtruh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Dec 2023 15:42:57 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1171C100052;
 Fri, 15 Dec 2023 15:42:57 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 07586228A27;
 Fri, 15 Dec 2023 15:42:57 +0100 (CET)
Received: from [10.252.23.141] (10.252.23.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Dec
 2023 15:42:56 +0100
Message-ID: <9a547ba0-32df-4c47-844a-65f8177653ae@foss.st.com>
Date: Fri, 15 Dec 2023 15:42:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20231211220643.1073606-1-dario.binacchi@amarulasolutions.com>
 <20231211220643.1073606-6-dario.binacchi@amarulasolutions.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20231211220643.1073606-6-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.252.23.141]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-15_08,2023-12-14_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Anatolij Gustschin <agust@denx.de>,
 linux-amarula@amarulasolutions.com
Subject: Re: [Uboot-stm32] [PATCH v3 5/6] board: stm32f469-disco: add
	support to display
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



On 12/11/23 23:05, Dario Binacchi wrote:
> Add support to Orise Tech OTM8009A display on stm32f469-disco board.
> 
> It was necessary to retrieve the framebuffer address from the device tree
> because the address returned by the video-uclass driver pointed to a memory
> area that was not usable.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
> Changes in v3:
> - Replace SDRAM_SIZE constant with global data gd->ram_size.
> 
> Changes in v2:
> - Add DRAM_SIZE macro.
> - Fix frame buffer allocation function so that it is backward compatible
>   with boards other than the one it was introduced for (i. e. stm32f469-disco).
>   Tested on stm32f469-disco and stm32mp157f-dk2 boards.
> 
>  configs/stm32f469-discovery_defconfig | 13 +++++++++++
>  drivers/video/stm32/stm32_ltdc.c      | 31 +++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/configs/stm32f469-discovery_defconfig b/configs/stm32f469-discovery_defconfig
> index 21c5498466cd..85e795e83e7d 100644
> --- a/configs/stm32f469-discovery_defconfig
> +++ b/configs/stm32f469-discovery_defconfig
> @@ -21,6 +21,7 @@ CONFIG_CMD_GPT=y
>  # CONFIG_RANDOM_UUID is not set
>  CONFIG_CMD_MMC=y
>  # CONFIG_CMD_SETEXPR is not set
> +CONFIG_CMD_BMP=y
>  CONFIG_CMD_CACHE=y
>  CONFIG_CMD_TIMER=y
>  # CONFIG_ISO_PARTITION is not set
> @@ -40,3 +41,15 @@ CONFIG_SPI_FLASH_STMICRO=y
>  CONFIG_SPI=y
>  CONFIG_DM_SPI=y
>  CONFIG_STM32_QSPI=y
> +CONFIG_VIDEO=y
> +CONFIG_BACKLIGHT_GPIO=y
> +CONFIG_VIDEO_LCD_ORISETECH_OTM8009A=y
> +CONFIG_VIDEO_STM32=y
> +CONFIG_VIDEO_STM32_DSI=y
> +CONFIG_VIDEO_STM32_MAX_XRES=480
> +CONFIG_VIDEO_STM32_MAX_YRES=800
> +CONFIG_BMP_16BPP=y
> +CONFIG_BMP_24BPP=y
> +CONFIG_BMP_32BPP=y
> +CONFIG_DM_REGULATOR=y
> +CONFIG_DM_REGULATOR_FIXED=y
> diff --git a/drivers/video/stm32/stm32_ltdc.c b/drivers/video/stm32/stm32_ltdc.c
> index 6fd90e33919d..4f60ba8ebeeb 100644
> --- a/drivers/video/stm32/stm32_ltdc.c
> +++ b/drivers/video/stm32/stm32_ltdc.c
> @@ -495,6 +495,33 @@ static void stm32_ltdc_set_layer1(struct stm32_ltdc_priv *priv, ulong fb_addr)
>  	setbits_le32(priv->regs + LTDC_L1CR, LXCR_LEN);
>  }
>  
> +#if IS_ENABLED(CONFIG_TARGET_STM32F469_DISCOVERY)
> +static int stm32_ltdc_alloc_fb(struct udevice *dev)
> +{
> +	u32 sdram_size = gd->ram_size;
> +	struct video_uc_plat *uc_plat = dev_get_uclass_plat(dev);
> +	phys_addr_t cpu;
> +	dma_addr_t bus;
> +	u64 dma_size;
> +	int ret;
> +
> +	ret = dev_get_dma_range(dev, &cpu, &bus, &dma_size);
> +	if (ret) {
> +		dev_err(dev, "failed to get dma address\n");
> +		return ret;
> +	}
> +
> +	uc_plat->base = bus + sdram_size - ALIGN(uc_plat->size, uc_plat->align);
> +	return 0;
> +}
> +#else
> +static inline int stm32_ltdc_alloc_fb(struct udevice *dev)
> +{
> +	/* Delegate framebuffer allocation to video-uclass */
> +	return 0;
> +}
> +#endif
> +
>  static int stm32_ltdc_probe(struct udevice *dev)
>  {
>  	struct video_uc_plat *uc_plat = dev_get_uclass_plat(dev);
> @@ -605,6 +632,10 @@ static int stm32_ltdc_probe(struct udevice *dev)
>  	priv->crop_h = timings.vactive.typ;
>  	priv->alpha = 0xFF;
>  
> +	ret = stm32_ltdc_alloc_fb(dev);
> +	if (ret)
> +		return ret;
> +
>  	dev_dbg(dev, "%dx%d %dbpp frame buffer at 0x%lx\n",
>  		timings.hactive.typ, timings.vactive.typ,
>  		VNBITS(priv->l2bpp), uc_plat->base);
Applied to u-boot-stm32/next

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
