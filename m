Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA353325FC
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Mar 2021 14:02:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78352C57195;
	Tue,  9 Mar 2021 13:02:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47780C57183
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 13:02:50 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129CuCRR020430; Tue, 9 Mar 2021 14:02:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=slql2Vxle+fBzX+g0wBYaY+vD9X27MiDJGJJWwJVj+w=;
 b=QQILOgAnHYaATFoxptFplR2q+cbPUIoUzu8BAejOTWrRDCUkEqe7CI2Vx4sS8UC6TlvL
 iLIJsemKBJ76wCBXwMUV7SX74h6jxvwsVcHYqMFF0pGJ+7RT7Ii6tXiAaGOujKpEL4tk
 UYQ05SvUKfx1I3rapH2gEPrPWi1NbstJ6GW8HlAuLY+X/m88+oYuyqVNY/VYHDJUUjkH
 w0oTV0XzmjcNYF2YKawf+KLToXgsDwUu62/33xx2cZIaTW6lX3RBGbe88T0vuc7KMYH+
 QKvSah7gvQSOnMK/Hw2JjUeAzlgmI1uici/ZxUdZR2Il2dO9JqXfpG0iDoMj97YZqxok mQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3741y6sc8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 14:02:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6703E10002A;
 Tue,  9 Mar 2021 14:02:47 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 59F3B258C4E;
 Tue,  9 Mar 2021 14:02:47 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Mar
 2021 14:02:29 +0100
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210224101946.32003-1-patrick.delaunay@foss.st.com>
 <20210224111907.2.Ic47f7891c8e3621cbc40aef4ebc54355e1fcfe12@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <a5555239-038d-0a46-cecd-319b1f16da4f@foss.st.com>
Date: Tue, 9 Mar 2021 14:02:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224111907.2.Ic47f7891c8e3621cbc40aef4ebc54355e1fcfe12@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-09_11:2021-03-08,
 2021-03-09 signatures=0
Cc: Marek Vasut <marex@denx.de>, Etienne Carriere <etienne.carriere@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 2/6] clk: stm32mp1: gets root clocks from
	fdt
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

