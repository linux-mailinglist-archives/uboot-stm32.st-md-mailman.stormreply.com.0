Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AA150B210
	for <lists+uboot-stm32@lfdr.de>; Fri, 22 Apr 2022 09:53:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 510E2C60496;
	Fri, 22 Apr 2022 07:53:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1DC4C60492
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 07:53:39 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23M2tbQe031529;
 Fri, 22 Apr 2022 09:53:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=PvzrUoj9aZlHGaowcBCIqYG/cJSEpfR2zPO45+4hwJo=;
 b=RvwBl3DBV4abgJK9Kz6YbKAFjYBQYyfk0UEwRwLh0VYmWaB55cwjJJc+JH+WG9xFE9+Y
 7TDRYodwBKBLpj+aH+4P9ao1NLyavEICP8mxb3dWHhG7n8Qgcn9CbF/NCqj11cReY+xq
 F1Iatq5OSEUiLorTDL+RaRL0f93vpLiGpb95DfBZYuubiai8oMwzjLNgr06JZ8MicQcm
 i4RA4BY6oUtJqnk2EolNCoIYwj8qhi1K5BF2Yn1uwEUzi0A7zSjdeUhmjGVk5Pjux475
 80mAW3/gsBeXUeqTWIAkipFQkm8pSpPQkTlPVeZw4SW2WUAkXxHYPjqm9pde/0IdRTuV hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ffpqe7k1j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Apr 2022 09:53:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3C5C810002A;
 Fri, 22 Apr 2022 09:53:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3519921685B;
 Fri, 22 Apr 2022 09:53:38 +0200 (CEST)
Received: from [10.201.21.201] (10.75.127.46) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 22 Apr
 2022 09:53:37 +0200
Message-ID: <4bd6219c-21f8-a8ed-184a-a07a160bac39@foss.st.com>
Date: Fri, 22 Apr 2022 09:53:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Yannick Fertre <yannick.fertre@foss.st.com>, <u-boot@lists.denx.de>
References: <20220406084135.292641-1-yannick.fertre@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220406084135.292641-1-yannick.fertre@foss.st.com>
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-22_02,2022-04-21_01,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] video: stm32: stm32_ltdc: support several
 hardware versions
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

Hi Yannick


