Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A667E5BE8
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Nov 2023 18:02:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5E41C6B44D;
	Wed,  8 Nov 2023 17:02:48 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70819C6B444
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Nov 2023 17:02:47 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-7788f513872so455852585a.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Nov 2023 09:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699462966; x=1700067766;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6jxwW8CDc0/jRszbXo3T3Ey81AhCyl0rtxJMT011tzU=;
 b=kDxlnOgBdYo2/t+7dnnMQYczA4AdTM65ngJ5MVsO0vcSiByuwiyAQdYAHQhkKXscNA
 +krAcG6mjvf+aiqMVVX0M7jfDM9sh91y9iE9ahUox6nJRXcJr/tivLZKaZie1Vi9DwX6
 mKniiHHH8SSbIVmdJ6TKs5GxVWxtCA02sQ/EA3awiNDM4RRIGF97J4yFTbuE+F6T/Win
 LvzWwtyJGbfAVUoNMORxCB9i1uGjDR8iqVdxyO4UeXUmqA9KDOHfOGc5s8RuYg1hPhHd
 W7i1TRL7klsmR10rmLtzcsNVrlFvQG1Jv3FBq7+X1e7uH3vh+u8JOG8uA3sqlq4JyEWM
 nu4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699462966; x=1700067766;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6jxwW8CDc0/jRszbXo3T3Ey81AhCyl0rtxJMT011tzU=;
 b=TDqgOf0DsueIzoM3lnNdtZEtFwNeWQuV9w0cfr74VTuDnZVyUil+P9xUTTMOkdOq/V
 2KYy+MH0vw1WrXYr0g7pK082m/yLmoEsbuUiLQhu1TfVOy+ZCaBiVwt73kvpey8lLOh8
 o4iOCqLP/2imJRJujaMIbBta/UkN8fDJmEo2VQHUV5m/mwNSHvh0d2OK6y7FiahuN1Kr
 tSmmO9d2QoCnLuGaY+yceblCnSHZE9yga5q3ghTbiLB90iXjKzM9DujvPfrYbiEPkBe8
 1hU02lJLbhpcXIyENkq8HVJMPgqUK9ifu1gVXN49/P6FYDeFvVd0JgHfnEt3ms0FVw0e
 k1Uw==
X-Gm-Message-State: AOJu0YxQFkfT3gvDo72T8f+ANncKH/qmOw6NtDT6nlD6iHZG2Oav6y35
 LAgh7HRi2DY8y2h8oBAM4h4=
X-Google-Smtp-Source: AGHT+IGkXoV6p3gi4tyteM2FLkOnzl6sqWbrR5/37YYELw3VueWwBH8oo/W+YkeY/Tkro2GRxG6wWw==
X-Received: by 2002:a05:620a:28d3:b0:76f:f0b:a1ba with SMTP id
 l19-20020a05620a28d300b0076f0f0ba1bamr1946275qkp.30.1699462966141; 
 Wed, 08 Nov 2023 09:02:46 -0800 (PST)
Received: from [192.168.1.201] (pool-108-48-157-169.washdc.fios.verizon.net.
 [108.48.157.169]) by smtp.gmail.com with ESMTPSA id
 c20-20020a05620a135400b007671cfe8a18sm1242078qkl.13.2023.11.08.09.02.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Nov 2023 09:02:45 -0800 (PST)
Message-ID: <2993e37e-3ba5-16ba-47cb-dfd245eec578@gmail.com>
Date: Wed, 8 Nov 2023 12:02:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Igor Prusov <ivprusov@sberdevices.ru>, u-boot@lists.denx.de,
 Michal Simek <michal.simek@amd.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Stefan Roese <sr@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
References: <20231105083809.3293-1-ivprusov@sberdevices.ru>
 <20231105083809.3293-8-ivprusov@sberdevices.ru>
From: Sean Anderson <seanga2@gmail.com>
In-Reply-To: <20231105083809.3293-8-ivprusov@sberdevices.ru>
Cc: Aspeed BMC SW team <BMC-SW@aspeedtech.com>, u-boot-amlogic@groups.io,
 uboot-stm32@st-md-mailman.stormreply.com, Joel Stanley <joel@jms.id.au>,
 kernel@sberdevices.ru, prusovigor@gmail.com
