Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FED78A966
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Aug 2023 11:56:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A173CC6A61D;
	Mon, 28 Aug 2023 09:56:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB845C62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Aug 2023 09:56:33 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37S8jt6G026193; Mon, 28 Aug 2023 11:56:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=2++ft29PyyNh7r517GKd9f17K8CxyW3PgQuHtwBHWjI=; b=gH
 DTjfQtiyHylPgsPuSmRRvvzwOoIyrv7v4RLV6gv66/6M6JgiBx3bPzaxLnViXOkb
 f/sD3UmxpjoJnKbJwCUpggpuEYg2YQtJgMA5uWGcMqwdBqh4fXP9XVLXH0xNiN2z
 ySIt5aKGwbDgAe4dVJIxhhkG9R35JVTzQEgzCedJ4Fhz/FP3c5t6kNBaCvGofmOS
 GNV4RwGArdvNWI3Tm1XrMMNMpqRaiuvPn1/2DWl/6TPb+yCmXwjZ5wLnJkNbv6Bk
 GmZCzCHjrXCUhZ0M/2rEZccTOKvjaftKWwwcDxilumbHum7Ac/c2oyTyuI0DLLyo
 IR5VpH/eqjTdDl1KL/0A==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sqtxymn8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Aug 2023 11:56:15 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 90240100056;
 Mon, 28 Aug 2023 11:56:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7B53121A905;
 Mon, 28 Aug 2023 11:56:10 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 28 Aug
 2023 11:56:09 +0200
Message-ID: <30bd3a4e-f45b-2de7-b3a0-5474524a0e46@foss.st.com>
Date: Mon, 28 Aug 2023 11:56:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Igor Prusov <ivprusov@sberdevices.ru>, Michal Simek <michal.simek@amd.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>,
 Joel Stanley <joel@jms.id.au>, Stefan Roese <sr@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
References: <20230714152444.24395-1-ivprusov@sberdevices.ru>
 <20230714152444.24395-7-ivprusov@sberdevices.ru>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230714152444.24395-7-ivprusov@sberdevices.ru>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-28_07,2023-08-25_01,2023-05-22_02
Cc: kernel@sberdevices.ru, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com, prusovigor@gmail.com
Subject: Re: [Uboot-stm32] [PATCH v3 6/7] clk: treewide: switch to clock
	dump from clk_ops
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