On 4/6/22 10:41, Yannick Fertre wrote:
> Register mapping & pixel formats depend on version of ltdc
> display controller.
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> ---
> 
>  drivers/video/stm32/stm32_ltdc.c | 245 +++++++++++++++++++++++++++----
>  1 file changed, 216 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/video/stm32/stm32_ltdc.c b/drivers/video/stm32/stm32_ltdc.c
> index e741e74739..60bfd2390d 100644
> --- a/drivers/video/stm32/stm32_ltdc.c
> +++ b/drivers/video/stm32/stm32_ltdc.c
> @@ -25,8 +25,114 @@ struct stm32_ltdc_priv {
>  	void __iomem *regs;
>  	enum video_log2_bpp l2bpp;
>  	u32 bg_col_argb;
> +	const u32 *layer_regs;
> +	const u32 *pix_fmt_hw;
>  	u32 crop_x, crop_y, crop_w, crop_h;
>  	u32 alpha;
> +	u32 hw_version;
> +};
> +
> +/* Layer register offsets */
> +static const u32 layer_regs_a0[] = {
> +	0x80,	/* L1 configuration 0 */
> +	0x00,	/* not available */
> +	0x00,	/* not available */
> +	0x84,	/* L1 control register */
> +	0x88,	/* L1 window horizontal position configuration */
> +	0x8c,	/* L1 window vertical position configuration */
> +	0x90,	/* L1 color keying configuration */
> +	0x94,	/* L1 pixel format configuration */
> +	0x98,	/* L1 constant alpha configuration */
> +	0x9c,	/* L1 default color configuration */
> +	0xa0,	/* L1 blending factors configuration */
> +	0x00,	/* not available */
> +	0x00,	/* not available */
> +	0xac,	/* L1 color frame buffer address */
> +	0xb0,	/* L1 color frame buffer length */
> +	0xb4,	/* L1 color frame buffer line number */
> +	0x00,	/* not available */
> +	0x00,	/* not available */
> +	0x00,	/* not available */
> +	0x00,	/* not available */
> +	0xc4,	/* L1 CLUT write */
> +	0x00,	/* not available */
> +	0x00,	/* not available */
> +	0x00,	/* not available */
> +	0x00,	/* not available */
> +	0x00,	/* not available */
> +	0x00,	/* not available */
> +	0x00,	/* not available */
> +	0x00,	/* not available */
> +	0x00,	/* not available */
> +	0x00	/* not available */
> +};
> +
> +static const u32 layer_regs_a1[] = {
> +	0x80,	/* L1 configuration 0 */
> +	0x84,	/* L1 configuration 1 */
> +	0x00,	/* L1 reload control */
> +	0x88,	/* L1 control register */
> +	0x8c,	/* L1 window horizontal position configuration */
> +	0x90,	/* L1 window vertical position configuration */
> +	0x94,	/* L1 color keying configuration */
> +	0x98,	/* L1 pixel format configuration */
> +	0x9c,	/* L1 constant alpha configuration */
> +	0xa0,	/* L1 default color configuration */
> +	0xa4,	/* L1 blending factors configuration */
> +	0xa8,	/* L1 burst length configuration */
> +	0x00,	/* not available */
> +	0xac,	/* L1 color frame buffer address */
> +	0xb0,	/* L1 color frame buffer length */
> +	0xb4,	/* L1 color frame buffer line number */
> +	0xb8,	/* L1 auxiliary frame buffer address 0 */
> +	0xbc,	/* L1 auxiliary frame buffer address 1 */
> +	0xc0,	/* L1 auxiliary frame buffer length */
> +	0xc4,	/* L1 auxiliary frame buffer line number */
> +	0xc8,	/* L1 CLUT write */
> +	0x00,	/* not available */
> +	0x00,	/* not available */
> +	0x00,	/* not available */
> +	0x00,	/* not available */
> +	0x00,	/* not available */
> +	0x00,	/* not available */
> +	0x00,	/* not available */
> +	0x00,	/* not available */
> +	0x00,	/* not available */
> +	0x00	/* not available */
> +};
> +
> +static const u32 layer_regs_a2[] = {
> +	0x100,	/* L1 configuration 0 */
> +	0x104,	/* L1 configuration 1 */
> +	0x108,	/* L1 reload control */
> +	0x10c,	/* L1 control register */
> +	0x110,	/* L1 window horizontal position configuration */
> +	0x114,	/* L1 window vertical position configuration */
> +	0x118,	/* L1 color keying configuration */
> +	0x11c,	/* L1 pixel format configuration */
> +	0x120,	/* L1 constant alpha configuration */
> +	0x124,	/* L1 default color configuration */
> +	0x128,	/* L1 blending factors configuration */
> +	0x12c,	/* L1 burst length configuration */
> +	0x130,	/* L1 planar configuration */
> +	0x134,	/* L1 color frame buffer address */
> +	0x138,	/* L1 color frame buffer length */
> +	0x13c,	/* L1 color frame buffer line number */
> +	0x140,	/* L1 auxiliary frame buffer address 0 */
> +	0x144,	/* L1 auxiliary frame buffer address 1 */
> +	0x148,	/* L1 auxiliary frame buffer length */
> +	0x14c,	/* L1 auxiliary frame buffer line number */
> +	0x150,	/* L1 CLUT write */
> +	0x154,	/* not available */
> +	0x158,	/* not available */
> +	0x15c,	/* not available */
> +	0x160,	/* not available */
> +	0x164,	/* not available */
> +	0x168,	/* not available */
> +	0x16c,	/* L1 Conversion YCbCr RGB 0 */
> +	0x170,	/* L1 Conversion YCbCr RGB 1 */
> +	0x174,	/* L1 Flexible Pixel Format 0 */
> +	0x178	/* L1 Flexible Pixel Format 1 */
>  };
>  
>  /* LTDC main registers */
> @@ -49,26 +155,32 @@ struct stm32_ltdc_priv {
>  #define LTDC_CPSR	0x44	/* Current Position Status */
>  #define LTDC_CDSR	0x48	/* Current Display Status */
>  
> -/* LTDC layer 1 registers */
> -#define LTDC_L1LC1R	0x80	/* L1 Layer Configuration 1 */
> -#define LTDC_L1LC2R	0x84	/* L1 Layer Configuration 2 */
> -#define LTDC_L1CR	0x84	/* L1 Control */
> -#define LTDC_L1WHPCR	0x88	/* L1 Window Hor Position Config */
> -#define LTDC_L1WVPCR	0x8C	/* L1 Window Vert Position Config */
> -#define LTDC_L1CKCR	0x90	/* L1 Color Keying Configuration */
> -#define LTDC_L1PFCR	0x94	/* L1 Pixel Format Configuration */
> -#define LTDC_L1CACR	0x98	/* L1 Constant Alpha Config */
> -#define LTDC_L1DCCR	0x9C	/* L1 Default Color Configuration */
> -#define LTDC_L1BFCR	0xA0	/* L1 Blend Factors Configuration */
> -#define LTDC_L1FBBCR	0xA4	/* L1 FrameBuffer Bus Control */
> -#define LTDC_L1AFBCR	0xA8	/* L1 AuxFB Control */
> -#define LTDC_L1CFBAR	0xAC	/* L1 Color FrameBuffer Address */
> -#define LTDC_L1CFBLR	0xB0	/* L1 Color FrameBuffer Length */
> -#define LTDC_L1CFBLNR	0xB4	/* L1 Color FrameBuffer Line Nb */
> -#define LTDC_L1AFBAR	0xB8	/* L1 AuxFB Address */
> -#define LTDC_L1AFBLR	0xBC	/* L1 AuxFB Length */
> -#define LTDC_L1AFBLNR	0xC0	/* L1 AuxFB Line Number */
> -#define LTDC_L1CLUTWR	0xC4	/* L1 CLUT Write */
> +/* Layer register offsets */
> +#define LTDC_L1C0R	(priv->layer_regs[0])	/* L1 configuration 0 */
> +#define LTDC_L1C1R	(priv->layer_regs[1])	/* L1 configuration 1 */
> +#define LTDC_L1RCR	(priv->layer_regs[2])	/* L1 reload control */
> +#define LTDC_L1CR	(priv->layer_regs[3])	/* L1 control register */
> +#define LTDC_L1WHPCR	(priv->layer_regs[4])	/* L1 window horizontal position configuration */
> +#define LTDC_L1WVPCR	(priv->layer_regs[5])	/* L1 window vertical position configuration */
> +#define LTDC_L1CKCR	(priv->layer_regs[6])	/* L1 color keying configuration */
> +#define LTDC_L1PFCR	(priv->layer_regs[7])	/* L1 pixel format configuration */
> +#define LTDC_L1CACR	(priv->layer_regs[8])	/* L1 constant alpha configuration */
> +#define LTDC_L1DCCR	(priv->layer_regs[9])	/* L1 default color configuration */
> +#define LTDC_L1BFCR	(priv->layer_regs[10])	/* L1 blending factors configuration */
> +#define LTDC_L1BLCR	(priv->layer_regs[11])	/* L1 burst length configuration */
> +#define LTDC_L1PCR	(priv->layer_regs[12])	/* L1 planar configuration */
> +#define LTDC_L1CFBAR	(priv->layer_regs[13])	/* L1 color frame buffer address */
> +#define LTDC_L1CFBLR	(priv->layer_regs[14])	/* L1 color frame buffer length */
> +#define LTDC_L1CFBLNR	(priv->layer_regs[15])	/* L1 color frame buffer line number */
> +#define LTDC_L1AFBA0R	(priv->layer_regs[16])	/* L1 auxiliary frame buffer address 0 */
> +#define LTDC_L1AFBA1R	(priv->layer_regs[17])	/* L1 auxiliary frame buffer address 1 */
> +#define LTDC_L1AFBLR	(priv->layer_regs[18])	/* L1 auxiliary frame buffer length */
> +#define LTDC_L1AFBLNR	(priv->layer_regs[19])	/* L1 auxiliary frame buffer line number */
> +#define LTDC_L1CLUTWR	(priv->layer_regs[20])	/* L1 CLUT write */
> +#define LTDC_L1CYR0R	(priv->layer_regs[27])	/* L1 Conversion YCbCr RGB 0 */
> +#define LTDC_L1CYR1R	(priv->layer_regs[28])	/* L1 Conversion YCbCr RGB 1 */
> +#define LTDC_L1FPF0R	(priv->layer_regs[29])	/* L1 Flexible Pixel Format 0 */
> +#define LTDC_L1FPF1R	(priv->layer_regs[30])	/* L1 Flexible Pixel Format 1 */
>  
>  /* Bit definitions */
>  #define SSCR_VSH	GENMASK(10, 0)	/* Vertical Synchronization Height */
> @@ -144,15 +256,60 @@ struct stm32_ltdc_priv {
>  #define BF2_1PAXCA	0x007		/* 1 - (Pixel Alpha x Constant Alpha) */
>  #define BF2_1CA		0x005		/* 1 - Constant Alpha */
>  
> +#define NB_PF		8		/* Max nb of HW pixel format */
> +
> +#define HWVER_10200 0x010200
> +#define HWVER_10300 0x010300
> +#define HWVER_20101 0x020101
> +#define HWVER_40100 0x040100
> +
>  enum stm32_ltdc_pix_fmt {
> -	PF_ARGB8888 = 0,
> -	PF_RGB888,
> -	PF_RGB565,
> -	PF_ARGB1555,
> -	PF_ARGB4444,
> -	PF_L8,
> -	PF_AL44,
> -	PF_AL88
> +	PF_ARGB8888 = 0,	/* ARGB [32 bits] */
> +	PF_ABGR8888,		/* ABGR [32 bits] */
> +	PF_BGRA8888,		/* BGRA [32 bits] */
> +	PF_RGBA8888,		/* RGBA [32 bits] */
> +	PF_RGB888,		/* RGB [24 bits] */
> +	PF_BGR565,		/* RGB [16 bits] */
> +	PF_RGB565,		/* RGB [16 bits] */
> +	PF_ARGB1555,		/* ARGB A:1 bit RGB:15 bits [16 bits] */
> +	PF_ARGB4444,		/* ARGB A:4 bits R/G/B: 4 bits each [16 bits] */
> +	PF_AL44,		/* Alpha:4 bits + indexed 4 bits [8 bits] */
> +	PF_AL88,		/* Alpha:8 bits + indexed 8 bits [16 bits] */
> +	PF_L8,			/* Indexed 8 bits [8 bits] */
> +	PF_NONE
> +};
> +
> +static const enum stm32_ltdc_pix_fmt pix_fmt_a0[NB_PF] = {
> +	PF_ARGB8888,		/* 0x00 */
> +	PF_RGB888,		/* 0x01 */
> +	PF_RGB565,		/* 0x02 */
> +	PF_ARGB1555,		/* 0x03 */
> +	PF_ARGB4444,		/* 0x04 */
> +	PF_L8,			/* 0x05 */
> +	PF_AL44,		/* 0x06 */
> +	PF_AL88			/* 0x07 */
> +};
> +
> +static const enum stm32_ltdc_pix_fmt pix_fmt_a1[NB_PF] = {
> +	PF_ARGB8888,		/* 0x00 */
> +	PF_RGB888,		/* 0x01 */
> +	PF_RGB565,		/* 0x02 */
> +	PF_RGBA8888,		/* 0x03 */
> +	PF_AL44,		/* 0x04 */
> +	PF_L8,			/* 0x05 */
> +	PF_ARGB1555,		/* 0x06 */
> +	PF_ARGB4444		/* 0x07 */
> +};
> +
> +static const enum stm32_ltdc_pix_fmt pix_fmt_a2[NB_PF] = {
> +	PF_ARGB8888,		/* 0x00 */
> +	PF_ABGR8888,		/* 0x01 */
> +	PF_RGBA8888,		/* 0x02 */
> +	PF_BGRA8888,		/* 0x03 */
> +	PF_RGB565,		/* 0x04 */
> +	PF_BGR565,		/* 0x05 */
> +	PF_RGB888,		/* 0x06 */
> +	PF_NONE			/* 0x07 (flexible pixel format) */
>  };
>  
>  /* TODO add more color format support */
> @@ -306,7 +463,16 @@ static void stm32_ltdc_set_layer1(struct stm32_ltdc_priv *priv, ulong fb_addr)
>  
>  	/* Pixel format */
>  	format = stm32_ltdc_get_pixel_format(priv->l2bpp);
> -	clrsetbits_le32(regs + LTDC_L1PFCR, LXPFCR_PF, format);
> +	for (val = 0; val < NB_PF; val++)
> +		if (priv->pix_fmt_hw[val] == format)
> +			break;
> +
> +	if (val >= NB_PF) {
> +		log_err("invalid pixel format\n");
> +		return;
> +	}
> +
> +	clrsetbits_le32(regs + LTDC_L1PFCR, LXPFCR_PF, val);
>  
>  	/* Constant alpha value */
>  	clrsetbits_le32(regs + LTDC_L1CACR, LXCACR_CONSTA, priv->alpha);
> @@ -359,6 +525,27 @@ static int stm32_ltdc_probe(struct udevice *dev)
>  		return ret;
>  	}
>  
> +	priv->hw_version = readl(priv->regs + LTDC_IDR);
> +	debug("%s: LTDC hardware 0x%x\n", __func__, priv->hw_version);
> +
> +	switch (priv->hw_version) {
> +	case HWVER_10200:
> +	case HWVER_10300:
> +		priv->layer_regs = layer_regs_a0;
> +		priv->pix_fmt_hw = pix_fmt_a0;
> +		break;
> +	case HWVER_20101:
> +		priv->layer_regs = layer_regs_a1;
> +		priv->pix_fmt_hw = pix_fmt_a1;
> +		break;
> +	case HWVER_40100:
> +		priv->layer_regs = layer_regs_a2;
> +		priv->pix_fmt_hw = pix_fmt_a2;
> +		break;
> +	default:
> +		return -ENODEV;
> +	}
> +
>  	ret = uclass_first_device_err(UCLASS_PANEL, &panel);
>  	if (ret) {
>  		if (ret != -ENODEV)

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