Subject: Re: [Uboot-stm32] [PATCH v6 7/8] clk: treewide: switch to clock
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 11/5/23 03:38, Igor Prusov wrote:
> Switch to using new dump operation in clock provider drivers instead of
> overriding soc_clk_dump.
> 
> Signed-off-by: Igor Prusov <ivprusov@sberdevices.ru>
> Tested-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reviewed-by: Sean Anderson <seanga2@gmail.com>
> ---
>   arch/mips/mach-pic32/cpu.c             | 23 ----------------
>   drivers/clk/aspeed/clk_ast2600.c       | 13 +++++----
>   drivers/clk/clk_k210.c                 | 12 +++------
>   drivers/clk/clk_pic32.c                | 37 ++++++++++++++++++++++++++
>   drivers/clk/clk_versal.c               |  9 ++++---
>   drivers/clk/clk_zynq.c                 | 28 ++++++++-----------
>   drivers/clk/clk_zynqmp.c               | 22 +++++++--------
>   drivers/clk/imx/clk-imx8.c             | 13 +++------
>   drivers/clk/meson/a1.c                 | 28 ++++++-------------
>   drivers/clk/mvebu/armada-37xx-periph.c | 20 +++++++++-----
>   drivers/clk/stm32/clk-stm32mp1.c       | 31 ++++++---------------
>   11 files changed, 108 insertions(+), 128 deletions(-)
> 
> diff --git a/arch/mips/mach-pic32/cpu.c b/arch/mips/mach-pic32/cpu.c
> index dbf8c9cd22..3181a946a2 100644
> --- a/arch/mips/mach-pic32/cpu.c
> +++ b/arch/mips/mach-pic32/cpu.c
> @@ -143,26 +143,3 @@ const char *get_core_name(void)
>   	return str;
>   }
>   #endif
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
> index b3cc8392fa..eecfacd7fc 100644
> --- a/drivers/clk/aspeed/clk_ast2600.c
> +++ b/drivers/clk/aspeed/clk_ast2600.c
> @@ -1109,6 +1109,7 @@ struct aspeed_clks {
>   	const char *name;
>   };
>   
> +#if IS_ENABLED(CONFIG_CMD_CLK)
>   static struct aspeed_clks aspeed_clk_names[] = {
>   	{ ASPEED_CLK_HPLL, "hpll" },
>   	{ ASPEED_CLK_MPLL, "mpll" },
> @@ -1123,18 +1124,12 @@ static struct aspeed_clks aspeed_clk_names[] = {
>   	{ ASPEED_CLK_HUARTX, "huxclk" },
>   };
>   
> -int soc_clk_dump(void)
> +static void ast2600_clk_dump(struct udevice *dev)
>   {
> -	struct udevice *dev;
>   	struct clk clk;
>   	unsigned long rate;
>   	int i, ret;
>   
> -	ret = uclass_get_device_by_driver(UCLASS_CLK, DM_DRIVER_GET(aspeed_scu),
> -					  &dev);
> -	if (ret)
> -		return ret;
> -
>   	printf("Clk\t\tHz\n");
>   
>   	for (i = 0; i < ARRAY_SIZE(aspeed_clk_names); i++) {
> @@ -1167,11 +1162,15 @@ int soc_clk_dump(void)
>   
>   	return 0;
>   }
> +#endif
>   
>   struct clk_ops ast2600_clk_ops = {
>   	.get_rate = ast2600_clk_get_rate,
>   	.set_rate = ast2600_clk_set_rate,
>   	.enable = ast2600_clk_enable,
> +#if IS_ENABLED(CONFIG_CMD_CLK)
> +	.dump = ast2600_clk_dump,
> +#endif
>   };
>   
>   static int ast2600_clk_probe(struct udevice *dev)
> diff --git a/drivers/clk/clk_k210.c b/drivers/clk/clk_k210.c
> index 2f17152021..b8d666e805 100644
> --- a/drivers/clk/clk_k210.c
> +++ b/drivers/clk/clk_k210.c
> @@ -1276,16 +1276,10 @@ static void show_clks(struct k210_clk_priv *priv, int id, int depth)
>   	}
>   }
>   
> -int soc_clk_dump(void)
> +static int k210_clk_dump(struct udevice *dev)

void?