On 7/14/23 17:24, Igor Prusov wrote:
> Switch to using new dump operation in clock provider drivers instead of
> overriding soc_clk_dump.
> 
> Signed-off-by: Igor Prusov <ivprusov@sberdevices.ru>
> ---
>  arch/mips/mach-pic32/cpu.c             | 23 ---------------
>  drivers/clk/aspeed/clk_ast2600.c       | 13 ++++-----
>  drivers/clk/clk_k210.c                 | 11 +++-----
>  drivers/clk/clk_pic32.c                | 39 ++++++++++++++++++++++++++
>  drivers/clk/clk_versal.c               |  7 ++++-
>  drivers/clk/clk_zynq.c                 | 19 ++++---------
>  drivers/clk/clk_zynqmp.c               | 13 ++++-----
>  drivers/clk/imx/clk-imx8.c             | 11 +++-----
>  drivers/clk/mvebu/armada-37xx-periph.c |  5 +++-
>  drivers/clk/stm32/clk-stm32mp1.c       | 29 ++++++-------------
>  10 files changed, 83 insertions(+), 87 deletions(-)
> 
> diff --git a/arch/mips/mach-pic32/cpu.c b/arch/mips/mach-pic32/cpu.c
> index ec3c250531..99401745da 100644
> --- a/arch/mips/mach-pic32/cpu.c
> +++ b/arch/mips/mach-pic32/cpu.c
> @@ -148,26 +148,3 @@ const char *get_core_name(void)
>  	return str;
>  }
>  #endif
> -#ifdef CONFIG_CMD_CLK
> -
> -int soc_clk_dump(void)
> -{
> -	int i;
> -
> -	printf("PLL Speed: %lu MHz\n",
> -	       CLK_MHZ(rate(PLLCLK)));
> -
> -	printf("CPU Speed: %lu MHz\n", CLK_MHZ(rate(PB7CLK)));
> -
> -	printf("MPLL Speed: %lu MHz\n", CLK_MHZ(rate(MPLL)));
> -
> -	for (i = PB1CLK; i <= PB7CLK; i++)
> -		printf("PB%d Clock Speed: %lu MHz\n", i - PB1CLK + 1,
> -		       CLK_MHZ(rate(i)));
> -
> -	for (i = REF1CLK; i <= REF5CLK; i++)
> -		printf("REFO%d Clock Speed: %lu MHz\n", i - REF1CLK + 1,
> -		       CLK_MHZ(rate(i)));
> -	return 0;
> -}
> -#endif
> diff --git a/drivers/clk/aspeed/clk_ast2600.c b/drivers/clk/aspeed/clk_ast2600.c
> index b3cc8392fa..e1365d3f81 100644
> --- a/drivers/clk/aspeed/clk_ast2600.c
> +++ b/drivers/clk/aspeed/clk_ast2600.c
> @@ -1109,6 +1109,7 @@ struct aspeed_clks {
>  	const char *name;
>  };
>  
> +#if IS_ENABLED(CONFIG_CMD_CLK)
>  static struct aspeed_clks aspeed_clk_names[] = {
>  	{ ASPEED_CLK_HPLL, "hpll" },
>  	{ ASPEED_CLK_MPLL, "mpll" },
> @@ -1123,18 +1124,12 @@ static struct aspeed_clks aspeed_clk_names[] = {
>  	{ ASPEED_CLK_HUARTX, "huxclk" },
>  };
>  
> -int soc_clk_dump(void)
> +static int ast2600_clk_dump(struct udevice *dev)
>  {
> -	struct udevice *dev;
>  	struct clk clk;
>  	unsigned long rate;
>  	int i, ret;
>  
> -	ret = uclass_get_device_by_driver(UCLASS_CLK, DM_DRIVER_GET(aspeed_scu),
> -					  &dev);
> -	if (ret)
> -		return ret;
> -
>  	printf("Clk\t\tHz\n");
>  
>  	for (i = 0; i < ARRAY_SIZE(aspeed_clk_names); i++) {
> @@ -1167,11 +1162,15 @@ int soc_clk_dump(void)
>  
>  	return 0;
>  }
> +#endif
>  
>  struct clk_ops ast2600_clk_ops = {
>  	.get_rate = ast2600_clk_get_rate,
>  	.set_rate = ast2600_clk_set_rate,
>  	.enable = ast2600_clk_enable,
> +#if IS_ENABLED(CONFIG_CMD_CLK)
> +	.dump = ast2600_clk_dump,
> +#endif
>  };
>  
>  static int ast2600_clk_probe(struct udevice *dev)
> diff --git a/drivers/clk/clk_k210.c b/drivers/clk/clk_k210.c
> index 2f17152021..058940b828 100644
> --- a/drivers/clk/clk_k210.c
> +++ b/drivers/clk/clk_k210.c
> @@ -1276,16 +1276,10 @@ static void show_clks(struct k210_clk_priv *priv, int id, int depth)
>  	}
>  }
>  
> -int soc_clk_dump(void)
> +static int k210_clk_dump(struct udevice *dev)
>  {
> -	int ret;
> -	struct udevice *dev;
>  	struct k210_clk_priv *priv;
>  
> -	ret = uclass_get_device_by_driver(UCLASS_CLK, DM_DRIVER_GET(k210_clk),
> -					  &dev);
> -	if (ret)
> -		return ret;
>  	priv = dev_get_priv(dev);
>  
>  	puts(" Rate      Enabled Name\n");
> @@ -1304,6 +1298,9 @@ static const struct clk_ops k210_clk_ops = {
>  	.set_parent = k210_clk_set_parent,
>  	.enable = k210_clk_enable,
>  	.disable = k210_clk_disable,
> +#if IS_ENABLED(CONFIG_CMD_CLK)
> +	.dump = k210_clk_dump,
> +#endif
>  };
>  
>  static int k210_clk_probe(struct udevice *dev)
> diff --git a/drivers/clk/clk_pic32.c b/drivers/clk/clk_pic32.c
> index ef06a7fb9f..f756fc88f0 100644
> --- a/drivers/clk/clk_pic32.c
> +++ b/drivers/clk/clk_pic32.c
> @@ -20,6 +20,8 @@
>  
>  DECLARE_GLOBAL_DATA_PTR;
>  
> +#define CLK_MHZ(x)	((x) / 1000000)
> +
>  /* Primary oscillator */
>  #define SYS_POSC_CLK_HZ	24000000
>  
> @@ -385,9 +387,46 @@ static ulong pic32_set_rate(struct clk *clk, ulong rate)
>  	return rate;
>  }
>  
> +#if IS_ENABLED(CONFIG_CMD_CLK)
> +static int pic32_dump(struct udevice *dev)
> +{
> +	int i;
> +	struct clk clk;
> +
> +	clk.dev = dev;
> +
> +	clk.id = PLLCLK;
> +	printf("PLL Speed: %lu MHz\n",
> +	       CLK_MHZ(pic32_get_rate(&clk)));
> +
> +	clk.id = PB7CLK;
> +	printf("CPU Speed: %lu MHz\n", CLK_MHZ(pic32_get_rate(&clk)));
> +
> +	clk.id = MPLL;
> +	printf("MPLL Speed: %lu MHz\n", CLK_MHZ(pic32_get_rate(&clk)));
> +
> +	for (i = PB1CLK; i <= PB7CLK; i++) {
> +		clk.id = i;
> +		printf("PB%d Clock Speed: %lu MHz\n", i - PB1CLK + 1,
> +		       CLK_MHZ(pic32_get_rate(&clk)));
> +	}
> +
> +	for (i = REF1CLK; i <= REF5CLK; i++) {
> +		clk.id = i;
> +		printf("REFO%d Clock Speed: %lu MHz\n", i - REF1CLK + 1,
> +		       CLK_MHZ(pic32_get_rate(&clk)));
> +	}
> +
> +	return 0;
> +}
> +#endif
> +
>  static struct clk_ops pic32_pic32_clk_ops = {
>  	.set_rate = pic32_set_rate,
>  	.get_rate = pic32_get_rate,
> +#if IS_ENABLED(CONFIG_CMD_CLK)
> +	.dump = pic32_dump,
> +#endif
>  };
>  
>  static int pic32_clk_probe(struct udevice *dev)
> diff --git a/drivers/clk/clk_versal.c b/drivers/clk/clk_versal.c
> index faebbab1c6..1b739a9c8d 100644
> --- a/drivers/clk/clk_versal.c
> +++ b/drivers/clk/clk_versal.c
> @@ -523,7 +523,8 @@ static int versal_clock_get_rate(u32 clk_id, u64 *clk_rate)
>  	return 0;
>  }
>  
> -int soc_clk_dump(void)
> +#if IS_ENABLED(CONFIG_CMD_CLK)
> +static int versal_clk_dump(struct udevice __always_unused *dev)
>  {
>  	u64 clk_rate = 0;
>  	u32 type, ret, i = 0;
> @@ -546,6 +547,7 @@ int soc_clk_dump(void)
>  
>  	return 0;
>  }
> +#endif
>  
>  static void versal_get_clock_info(void)
>  {
> @@ -737,6 +739,9 @@ static struct clk_ops versal_clk_ops = {
>  	.set_rate = versal_clk_set_rate,
>  	.get_rate = versal_clk_get_rate,
>  	.enable = versal_clk_enable,
> +#if IS_ENABLED(CONFIG_CMD_CLK)
> +	.dump = versal_clk_dump,
> +#endif
>  };
>  
>  static const struct udevice_id versal_clk_ids[] = {
> diff --git a/drivers/clk/clk_zynq.c b/drivers/clk/clk_zynq.c
> index be5226175f..d492eea3b0 100644
> --- a/drivers/clk/clk_zynq.c
> +++ b/drivers/clk/clk_zynq.c
> @@ -454,6 +454,7 @@ static int dummy_enable(struct clk *clk)
>  	return 0;
>  }
>  
> +#if IS_ENABLED(CONFIG_CMD_CLK)
>  static const char * const clk_names[clk_max] = {
>  	"armpll", "ddrpll", "iopll",
>  	"cpu_6or4x", "cpu_3or2x", "cpu_2x", "cpu_1x",
> @@ -468,22 +469,10 @@ static const char * const clk_names[clk_max] = {
>  	"smc_aper", "swdt", "dbg_trc", "dbg_apb"
>  };
>  
> -/**
> - * soc_clk_dump() - Print clock frequencies
> - * Returns zero on success
> - *
> - * Implementation for the clk dump command.
> - */
> -int soc_clk_dump(void)
> +static int zynq_clk_dump(struct udevice *dev)
>  {
> -	struct udevice *dev;
>  	int i, ret;
>  
> -	ret = uclass_get_device_by_driver(UCLASS_CLK,
> -					  DM_DRIVER_GET(zynq_clk), &dev);
> -	if (ret)
> -		return ret;
> -
>  	printf("clk\t\tfrequency\n");
>  	for (i = 0; i < clk_max; i++) {
>  		const char *name = clk_names[i];
> @@ -511,6 +500,7 @@ int soc_clk_dump(void)
>  
>  	return 0;
>  }
> +#endif
>  
>  static struct clk_ops zynq_clk_ops = {
>  	.get_rate = zynq_clk_get_rate,
> @@ -518,6 +508,9 @@ static struct clk_ops zynq_clk_ops = {
>  	.set_rate = zynq_clk_set_rate,
>  #endif
>  	.enable = dummy_enable,
> +#if IS_ENABLED(CONFIG_CMD_CLK)
> +	.dump = zynq_clk_dump,
> +#endif
>  };
>  
>  static int zynq_clk_probe(struct udevice *dev)
> diff --git a/drivers/clk/clk_zynqmp.c b/drivers/clk/clk_zynqmp.c
> index be0ee50e0e..c97a0ed963 100644
> --- a/drivers/clk/clk_zynqmp.c
> +++ b/drivers/clk/clk_zynqmp.c
> @@ -727,16 +727,11 @@ static ulong zynqmp_clk_set_rate(struct clk *clk, ulong rate)
>  	}
>  }
>  
> -int soc_clk_dump(void)
> +#if IS_ENABLED(CONFIG_CMD_CLK)
> +static int zynqmp_clk_dump(struct udevice *dev)
>  {
> -	struct udevice *dev;
>  	int i, ret;
>  
> -	ret = uclass_get_device_by_driver(UCLASS_CLK,
> -		DM_DRIVER_GET(zynqmp_clk), &dev);
> -	if (ret)
> -		return ret;
> -
>  	printf("clk\t\tfrequency\n");
>  	for (i = 0; i < clk_max; i++) {
>  		const char *name = clk_names[i];
> @@ -764,6 +759,7 @@ int soc_clk_dump(void)
>  
>  	return 0;
>  }
> +#endif
>  
>  static int zynqmp_get_freq_by_name(char *name, struct udevice *dev, ulong *freq)
>  {
> @@ -863,6 +859,9 @@ static struct clk_ops zynqmp_clk_ops = {
>  	.set_rate = zynqmp_clk_set_rate,
>  	.get_rate = zynqmp_clk_get_rate,
>  	.enable = zynqmp_clk_enable,
> +#if IS_ENABLED(CONFIG_CMD_CLK)
> +	.dump = zynqmp_clk_dump,
> +#endif
>  };
>  
>  static const struct udevice_id zynqmp_clk_ids[] = {
> diff --git a/drivers/clk/imx/clk-imx8.c b/drivers/clk/imx/clk-imx8.c
> index ceeead3434..6cd55f4369 100644
> --- a/drivers/clk/imx/clk-imx8.c
> +++ b/drivers/clk/imx/clk-imx8.c
> @@ -43,18 +43,12 @@ static int imx8_clk_enable(struct clk *clk)
>  }
>  
>  #if IS_ENABLED(CONFIG_CMD_CLK)
> -int soc_clk_dump(void)
> +static int imx8_clk_dump(struct udevice *dev)
>  {
> -	struct udevice *dev;
>  	struct clk clk;
>  	unsigned long rate;
>  	int i, ret;
>  
> -	ret = uclass_get_device_by_driver(UCLASS_CLK,
> -					  DM_DRIVER_GET(imx8_clk), &dev);
> -	if (ret)
> -		return ret;
> -
>  	printf("Clk\t\tHz\n");
>  
>  	for (i = 0; i < num_clks; i++) {
> @@ -94,6 +88,9 @@ static struct clk_ops imx8_clk_ops = {
>  	.get_rate = imx8_clk_get_rate,
>  	.enable = imx8_clk_enable,
>  	.disable = imx8_clk_disable,
> +#if IS_ENABLED(CONFIG_CMD_CLK)
> +	.dump = imx8_clk_dump,
> +#endif
>  };
>  
>  static int imx8_clk_probe(struct udevice *dev)
> diff --git a/drivers/clk/mvebu/armada-37xx-periph.c b/drivers/clk/mvebu/armada-37xx-periph.c
> index e75052f383..faf75c8792 100644
> --- a/drivers/clk/mvebu/armada-37xx-periph.c
> +++ b/drivers/clk/mvebu/armada-37xx-periph.c
> @@ -499,7 +499,7 @@ static int clk_dump(const char *name, int (*func)(struct udevice *))
>  
>  int armada_37xx_tbg_clk_dump(struct udevice *);
>  
> -int soc_clk_dump(void)
> +static int armada37xx_clk_dump(struct udevice __always_unused *dev)
>  {
>  	printf("  xtal at %u000000 Hz\n\n", get_ref_clk());
>  
> @@ -605,6 +605,9 @@ static const struct clk_ops armada_37xx_periph_clk_ops = {
>  	.set_parent = armada_37xx_periph_clk_set_parent,
>  	.enable = armada_37xx_periph_clk_enable,
>  	.disable = armada_37xx_periph_clk_disable,
> +#if IS_ENABLED(CONFIG_CMD_CLK)
> +	.dump = armada37xx_clk_dump,
> +#endif
>  };
>  
>  static const struct udevice_id armada_37xx_periph_clk_ids[] = {
> diff --git a/drivers/clk/stm32/clk-stm32mp1.c b/drivers/clk/stm32/clk-stm32mp1.c
> index 4f4524fcb2..d5b66d48f0 100644
> --- a/drivers/clk/stm32/clk-stm32mp1.c
> +++ b/drivers/clk/stm32/clk-stm32mp1.c
> @@ -2217,10 +2217,13 @@ static void stm32mp1_osc_init(struct udevice *dev)
>  	}
>  }
>  
> -static void  __maybe_unused stm32mp1_clk_dump(struct stm32mp1_clk_priv *priv)
> +static int __maybe_unused stm32mp1_clk_dump(struct udevice *dev)
>  {
>  	char buf[32];
>  	int i, s, p;
> +	struct stm32mp1_clk_priv *priv;
> +
> +	priv = dev_get_priv(dev);
>  
>  	printf("Clocks:\n");
>  	for (i = 0; i < _PARENT_NB; i++) {
> @@ -2242,28 +2245,9 @@ static void  __maybe_unused stm32mp1_clk_dump(struct stm32mp1_clk_priv *priv)
>  			       stm32mp1_clk_parent_sel_name[i], i, p);
>  		}
>  	}
> -}
> -
> -#ifdef CONFIG_CMD_CLK
> -int soc_clk_dump(void)
> -{
> -	struct udevice *dev;
> -	struct stm32mp1_clk_priv *priv;
> -	int ret;
> -
> -	ret = uclass_get_device_by_driver(UCLASS_CLK,
> -					  DM_DRIVER_GET(stm32mp1_clock),
> -					  &dev);
> -	if (ret)
> -		return ret;
> -
> -	priv = dev_get_priv(dev);
> -
> -	stm32mp1_clk_dump(priv);
>  
>  	return 0;
>  }
> -#endif
>  
>  static int stm32mp1_clk_probe(struct udevice *dev)
>  {
> @@ -2294,7 +2278,7 @@ static int stm32mp1_clk_probe(struct udevice *dev)
>  #if defined(VERBOSE_DEBUG)
>  	/* display debug information for probe after relocation */
>  	if (gd->flags & GD_FLG_RELOC)
> -		stm32mp1_clk_dump(priv);
> +		stm32mp1_clk_dump(dev);
>  #endif
>  
>  	gd->cpu_clk = stm32mp1_clk_get(priv, _CK_MPU);
> @@ -2325,6 +2309,9 @@ static const struct clk_ops stm32mp1_clk_ops = {
>  	.disable = stm32mp1_clk_disable,
>  	.get_rate = stm32mp1_clk_get_rate,
>  	.set_rate = stm32mp1_clk_set_rate,
> +#if IS_ENABLED(CONFIG_CMD_CLK) && !IS_ENABLED(CONFIG_SPL_BUILD)
> +	.dump = stm32mp1_clk_dump,
> +#endif
>  };
>  
>  U_BOOT_DRIVER(stm32mp1_clock) = {


For stm32mp1, tested on stm32mp157c-dk2 board

Tested-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
