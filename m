Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E7DADAA9D
	for <lists+uboot-stm32@lfdr.de>; Mon, 16 Jun 2025 10:25:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00003C36B17;
	Mon, 16 Jun 2025 08:25:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F40AC36B14
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jun 2025 08:25:28 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G6OcOY001568;
 Mon, 16 Jun 2025 10:24:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 31E7WwoKvt16r8MYMjn0tDkbO+yHBZiyNofhnTJlYOU=; b=nAjnYBsL/UC7RvHQ
 +XJSdxkULPGv2cTDz5qoT0LQeFlpYRantEiP1M5qXvbkUeTZRerT0OrkkuTJ6/4m
 Od3Vp6Ob91SnB/1kmyGJvWH8//ta9a5fiWHSIpebWxyTVdmPv1o/wJad+JAmobnK
 aZilkW6X0VuKujaIWxh1VdoLlBKBsWyiI3ycnK3Fw61c73diVqBAAMq986YbgEZF
 QOi699WmkiE/kZaDnz2Yb1c+E6jTpfWr453u8Pjl1wZTRmxVgxn4YcZeyN14/FUt
 8EvWEYQdXARDZh2WL92cbcB/74xHhBAFFwd77t4AhAfyVlmH8u+aY+MOi7TzBQfY
 RujDzw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4790e1yhm6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jun 2025 10:24:34 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DF3EE4004D;
 Mon, 16 Jun 2025 10:22:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 303FF5D40C4;
 Mon, 16 Jun 2025 10:20:51 +0200 (CEST)
Received: from [10.48.86.182] (10.48.86.182) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 10:20:49 +0200
Message-ID: <dedd6356-8a35-468d-b144-f80db627cd08@foss.st.com>
Date: Mon, 16 Jun 2025 10:20:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: E Shattow <e@freeshell.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
 Tom Rini <trini@konsulko.com>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Lukasz Majewski
 <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Simon Goldschmidt
 <simon.k.r.goldschmidt@gmail.com>, Tien Fong Chee
 <tien.fong.chee@altera.com>, Tingting Meng <tingting.meng@altera.com>, Peng
 Fan <peng.fan@nxp.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Michal Simek <michal.simek@amd.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>, Joe Hershberger
 <joe.hershberger@ni.com>, Ramon Fried <rfried.dev@gmail.com>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 Simon Glass <sjg@chromium.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Kever Yang <kever.yang@rock-chips.com>, Anatolij Gustschin <agust@denx.de>
References: <20250606224558.1117422-1-e@freeshell.de>
 <20250606224558.1117422-4-e@freeshell.de>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20250606224558.1117422-4-e@freeshell.de>
X-Originating-IP: [10.48.86.182]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_03,2025-06-13_01,2025-03-28_01
Cc: uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH v1 3/7] drivers: use lowercase hex prefix
	style
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 6/7/25 00:44, E Shattow wrote:
> Use consistent lowercase hex prefix style in drivers/*
>
> Does not change hex prefix case in allcaps uppercase style error messages
>
> Signed-off-by: E Shattow <e@freeshell.de>
> ---
>   drivers/ata/dwc_ahsata_priv.h             |  4 +-
>   drivers/clk/renesas/r8a774a1-cpg-mssr.c   |  2 +-
>   drivers/clk/stm32/clk-stm32mp1.c          |  2 +-
>   drivers/ddr/altera/iossm_mailbox.c        |  2 +-
>   drivers/mmc/sdhci-cadence6.c              |  2 +-
>   drivers/mmc/zynq_sdhci.c                  |  2 +-
>   drivers/mtd/nand/raw/lpc32xx_nand_mlc.c   |  4 +-
>   drivers/net/fsl-mc/mc.c                   |  2 +-
>   drivers/net/phy/ca_phy.c                  |  2 +-
>   drivers/phy/rockchip/phy-rockchip-typec.c |  2 +-
>   drivers/power/regulator/act8846.c         |  4 +-
>   drivers/ram/k3-ddrss/k3-ddrss.c           |  2 +-
>   drivers/ram/octeon/octeon3_lmc.c          |  2 +-
>   drivers/sound/max98088.h                  | 50 +++++++++++------------
>   drivers/sound/max98095.h                  |  2 +-
>   drivers/video/bridge/dp501.c              |  2 +-
>   drivers/video/hx8238d.c                   |  2 +-
>   drivers/video/zynqmp/zynqmp_dpsub.h       |  2 +-
>   18 files changed, 45 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/ata/dwc_ahsata_priv.h b/drivers/ata/dwc_ahsata_priv.h
> index 0c2cd5446b5..f2a118420f9 100644
> --- a/drivers/ata/dwc_ahsata_priv.h
> +++ b/drivers/ata/dwc_ahsata_priv.h
> @@ -117,8 +117,8 @@
>   #define SATA_HOST_GPARAM1R_PHY_TYPE	0x00001000
>   #define SATA_HOST_GPARAM1R_RETURN_ERR	0x00000400
>   #define SATA_HOST_GPARAM1R_AHB_ENDIAN_MASK	0x00000300
> -#define SATA_HOST_GPARAM1R_S_HADDR	0X00000080
> -#define SATA_HOST_GPARAM1R_M_HADDR	0X00000040
> +#define SATA_HOST_GPARAM1R_S_HADDR	0x00000080
> +#define SATA_HOST_GPARAM1R_M_HADDR	0x00000040
>   
>   /* Global Parameter 2 Register */
...
> diff --git a/drivers/clk/stm32/clk-stm32mp1.c b/drivers/clk/stm32/clk-stm32mp1.c
> index 9cb69a01f7f..823ce132d0b 100644
> --- a/drivers/clk/stm32/clk-stm32mp1.c
> +++ b/drivers/clk/stm32/clk-stm32mp1.c
> @@ -117,7 +117,7 @@ DECLARE_GLOBAL_DATA_PTR;
>   #define RCC_DSICKSELR		0x924
>   #define RCC_ADCCKSELR		0x928
>   #define RCC_MP_APB1ENSETR	0xA00
> -#define RCC_MP_APB2ENSETR	0XA08
> +#define RCC_MP_APB2ENSETR	0xA08
>   #define RCC_MP_APB3ENSETR	0xA10
>   #define RCC_MP_AHB2ENSETR	0xA18
>   #define RCC_MP_AHB3ENSETR	0xA20

....


For stm32mp1 clock driver,


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick



_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