>   {
> -	int ret;
> -	struct udevice *dev;
>   	struct k210_clk_priv *priv;
>   
> -	ret = uclass_get_device_by_driver(UCLASS_CLK, DM_DRIVER_GET(k210_clk),
> -					  &dev);
> -	if (ret)
> -		return ret;
>   	priv = dev_get_priv(dev);
>   
>   	puts(" Rate      Enabled Name\n");
> @@ -1293,7 +1287,6 @@ int soc_clk_dump(void)
>   	printf(" %-9lu %-7c %*s%s\n", clk_get_rate(&priv->in0), 'y', 0, "",
>   	       priv->in0.dev->name);
>   	show_clks(priv, K210_CLK_IN0, 1);
> -	return 0;
>   }
>   #endif
>   
> @@ -1304,6 +1297,9 @@ static const struct clk_ops k210_clk_ops = {
>   	.set_parent = k210_clk_set_parent,
>   	.enable = k210_clk_enable,
>   	.disable = k210_clk_disable,
> +#if IS_ENABLED(CONFIG_CMD_CLK)
> +	.dump = k210_clk_dump,
> +#endif
>   };
>   
>   static int k210_clk_probe(struct udevice *dev)
> diff --git a/drivers/clk/clk_pic32.c b/drivers/clk/clk_pic32.c
> index ef06a7fb9f..a77d0e7419 100644
> --- a/drivers/clk/clk_pic32.c
> +++ b/drivers/clk/clk_pic32.c
> @@ -20,6 +20,8 @@
>   
>   DECLARE_GLOBAL_DATA_PTR;
>   
> +#define CLK_MHZ(x)	((x) / 1000000)
> +
>   /* Primary oscillator */
>   #define SYS_POSC_CLK_HZ	24000000
>   
> @@ -385,9 +387,44 @@ static ulong pic32_set_rate(struct clk *clk, ulong rate)
>   	return rate;
>   }
>   
> +#if IS_ENABLED(CONFIG_CMD_CLK)
> +static void pic32_dump(struct udevice *dev)
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
> +}
> +#endif
> +
>   static struct clk_ops pic32_pic32_clk_ops = {
>   	.set_rate = pic32_set_rate,
>   	.get_rate = pic32_get_rate,
> +#if IS_ENABLED(CONFIG_CMD_CLK)
> +	.dump = pic32_dump,
> +#endif
>   };
>   
>   static int pic32_clk_probe(struct udevice *dev)
> diff --git a/drivers/clk/clk_versal.c b/drivers/clk/clk_versal.c
> index c473643603..42ab032bf7 100644
> --- a/drivers/clk/clk_versal.c
> +++ b/drivers/clk/clk_versal.c
> @@ -555,7 +555,8 @@ static int versal_clock_get_rate(u32 clk_id, u64 *clk_rate)
>   	return 0;
>   }
>   
> -int soc_clk_dump(void)
> +#if IS_ENABLED(CONFIG_CMD_CLK)
> +static void versal_clk_dump(struct udevice __always_unused *dev)
>   {
>   	u64 clk_rate = 0;
>   	u32 type, ret, i = 0;
> @@ -575,9 +576,8 @@ int soc_clk_dump(void)
>   			printf("clk: %s  freq:%lld\n",
>   			       clock[i].clk_name, clk_rate);
>   	}
> -
> -	return 0;
>   }
> +#endif
>   
>   static void versal_get_clock_info(void)
>   {
> @@ -769,6 +769,9 @@ static struct clk_ops versal_clk_ops = {
>   	.set_rate = versal_clk_set_rate,
>   	.get_rate = versal_clk_get_rate,
>   	.enable = versal_clk_enable,
> +#if IS_ENABLED(CONFIG_CMD_CLK)
> +	.dump = versal_clk_dump,
> +#endif
>   };
>   
>   static const struct udevice_id versal_clk_ids[] = {
> diff --git a/drivers/clk/clk_zynq.c b/drivers/clk/clk_zynq.c
> index be5226175f..34f964d72a 100644
> --- a/drivers/clk/clk_zynq.c
> +++ b/drivers/clk/clk_zynq.c
> @@ -454,6 +454,7 @@ static int dummy_enable(struct clk *clk)
>   	return 0;
>   }
>   
> +#if IS_ENABLED(CONFIG_CMD_CLK)
>   static const char * const clk_names[clk_max] = {
>   	"armpll", "ddrpll", "iopll",
>   	"cpu_6or4x", "cpu_3or2x", "cpu_2x", "cpu_1x",
> @@ -468,22 +469,10 @@ static const char * const clk_names[clk_max] = {
>   	"smc_aper", "swdt", "dbg_trc", "dbg_apb"
>   };
>   
> -/**
> - * soc_clk_dump() - Print clock frequencies
> - * Returns zero on success
> - *
> - * Implementation for the clk dump command.
> - */
> -int soc_clk_dump(void)
> +static void zynq_clk_dump(struct udevice *dev)
>   {
> -	struct udevice *dev;
>   	int i, ret;
>   
> -	ret = uclass_get_device_by_driver(UCLASS_CLK,
> -					  DM_DRIVER_GET(zynq_clk), &dev);
> -	if (ret)
> -		return ret;
> -
>   	printf("clk\t\tfrequency\n");
>   	for (i = 0; i < clk_max; i++) {
>   		const char *name = clk_names[i];
> @@ -494,8 +483,11 @@ int soc_clk_dump(void)
>   
>   			clk.id = i;
>   			ret = clk_request(dev, &clk);
> -			if (ret < 0)
> -				return ret;
> +			if (ret < 0) {
> +				printf("%s clk_request() failed: %d\n",
> +				       __func__, ret);
> +				break;
> +			}
>   
>   			rate = clk_get_rate(&clk);
>   
> @@ -508,9 +500,8 @@ int soc_clk_dump(void)
>   				printf("%10s%20lu\n", name, rate);
>   		}
>   	}
> -
> -	return 0;
>   }
> +#endif
>   
>   static struct clk_ops zynq_clk_ops = {
>   	.get_rate = zynq_clk_get_rate,
> @@ -518,6 +509,9 @@ static struct clk_ops zynq_clk_ops = {
>   	.set_rate = zynq_clk_set_rate,
>   #endif
>   	.enable = dummy_enable,
> +#if IS_ENABLED(CONFIG_CMD_CLK)
> +	.dump = zynq_clk_dump,
> +#endif
>   };
>   
>   static int zynq_clk_probe(struct udevice *dev)
> diff --git a/drivers/clk/clk_zynqmp.c b/drivers/clk/clk_zynqmp.c
> index 1cfe0e25b1..a334a77b79 100644
> --- a/drivers/clk/clk_zynqmp.c
> +++ b/drivers/clk/clk_zynqmp.c
> @@ -735,16 +735,11 @@ static ulong zynqmp_clk_set_rate(struct clk *clk, ulong rate)
>   	}
>   }
>   
> -int soc_clk_dump(void)
> +#if IS_ENABLED(CONFIG_CMD_CLK)
> +static void zynqmp_clk_dump(struct udevice *dev)
>   {
> -	struct udevice *dev;
>   	int i, ret;
>   
> -	ret = uclass_get_device_by_driver(UCLASS_CLK,
> -		DM_DRIVER_GET(zynqmp_clk), &dev);
> -	if (ret)
> -		return ret;
> -
>   	printf("clk\t\tfrequency\n");
>   	for (i = 0; i < clk_max; i++) {
>   		const char *name = clk_names[i];
> @@ -754,8 +749,11 @@ int soc_clk_dump(void)
>   
>   			clk.id = i;
>   			ret = clk_request(dev, &clk);
> -			if (ret < 0)
> -				return ret;
> +			if (ret < 0) {
> +				printf("%s clk_request() failed: %d\n",
> +				       __func__, ret);
> +				break;
> +			}
>   
>   			rate = clk_get_rate(&clk);
>   
> @@ -769,9 +767,8 @@ int soc_clk_dump(void)
>   				printf("%10s%20lu\n", name, rate);
>   		}
>   	}
> -
> -	return 0;
>   }
> +#endif
>   
>   static int zynqmp_get_freq_by_name(char *name, struct udevice *dev, ulong *freq)
>   {
> @@ -871,6 +868,9 @@ static struct clk_ops zynqmp_clk_ops = {
>   	.set_rate = zynqmp_clk_set_rate,
>   	.get_rate = zynqmp_clk_get_rate,
>   	.enable = zynqmp_clk_enable,
> +#if IS_ENABLED(CONFIG_CMD_CLK)
> +	.dump = zynqmp_clk_dump,
> +#endif
>   };
>   
>   static const struct udevice_id zynqmp_clk_ids[] = {
> diff --git a/drivers/clk/imx/clk-imx8.c b/drivers/clk/imx/clk-imx8.c
> index ceeead3434..9600672e07 100644
> --- a/drivers/clk/imx/clk-imx8.c
> +++ b/drivers/clk/imx/clk-imx8.c
> @@ -43,18 +43,12 @@ static int imx8_clk_enable(struct clk *clk)
>   }
>   
>   #if IS_ENABLED(CONFIG_CMD_CLK)
> -int soc_clk_dump(void)
> +static void imx8_clk_dump(struct udevice *dev)
>   {
> -	struct udevice *dev;
>   	struct clk clk;
>   	unsigned long rate;
>   	int i, ret;
>   
> -	ret = uclass_get_device_by_driver(UCLASS_CLK,
> -					  DM_DRIVER_GET(imx8_clk), &dev);
> -	if (ret)
> -		return ret;
> -
>   	printf("Clk\t\tHz\n");
>   
>   	for (i = 0; i < num_clks; i++) {
> @@ -84,8 +78,6 @@ int soc_clk_dump(void)
>   		printf("%s(%3lu):\t%lu\n",
>   		       imx8_clk_names[i].name, imx8_clk_names[i].id, rate);
>   	}
> -
> -	return 0;
>   }
>   #endif
>   
> @@ -94,6 +86,9 @@ static struct clk_ops imx8_clk_ops = {
>   	.get_rate = imx8_clk_get_rate,
>   	.enable = imx8_clk_enable,
>   	.disable = imx8_clk_disable,
> +#if IS_ENABLED(CONFIG_CMD_CLK)
> +	.dump = imx8_clk_dump,
> +#endif
>   };
>   
>   static int imx8_clk_probe(struct udevice *dev)
> diff --git a/drivers/clk/meson/a1.c b/drivers/clk/meson/a1.c
> index e3fa9db7d0..e5f712f44b 100644
> --- a/drivers/clk/meson/a1.c
> +++ b/drivers/clk/meson/a1.c
> @@ -630,6 +630,7 @@ static const struct udevice_id meson_clk_ids[] = {
>   	{ }
>   };
>   
> +#if IS_ENABLED(CONFIG_CMD_CLK)
>   static const char *meson_clk_get_name(struct clk *clk, int id)
>   {
>   	const struct meson_clk_info *info;
> @@ -639,7 +640,7 @@ static const char *meson_clk_get_name(struct clk *clk, int id)
>   	return IS_ERR(info) ? "unknown" : info->name;
>   }
>   
> -static int meson_clk_dump(struct clk *clk)
> +static int meson_clk_dump_single(struct clk *clk)
>   {
>   	const struct meson_clk_info *info;
>   	struct meson_clk *priv;
> @@ -674,7 +675,7 @@ static int meson_clk_dump(struct clk *clk)
>   	return 0;
>   }
>   
> -static int meson_clk_dump_dev(struct udevice *dev)
> +static void meson_clk_dump(struct udevice *dev)
>   {
>   	int i;
>   	struct meson_clk_data *data;
> @@ -687,29 +688,13 @@ static int meson_clk_dump_dev(struct udevice *dev)
>   
>   	data = (struct meson_clk_data *)dev_get_driver_data(dev);
>   	for (i = 0; i < data->num_clocks; i++) {
> -		meson_clk_dump(&(struct clk){
> +		meson_clk_dump_single(&(struct clk){
>   			.dev = dev,
>   			.id = i
>   		});
>   	}
> -
> -	return 0;
> -}
> -
> -int soc_clk_dump(void)
> -{
> -	struct udevice *dev;
> -	int i = 0;
> -
> -	while (!uclass_get_device(UCLASS_CLK, i++, &dev)) {
> -		if (dev->driver == DM_DRIVER_GET(meson_clk)) {
> -			meson_clk_dump_dev(dev);
> -			printf("\n");
> -		}
> -	}
> -
> -	return 0;
>   }
> +#endif
>   
>   static struct clk_ops meson_clk_ops = {
>   	.disable	= meson_clk_disable,
> @@ -717,6 +702,9 @@ static struct clk_ops meson_clk_ops = {
>   	.get_rate	= meson_clk_get_rate,
>   	.set_rate	= meson_clk_set_rate,
>   	.set_parent	= meson_clk_set_parent,
> +#if IS_ENABLED(CONFIG_CMD_CLK)
> +	.dump		= meson_clk_dump,
> +#endif
>   };
>   
>   U_BOOT_DRIVER(meson_clk) = {
> diff --git a/drivers/clk/mvebu/armada-37xx-periph.c b/drivers/clk/mvebu/armada-37xx-periph.c
> index e75052f383..1a7097029a 100644
> --- a/drivers/clk/mvebu/armada-37xx-periph.c
> +++ b/drivers/clk/mvebu/armada-37xx-periph.c
> @@ -488,33 +488,36 @@ static int armada_37xx_periph_clk_dump(struct udevice *dev)
>   static int clk_dump(const char *name, int (*func)(struct udevice *))
>   {
>   	struct udevice *dev;
> +	int ret;
>   
>   	if (uclass_get_device_by_name(UCLASS_CLK, name, &dev)) {
>   		printf("Cannot find device %s\n", name);
>   		return -ENODEV;
>   	}
>   
> -	return func(dev);
> +	ret = func(dev);
> +	if (ret)
> +		printf("Dump failed for %s: %d\n", name, ret);
> +
> +	return ret;
>   }
>   
>   int armada_37xx_tbg_clk_dump(struct udevice *);
>   
> -int soc_clk_dump(void)
> +static void armada37xx_clk_dump(struct udevice __always_unused *dev)
>   {
>   	printf("  xtal at %u000000 Hz\n\n", get_ref_clk());
>   
>   	if (clk_dump("tbg@13200", armada_37xx_tbg_clk_dump))
> -		return 1;
> +		return;
>   
>   	if (clk_dump("nb-periph-clk@13000",
>   		     armada_37xx_periph_clk_dump))
> -		return 1;
> +		return;
>   
>   	if (clk_dump("sb-periph-clk@18000",
>   		     armada_37xx_periph_clk_dump))
> -		return 1;
> -
> -	return 0;
> +		return;
>   }
>   #endif
>   
> @@ -605,6 +608,9 @@ static const struct clk_ops armada_37xx_periph_clk_ops = {
>   	.set_parent = armada_37xx_periph_clk_set_parent,
>   	.enable = armada_37xx_periph_clk_enable,
>   	.disable = armada_37xx_periph_clk_disable,
> +#if IS_ENABLED(CONFIG_CMD_CLK)
> +	.dump = armada37xx_clk_dump,
> +#endif
>   };
>   
>   static const struct udevice_id armada_37xx_periph_clk_ids[] = {
> diff --git a/drivers/clk/stm32/clk-stm32mp1.c b/drivers/clk/stm32/clk-stm32mp1.c
> index f3ac8c7583..6f000c8e44 100644
> --- a/drivers/clk/stm32/clk-stm32mp1.c
> +++ b/drivers/clk/stm32/clk-stm32mp1.c
> @@ -2225,10 +2225,13 @@ static void stm32mp1_osc_init(struct udevice *dev)
>   	}
>   }
>   
> -static void  __maybe_unused stm32mp1_clk_dump(struct stm32mp1_clk_priv *priv)
> +static void __maybe_unused stm32mp1_clk_dump(struct udevice *dev)
>   {
>   	char buf[32];
>   	int i, s, p;
> +	struct stm32mp1_clk_priv *priv;
> +
> +	priv = dev_get_priv(dev);
>   
>   	printf("Clocks:\n");
>   	for (i = 0; i < _PARENT_NB; i++) {
> @@ -2252,27 +2255,6 @@ static void  __maybe_unused stm32mp1_clk_dump(struct stm32mp1_clk_priv *priv)
>   	}
>   }
>   
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
> -
> -	return 0;
> -}
> -#endif
> -
>   static int stm32mp1_clk_probe(struct udevice *dev)
>   {
>   	int result = 0;
> @@ -2302,7 +2284,7 @@ static int stm32mp1_clk_probe(struct udevice *dev)
>   #if defined(VERBOSE_DEBUG)
>   	/* display debug information for probe after relocation */
>   	if (gd->flags & GD_FLG_RELOC)
> -		stm32mp1_clk_dump(priv);
> +		stm32mp1_clk_dump(dev);
>   #endif
>   
>   	gd->cpu_clk = stm32mp1_clk_get(priv, _CK_MPU);
> @@ -2333,6 +2315,9 @@ static const struct clk_ops stm32mp1_clk_ops = {
>   	.disable = stm32mp1_clk_disable,
>   	.get_rate = stm32mp1_clk_get_rate,
>   	.set_rate = stm32mp1_clk_set_rate,
> +#if IS_ENABLED(CONFIG_CMD_CLK) && !IS_ENABLED(CONFIG_SPL_BUILD)
> +	.dump = stm32mp1_clk_dump,
> +#endif
>   };
>   
>   U_BOOT_DRIVER(stm32mp1_clock) = {

Other than the above,

Reviewed-by: Sean Anderson <seanga2@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
