Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F91294CA1
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 14:32:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91791C3FAD5;
	Wed, 21 Oct 2020 12:32:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 175F2C3087A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 12:32:33 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LCRB8r026569; Wed, 21 Oct 2020 14:32:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=vR/agITQ/DQnbOAfU49k60gG+6llByJL/No96KziRsY=;
 b=q5xz+f/vyQ+fqSjT8gzTG3fZUqV9YXk9hVyvq6brJnuZVwWN71mSeEOjfqxPRbNVE7UR
 CiHPElvNtUlc91Wznu56XitEjklqcAbhdHDL/y7mnzqMHM8N0OpubfGQ/L2IE/YUfhpO
 maUHgKbiw6mHvDVV3If17qF6YBhCc54PW+SemmbetWeE/xuNfTPgrUE0AHflkZRM932s
 /o6z8KjYIuGLbBVTm0DYQWpG+T1sIRC/6zgut+iZZikF5AcRFL4faobZBlEKqUFMbGEj
 uY4SY2btjouXt8n369iZMgtggX6ESzDucEddVcMuEwDQsU4AavWpu+worf317YWqHBi9 Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347nr8k1b0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 14:32:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1744C10002A;
 Wed, 21 Oct 2020 14:32:30 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0BFE72E084D;
 Wed, 21 Oct 2020 14:32:30 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 14:32:29 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 14:32:29 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 18/33] clk: clk_stm32f: migrate trace to
 dev and log macro
Thread-Index: AQHWp6Y97rq9nHMd4kmS2Hdm1hiiZA==
Date: Wed, 21 Oct 2020 12:32:29 +0000
Message-ID: <68abc2ce-0e2d-9eea-f296-1c7e90e79839@st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
 <20201014091646.4233-19-patrick.delaunay@st.com>
In-Reply-To: <20201014091646.4233-19-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <57ACD6FB39DBFE45925524D5737FC212@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_05:2020-10-20,
 2020-10-21 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 18/33] clk: clk_stm32f: migrate trace to
 dev and log macro
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