On 2/24/21 11:19 AM, Patrick Delaunay wrote:
> From: Etienne Carriere <etienne.carriere@st.com>
> 
> This change makes stm32mp1 clock driver to get the root clocks
> reference from the device node in the FDT rather than fetching
> straight these clocks by their name. Driver now stores the
> clock reference and use it to know if a root clock is present,
> get its rate or gets its related udevice reference.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  drivers/clk/clk_stm32mp1.c | 62 ++++++++++++++------------------------
>  1 file changed, 23 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/clk/clk_stm32mp1.c b/drivers/clk/clk_stm32mp1.c
> index 848e33f4e8..0c0ef366a1 100644
> --- a/drivers/clk/clk_stm32mp1.c
> +++ b/drivers/clk/clk_stm32mp1.c
> @@ -250,7 +250,7 @@ DECLARE_GLOBAL_DATA_PTR;
>  enum stm32mp1_parent_id {
>  /*
>   * _HSI, _HSE, _CSI, _LSI, _LSE should not be moved
> - * they are used as index in osc[] as entry point
> + * they are used as index in osc_clk[] as clock reference
>   */
>  	_HSI,
>  	_HSE,
> @@ -430,8 +430,7 @@ struct stm32mp1_clk_data {
>  struct stm32mp1_clk_priv {
>  	fdt_addr_t base;
>  	const struct stm32mp1_clk_data *data;
> -	ulong osc[NB_OSC];
> -	struct udevice *osc_dev[NB_OSC];
> +	struct clk osc_clk[NB_OSC];
>  };
>  
>  #define STM32MP1_CLK(off, b, idx, s)		\
> @@ -790,7 +789,7 @@ static ulong stm32mp1_clk_get_fixed(struct stm32mp1_clk_priv *priv, int idx)
>  		return 0;
>  	}
>  
> -	return priv->osc[idx];
> +	return clk_get_rate(&priv->osc_clk[idx]);
>  }
>  
>  static int stm32mp1_clk_get_id(struct stm32mp1_clk_priv *priv, unsigned long id)
> @@ -1545,7 +1544,7 @@ static int stm32mp1_hsidiv(fdt_addr_t rcc, ulong hsifreq)
>  			break;
>  
>  	if (hsidiv == 4) {
> -		log_err("clk-hsi frequency invalid");
> +		log_err("hsi frequency invalid");
>  		return -1;
>  	}
>  
> @@ -1952,13 +1951,13 @@ static int stm32mp1_clktree(struct udevice *dev)
>  	 * switch ON oscillator found in device-tree,
>  	 * HSI already ON after bootrom
>  	 */
> -	if (priv->osc[_LSI])
> +	if (clk_valid(&priv->osc_clk[_LSI]))
>  		stm32mp1_lsi_set(rcc, 1);
>  
> -	if (priv->osc[_LSE]) {
> +	if (clk_valid(&priv->osc_clk[_LSE])) {
>  		int bypass, digbyp;
>  		u32 lsedrv;
> -		struct udevice *dev = priv->osc_dev[_LSE];
> +		struct udevice *dev = priv->osc_clk[_LSE].dev;
>  
>  		bypass = dev_read_bool(dev, "st,bypass");
>  		digbyp = dev_read_bool(dev, "st,digbypass");
> @@ -1969,9 +1968,9 @@ static int stm32mp1_clktree(struct udevice *dev)
>  		stm32mp1_lse_enable(rcc, bypass, digbyp, lsedrv);
>  	}
>  
> -	if (priv->osc[_HSE]) {
> +	if (clk_valid(&priv->osc_clk[_HSE])) {
>  		int bypass, digbyp, css;
> -		struct udevice *dev = priv->osc_dev[_HSE];
> +		struct udevice *dev = priv->osc_clk[_HSE].dev;
>  
>  		bypass = dev_read_bool(dev, "st,bypass");
>  		digbyp = dev_read_bool(dev, "st,digbypass");
> @@ -1996,8 +1995,8 @@ static int stm32mp1_clktree(struct udevice *dev)
>  
>  	/* configure HSIDIV */
>  	dev_dbg(dev, "configure HSIDIV\n");
> -	if (priv->osc[_HSI]) {
> -		stm32mp1_hsidiv(rcc, priv->osc[_HSI]);
> +	if (clk_valid(&priv->osc_clk[_HSI])) {
> +		stm32mp1_hsidiv(rcc, clk_get_rate(&priv->osc_clk[_HSI]));
>  		stgen_config(priv);
>  	}
>  
> @@ -2043,7 +2042,7 @@ static int stm32mp1_clktree(struct udevice *dev)
>  	}
>  
>  	/* wait LSE ready before to use it */
> -	if (priv->osc[_LSE])
> +	if (clk_valid(&priv->osc_clk[_LSE]))
>  		stm32mp1_lse_wait(rcc);
>  
>  	/* configure with expected clock source */
> @@ -2082,7 +2081,7 @@ static int stm32mp1_clktree(struct udevice *dev)
>  
>  	dev_dbg(dev, "oscillator off\n");
>  	/* switch OFF HSI if not found in device-tree */
> -	if (!priv->osc[_HSI])
> +	if (!clk_valid(&priv->osc_clk[_HSI]))
>  		stm32mp1_hsi_set(rcc, 0);
>  
>  	/* Software Self-Refresh mode (SSR) during DDR initilialization */
> @@ -2178,40 +2177,25 @@ static ulong stm32mp1_clk_set_rate(struct clk *clk, unsigned long clk_rate)
>  	return -EINVAL;
>  }
>  
> -static void stm32mp1_osc_clk_init(const char *name,
> -				  struct stm32mp1_clk_priv *priv,
> -				  int index)
> -{
> -	struct clk clk;
> -	struct udevice *dev = NULL;
> -
> -	priv->osc[index] = 0;
> -	clk.id = 0;
> -	if (!uclass_get_device_by_name(UCLASS_CLK, name, &dev)) {
> -		if (clk_request(dev, &clk))
> -			log_err("%s request", name);
> -		else
> -			priv->osc[index] = clk_get_rate(&clk);
> -	}
> -	priv->osc_dev[index] = dev;
> -}
> -
>  static void stm32mp1_osc_init(struct udevice *dev)
>  {
>  	struct stm32mp1_clk_priv *priv = dev_get_priv(dev);
>  	int i;
>  	const char *name[NB_OSC] = {
> -		[_LSI] = "clk-lsi",
> -		[_LSE] = "clk-lse",
> -		[_HSI] = "clk-hsi",
> -		[_HSE] = "clk-hse",
> -		[_CSI] = "clk-csi",
> +		[_LSI] = "lsi",
> +		[_LSE] = "lse",
> +		[_HSI] = "hsi",
> +		[_HSE] = "hse",
> +		[_CSI] = "csi",
>  		[_I2S_CKIN] = "i2s_ckin",
>  	};
>  
>  	for (i = 0; i < NB_OSC; i++) {
> -		stm32mp1_osc_clk_init(name[i], priv, i);
> -		dev_dbg(dev, "%d: %s => %x\n", i, name[i], (u32)priv->osc[i]);
> +		if (clk_get_by_name(dev, name[i], &priv->osc_clk[i]))
> +			dev_dbg(dev, "No source clock \"%s\"", name[i]);
> +		else
> +			dev_dbg(dev, "%s clock rate: %luHz\n",
> +				name[i], clk_get_rate(&priv->osc_clk[i]));
>  	}
>  }
>  
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