On 10/14/20 11:16 AM, Patrick Delaunay wrote:
> Change debug and pr_ macro to dev macro and define LOG_CATEGORY.
>
> Remove the "%s:" __func__  header as it is managed by dev macro
> (dev->name is displayed) or log macro (CONFIG_LOGF_FUNC).
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/clk/clk_stm32f.c | 39 ++++++++++++++++++++-------------------
>  1 file changed, 20 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/clk/clk_stm32f.c b/drivers/clk/clk_stm32f.c
> index 93722f74ae..cd1b8fe0da 100644
> --- a/drivers/clk/clk_stm32f.c
> +++ b/drivers/clk/clk_stm32f.c
> @@ -4,18 +4,19 @@
>   * Author(s): Vikas Manocha, <vikas.manocha@st.com> for STMicroelectronics.
>   */
>  
> +#define LOG_CATEGORY UCLASS_CLK
> +
>  #include <common.h>
>  #include <clk-uclass.h>
>  #include <dm.h>
>  #include <log.h>
>  #include <stm32_rcc.h>
> -#include <linux/bitops.h>
> -
>  #include <asm/io.h>
>  #include <asm/arch/stm32.h>
>  #include <asm/arch/stm32_pwr.h>
> -
> +#include <dm/device_compat.h>
>  #include <dt-bindings/mfd/stm32f7-rcc.h>
> +#include <linux/bitops.h>
>  
>  #define RCC_CR_HSION			BIT(0)
>  #define RCC_CR_HSEON			BIT(16)
> @@ -309,7 +310,7 @@ static unsigned long stm32_clk_get_pllsai_rate(struct stm32_clk *priv,
>  				  >> RCC_PLLSAICFGR_PLLSAIR_SHIFT;
>  		break;
>  	default:
> -		pr_err("incorrect PLLSAI output %d\n", output);
> +		log_err("incorrect PLLSAI output %d\n", output);
>  		return -EINVAL;
>  	}
>  
> @@ -490,7 +491,7 @@ static ulong stm32_clk_get_rate(struct clk *clk)
>  		return (sysclk >> stm32_get_apb_shift(regs, APB2));
>  
>  	default:
> -		pr_err("clock index %ld out of range\n", clk->id);
> +		dev_err(clk->dev, "clock index %ld out of range\n", clk->id);
>  		return -EINVAL;
>  	}
>  }
> @@ -509,8 +510,9 @@ static ulong stm32_set_rate(struct clk *clk, ulong rate)
>  
>  	/* Only set_rate for LTDC clock is implemented */
>  	if (clk->id != STM32F7_APB2_CLOCK(LTDC)) {
> -		pr_err("set_rate not implemented for clock index %ld\n",
> -		       clk->id);
> +		dev_err(clk->dev,
> +			"set_rate not implemented for clock index %ld\n",
> +			clk->id);
>  		return 0;
>  	}
>  
> @@ -604,8 +606,8 @@ static int stm32_clk_enable(struct clk *clk)
>  	u32 offset = clk->id / 32;
>  	u32 bit_index = clk->id % 32;
>  
> -	debug("%s: clkid = %ld, offset from AHB1ENR is %d, bit_index = %d\n",
> -	      __func__, clk->id, offset, bit_index);
> +	dev_dbg(clk->dev, "clkid = %ld, offset from AHB1ENR is %d, bit_index = %d\n",
> +		clk->id, offset, bit_index);
>  	setbits_le32(&regs->ahb1enr + offset, BIT(bit_index));
>  
>  	return 0;
> @@ -618,7 +620,7 @@ static int stm32_clk_probe(struct udevice *dev)
>  	struct clk clk;
>  	int err;
>  
> -	debug("%s\n", __func__);
> +	dev_dbg(dev, "%s\n", __func__);
>  
>  	struct stm32_clk *priv = dev_get_priv(dev);
>  	fdt_addr_t addr;
> @@ -652,14 +654,14 @@ static int stm32_clk_probe(struct udevice *dev)
>  					&fixed_clock_dev);
>  
>  	if (err) {
> -		pr_err("Can't find fixed clock (%d)", err);
> +		dev_err(dev, "Can't find fixed clock (%d)", err);
>  		return err;
>  	}
>  
>  	err = clk_request(fixed_clock_dev, &clk);
>  	if (err) {
> -		pr_err("Can't request %s clk (%d)", fixed_clock_dev->name,
> -		       err);
> +		dev_err(dev, "Can't request %s clk (%d)",
> +			fixed_clock_dev->name, err);
>  		return err;
>  	}
>  
> @@ -673,8 +675,8 @@ static int stm32_clk_probe(struct udevice *dev)
>  	priv->hse_rate = clk_get_rate(&clk);
>  
>  	if (priv->hse_rate < 1000000) {
> -		pr_err("%s: unexpected HSE clock rate = %ld \"n", __func__,
> -		       priv->hse_rate);
> +		dev_err(dev, "unexpected HSE clock rate = %ld \"n",
> +			priv->hse_rate);
>  		return -EINVAL;
>  	}
>  
> @@ -684,8 +686,7 @@ static int stm32_clk_probe(struct udevice *dev)
>  		err = dev_read_phandle_with_args(dev, "st,syscfg", NULL, 0, 0,
>  						 &args);
>  		if (err) {
> -			debug("%s: can't find syscon device (%d)\n", __func__,
> -			      err);
> +			dev_err(dev, "can't find syscon device (%d)\n", err);
>  			return err;
>  		}
>  
> @@ -699,10 +700,10 @@ static int stm32_clk_probe(struct udevice *dev)
>  
>  static int stm32_clk_of_xlate(struct clk *clk, struct ofnode_phandle_args *args)
>  {
> -	debug("%s(clk=%p)\n", __func__, clk);
> +	dev_dbg(clk->dev, "clk=%p\n", clk);
>  
>  	if (args->args_count != 2) {
> -		debug("Invaild args_count: %d\n", args->args_count);
> +		dev_dbg(clk->dev, "Invaild args_count: %d\n", args->args_count);
>  		return -EINVAL;
>  	}
>  

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
