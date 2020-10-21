Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3CF294C97
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 14:28:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3CC3C3FAE0;
	Wed, 21 Oct 2020 12:28:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABB8DC3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 12:28:29 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LCS6xc017101; Wed, 21 Oct 2020 14:28:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=MnYvY9nIZQQGd+kCYidIHfObeG391bziId1/BO4MVSU=;
 b=mgISK/9t00Gteuhbx3s9qADc9teeCfzj3Y3eZMmRiXvI8c36ZsgsFfmhYEIh0LkvYfUx
 g2/NMiDdwZ4nleVrr/V1Aj9yaXz9ldvjRXD4ymNT6/aweJy+2Dpd7rte+bVqjUqy7QfP
 LDMo3UyoBc02CGyl01pn0OVlCXxWOz+LPSvFSV+z1EGCjl2F3ZT6KMr0kzqmMm+8w/01
 Q5SvBZKrWJfHPhG2QlIFV3o9X/JT6VJpNpy53WlDLe8dZKPq5CmNKbr9Eutvxa6ssEvD
 Q6fwNh2lxRB5H8YgvFk9JKe8vJx592D5EKqi5hfEcKkbRPd2mXrirxi/QJ0koD3oexSs 4g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347p30t2tp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 14:28:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6036A10002A;
 Wed, 21 Oct 2020 14:28:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4C8D12E845E;
 Wed, 21 Oct 2020 14:28:28 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 14:28:27 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 14:28:27 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 17/33] clk: stm32mp1: migrate trace to dev and log macro
Thread-Index: AQHWogrImJen2reX+kOuemYu6s87WKmh5buA
Date: Wed, 21 Oct 2020 12:28:27 +0000
Message-ID: <7474a841-3b0a-0982-9ecf-512e953d9fcb@st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
 <20201014091646.4233-18-patrick.delaunay@st.com>
In-Reply-To: <20201014091646.4233-18-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <87FC369A9F4ABC4A8023CC3C78CF957F@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_05:2020-10-20,
 2020-10-21 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 17/33] clk: stm32mp1: migrate trace to dev
	and log macro
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
>  drivers/clk/clk_stm32mp1.c | 147 ++++++++++++++++++-------------------
>  1 file changed, 71 insertions(+), 76 deletions(-)
>
> diff --git a/drivers/clk/clk_stm32mp1.c b/drivers/clk/clk_stm32mp1.c
> index c8840b9e5f..aca4db9946 100644
> --- a/drivers/clk/clk_stm32mp1.c
> +++ b/drivers/clk/clk_stm32mp1.c
> @@ -3,6 +3,8 @@
>   * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
>   */
>  
> +#define LOG_CATEGORY UCLASS_CLK
> +
>  #include <common.h>
>  #include <clk-uclass.h>
>  #include <div64.h>
> @@ -14,12 +16,13 @@
>  #include <syscon.h>
>  #include <time.h>
>  #include <vsprintf.h>
> -#include <linux/bitops.h>
> -#include <linux/io.h>
> -#include <linux/iopoll.h>
>  #include <asm/arch/sys_proto.h>
> +#include <dm/device_compat.h>
>  #include <dt-bindings/clock/stm32mp1-clks.h>
>  #include <dt-bindings/clock/stm32mp1-clksrc.h>
> +#include <linux/bitops.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
>  
>  DECLARE_GLOBAL_DATA_PTR;
>  
> @@ -781,7 +784,7 @@ static const struct stm32mp1_clk_data stm32mp1_data = {
>  static ulong stm32mp1_clk_get_fixed(struct stm32mp1_clk_priv *priv, int idx)
>  {
>  	if (idx >= NB_OSC) {
> -		debug("%s: clk id %d not found\n", __func__, idx);
> +		log_debug("clk id %d not found\n", idx);
>  		return 0;
>  	}
>  
> @@ -799,7 +802,7 @@ static int stm32mp1_clk_get_id(struct stm32mp1_clk_priv *priv, unsigned long id)
>  	}
>  
>  	if (i == nb_clks) {
> -		printf("%s: clk id %d not found\n", __func__, (u32)id);
> +		log_err("clk id %d not found\n", (u32)id);
>  		return -EINVAL;
>  	}
>  
> @@ -812,8 +815,7 @@ static int stm32mp1_clk_get_sel(struct stm32mp1_clk_priv *priv,
>  	const struct stm32mp1_clk_gate *gate = priv->data->gate;
>  
>  	if (gate[i].sel > _PARENT_SEL_NB) {
> -		printf("%s: parents for clk id %d not found\n",
> -		       __func__, i);
> +		log_err("parents for clk id %d not found\n", i);
>  		return -EINVAL;
>  	}
>  
> @@ -858,17 +860,14 @@ static int stm32mp1_clk_get_parent(struct stm32mp1_clk_priv *priv,
>  	p = (readl(priv->base + sel[s].offset) >> sel[s].src) & sel[s].msk;
>  
>  	if (p < sel[s].nb_parent) {
> -#ifdef DEBUG
> -		debug("%s: %s clock is the parent %s of clk id %d\n", __func__,
> -		      stm32mp1_clk_parent_name[sel[s].parent[p]],
> -		      stm32mp1_clk_parent_sel_name[s],
> -		      (u32)id);
> -#endif
> +		log_content("%s clock is the parent %s of clk id %d\n",
> +			    stm32mp1_clk_parent_name[sel[s].parent[p]],
> +			    stm32mp1_clk_parent_sel_name[s],
> +			    (u32)id);
>  		return sel[s].parent[p];
>  	}
>  
> -	pr_err("%s: no parents defined for clk id %d\n",
> -	       __func__, (u32)id);
> +	log_err("no parents defined for clk id %d\n", (u32)id);
>  
>  	return -EINVAL;
>  }
> @@ -1124,7 +1123,7 @@ static ulong stm32mp1_clk_get(struct stm32mp1_clk_priv *priv, int p)
>  		if (!uclass_get_device_by_name(UCLASS_CLK, "ck_dsi_phy",
>  					       &dev)) {
>  			if (clk_request(dev, &clk)) {
> -				pr_err("ck_dsi_phy request");
> +				log_err("ck_dsi_phy request");
>  			} else {
>  				clk.id = 0;
>  				clock = clk_get_rate(&clk);
> @@ -1136,8 +1135,7 @@ static ulong stm32mp1_clk_get(struct stm32mp1_clk_priv *priv, int p)
>  		break;
>  	}
>  
> -	debug("%s(%d) clock = %lx : %ld kHz\n",
> -	      __func__, p, clock, clock / 1000);
> +	log_debug("id=%d clock = %lx : %ld kHz\n", p, clock, clock / 1000);
>  
>  	return clock;
>  }
> @@ -1156,7 +1154,7 @@ static int stm32mp1_clk_enable(struct clk *clk)
>  	else
>  		setbits_le32(priv->base + gate[i].offset, BIT(gate[i].bit));
>  
> -	debug("%s: id clock %d has been enabled\n", __func__, (u32)clk->id);
> +	dev_dbg(clk->dev, "%s: id clock %d has been enabled\n", __func__, (u32)clk->id);
>  
>  	return 0;
>  }
> @@ -1177,7 +1175,7 @@ static int stm32mp1_clk_disable(struct clk *clk)
>  	else
>  		clrbits_le32(priv->base + gate[i].offset, BIT(gate[i].bit));
>  
> -	debug("%s: id clock %d has been disabled\n", __func__, (u32)clk->id);
> +	dev_dbg(clk->dev, "%s: id clock %d has been disabled\n", __func__, (u32)clk->id);
>  
>  	return 0;
>  }
> @@ -1193,10 +1191,9 @@ static ulong stm32mp1_clk_get_rate(struct clk *clk)
>  
>  	rate = stm32mp1_clk_get(priv, p);
>  
> -#ifdef DEBUG
> -	debug("%s: computed rate for id clock %d is %d (parent is %s)\n",
> -	      __func__, (u32)clk->id, (u32)rate, stm32mp1_clk_parent_name[p]);
> -#endif
> +	dev_vdbg(clk->dev, "computed rate for id clock %d is %d (parent is %s)\n",
> +		 (u32)clk->id, (u32)rate, stm32mp1_clk_parent_name[p]);
> +
>  	return rate;
>  }
>  
> @@ -1335,7 +1332,7 @@ static int stm32mp1_pll1_opp(struct stm32mp1_clk_priv *priv, int clksrc,
>  
>  	ret = stm32mp1_get_max_opp_freq(priv, &output_freq);
>  	if (ret) {
> -		debug("PLL1 OPP configuration not found (%d).\n", ret);
> +		log_debug("PLL1 OPP configuration not found (%d).\n", ret);
>  		return ret;
>  	}
>  
> @@ -1440,8 +1437,8 @@ static int stm32mp1_osc_wait(int enable, fdt_addr_t rcc, u32 offset,
>  				 TIMEOUT_1S);
>  
>  	if (ret)
> -		pr_err("OSC %x @ %x timeout for enable=%d : 0x%x\n",
> -		       mask_rdy, address, enable, readl(address));
> +		log_err("OSC %x @ %x timeout for enable=%d : 0x%x\n",
> +			mask_rdy, address, enable, readl(address));
>  
>  	return ret;
>  }
> @@ -1529,8 +1526,8 @@ static int stm32mp1_set_hsidiv(fdt_addr_t rcc, u8 hsidiv)
>  				 val & RCC_OCRDYR_HSIDIVRDY,
>  				 TIMEOUT_200MS);
>  	if (ret)
> -		pr_err("HSIDIV failed @ 0x%x: 0x%x\n",
> -		       address, readl(address));
> +		log_err("HSIDIV failed @ 0x%x: 0x%x\n",
> +			address, readl(address));
>  
>  	return ret;
>  }
> @@ -1546,7 +1543,7 @@ static int stm32mp1_hsidiv(fdt_addr_t rcc, ulong hsifreq)
>  			break;
>  
>  	if (hsidiv == 4) {
> -		pr_err("clk-hsi frequency invalid");
> +		log_err("clk-hsi frequency invalid");
>  		return -1;
>  	}
>  
> @@ -1577,8 +1574,8 @@ static int pll_output(struct stm32mp1_clk_priv *priv, int pll_id, int output)
>  				 TIMEOUT_200MS);
>  
>  	if (ret) {
> -		pr_err("PLL%d start failed @ 0x%x: 0x%x\n",
> -		       pll_id, pllxcr, readl(pllxcr));
> +		log_err("PLL%d start failed @ 0x%x: 0x%x\n",
> +			pll_id, pllxcr, readl(pllxcr));
>  		return ret;
>  	}
>  
> @@ -1640,7 +1637,7 @@ static int pll_config(struct stm32mp1_clk_priv *priv, int pll_id,
>  
>  	if (refclk < (stm32mp1_pll[type].refclk_min * 1000000) ||
>  	    refclk > (stm32mp1_pll[type].refclk_max * 1000000)) {
> -		debug("invalid refclk = %x\n", (u32)refclk);
> +		log_err("invalid refclk = %x\n", (u32)refclk);
>  		return -EINVAL;
>  	}
>  	if (type == PLL_800 && refclk >= 8000000)
> @@ -1736,7 +1733,7 @@ static  __maybe_unused int pll_set_rate(struct udevice *dev,
>  	divn = (value >> 13) - 1;
>  	if (divn < DIVN_MIN ||
>  	    divn > stm32mp1_pll[type].divn_max) {
> -		pr_err("divn invalid = %d", divn);
> +		dev_err(dev, "divn invalid = %d", divn);
>  		return -EINVAL;
>  	}
>  	fracv = value - ((divn + 1) << 13);
> @@ -1761,8 +1758,8 @@ static int set_clksrc(struct stm32mp1_clk_priv *priv, unsigned int clksrc)
>  	ret = readl_poll_timeout(address, val, val & RCC_SELR_SRCRDY,
>  				 TIMEOUT_200MS);
>  	if (ret)
> -		pr_err("CLKSRC %x start failed @ 0x%x: 0x%x\n",
> -		       clksrc, address, readl(address));
> +		log_err("CLKSRC %x start failed @ 0x%x: 0x%x\n",
> +			clksrc, address, readl(address));
>  
>  	return ret;
>  }
> @@ -1781,7 +1778,7 @@ static void stgen_config(struct stm32mp1_clk_priv *priv)
>  	if (cntfid0 != rate) {
>  		u64 counter;
>  
> -		pr_debug("System Generic Counter (STGEN) update\n");
> +		log_debug("System Generic Counter (STGEN) update\n");
>  		clrbits_le32(stgenc + STGENC_CNTCR, STGENC_CNTCR_EN);
>  		counter = (u64)readl(stgenc + STGENC_CNTCVL);
>  		counter |= ((u64)(readl(stgenc + STGENC_CNTCVU))) << 32;
> @@ -1807,8 +1804,8 @@ static int set_clkdiv(unsigned int clkdiv, u32 address)
>  	ret = readl_poll_timeout(address, val, val & RCC_DIVR_DIVRDY,
>  				 TIMEOUT_200MS);
>  	if (ret)
> -		pr_err("CLKDIV %x start failed @ 0x%x: 0x%x\n",
> -		       clkdiv, address, readl(address));
> +		log_err("CLKDIV %x start failed @ 0x%x: 0x%x\n",
> +			clkdiv, address, readl(address));
>  
>  	return ret;
>  }
> @@ -1891,13 +1888,13 @@ static int stm32mp1_clktree(struct udevice *dev)
>  	/* check mandatory field */
>  	ret = dev_read_u32_array(dev, "st,clksrc", clksrc, CLKSRC_NB);
>  	if (ret < 0) {
> -		debug("field st,clksrc invalid: error %d\n", ret);
> +		dev_dbg(dev, "field st,clksrc invalid: error %d\n", ret);
>  		return -FDT_ERR_NOTFOUND;
>  	}
>  
>  	ret = dev_read_u32_array(dev, "st,clkdiv", clkdiv, CLKDIV_NB);
>  	if (ret < 0) {
> -		debug("field st,clkdiv invalid: error %d\n", ret);
> +		dev_dbg(dev, "field st,clkdiv invalid: error %d\n", ret);
>  		return -FDT_ERR_NOTFOUND;
>  	}
>  
> @@ -1911,11 +1908,11 @@ static int stm32mp1_clktree(struct udevice *dev)
>  		pllcfg_valid[i] = ofnode_valid(node);
>  		pllcsg_set[i] = false;
>  		if (pllcfg_valid[i]) {
> -			debug("DT for PLL %d @ %s\n", i, name);
> +			dev_dbg(dev, "DT for PLL %d @ %s\n", i, name);
>  			ret = ofnode_read_u32_array(node, "cfg",
>  						    pllcfg[i], PLLCFG_NB);
>  			if (ret < 0) {
> -				debug("field cfg invalid: error %d\n", ret);
> +				dev_dbg(dev, "field cfg invalid: error %d\n", ret);
>  				return -FDT_ERR_NOTFOUND;
>  			}
>  			pllfracv[i] = ofnode_read_u32_default(node, "frac", 0);
> @@ -1925,30 +1922,30 @@ static int stm32mp1_clktree(struct udevice *dev)
>  			if (!ret) {
>  				pllcsg_set[i] = true;
>  			} else if (ret != -FDT_ERR_NOTFOUND) {
> -				debug("invalid csg node for pll@%d res=%d\n",
> -				      i, ret);
> +				dev_dbg(dev, "invalid csg node for pll@%d res=%d\n",
> +					i, ret);
>  				return ret;
>  			}
>  		} else if (i == _PLL1)	{
>  			/* use OPP for PLL1 for A7 CPU */
> -			debug("DT for PLL %d with OPP\n", i);
> +			dev_dbg(dev, "DT for PLL %d with OPP\n", i);
>  			ret = stm32mp1_pll1_opp(priv,
>  						clksrc[CLKSRC_PLL12],
>  						pllcfg[i],
>  						&pllfracv[i]);
>  			if (ret) {
> -				debug("PLL %d with OPP error = %d\n", i, ret);
> +				dev_dbg(dev, "PLL %d with OPP error = %d\n", i, ret);
>  				return ret;
>  			}
>  			pllcfg_valid[i] = true;
>  		}
>  	}
>  
> -	debug("configuration MCO\n");
> +	dev_dbg(dev, "configuration MCO\n");
>  	stm32mp1_mco_csg(priv, clksrc[CLKSRC_MCO1], clkdiv[CLKDIV_MCO1]);
>  	stm32mp1_mco_csg(priv, clksrc[CLKSRC_MCO2], clkdiv[CLKDIV_MCO2]);
>  
> -	debug("switch ON osillator\n");
> +	dev_dbg(dev, "switch ON osillator\n");
>  	/*
>  	 * switch ON oscillator found in device-tree,
>  	 * HSI already ON after bootrom
> @@ -1986,24 +1983,24 @@ static int stm32mp1_clktree(struct udevice *dev)
>  	stm32mp1_csi_set(rcc, 1);
>  
>  	/* come back to HSI */
> -	debug("come back to HSI\n");
> +	dev_dbg(dev, "come back to HSI\n");
>  	set_clksrc(priv, CLK_MPU_HSI);
>  	set_clksrc(priv, CLK_AXI_HSI);
>  	set_clksrc(priv, CLK_MCU_HSI);
>  
> -	debug("pll stop\n");
> +	dev_dbg(dev, "pll stop\n");
>  	for (i = 0; i < _PLL_NB; i++)
>  		pll_stop(priv, i);
>  
>  	/* configure HSIDIV */
> -	debug("configure HSIDIV\n");
> +	dev_dbg(dev, "configure HSIDIV\n");
>  	if (priv->osc[_HSI]) {
>  		stm32mp1_hsidiv(rcc, priv->osc[_HSI]);
>  		stgen_config(priv);
>  	}
>  
>  	/* select DIV */
> -	debug("select DIV\n");
> +	dev_dbg(dev, "select DIV\n");
>  	/* no ready bit when MPUSRC != CLK_MPU_PLL1P_DIV, MPUDIV is disabled */
>  	writel(clkdiv[CLKDIV_MPU] & RCC_DIVR_DIV_MASK, rcc + RCC_MPCKDIVR);
>  	set_clkdiv(clkdiv[CLKDIV_AXI], rcc + RCC_AXIDIVR);
> @@ -2018,17 +2015,17 @@ static int stm32mp1_clktree(struct udevice *dev)
>  	writel(clkdiv[CLKDIV_RTC] & RCC_DIVR_DIV_MASK, rcc + RCC_RTCDIVR);
>  
>  	/* configure PLLs source */
> -	debug("configure PLLs source\n");
> +	dev_dbg(dev, "configure PLLs source\n");
>  	set_clksrc(priv, clksrc[CLKSRC_PLL12]);
>  	set_clksrc(priv, clksrc[CLKSRC_PLL3]);
>  	set_clksrc(priv, clksrc[CLKSRC_PLL4]);
>  
>  	/* configure and start PLLs */
> -	debug("configure PLLs\n");
> +	dev_dbg(dev, "configure PLLs\n");
>  	for (i = 0; i < _PLL_NB; i++) {
>  		if (!pllcfg_valid[i])
>  			continue;
> -		debug("configure PLL %d\n", i);
> +		dev_dbg(dev, "configure PLL %d\n", i);
>  		pll_config(priv, i, pllcfg[i], pllfracv[i]);
>  		if (pllcsg_set[i])
>  			pll_csg(priv, i, pllcsg[i]);
> @@ -2039,7 +2036,7 @@ static int stm32mp1_clktree(struct udevice *dev)
>  	for (i = 0; i < _PLL_NB; i++) {
>  		if (!pllcfg_valid[i])
>  			continue;
> -		debug("output PLL %d\n", i);
> +		dev_dbg(dev, "output PLL %d\n", i);
>  		pll_output(priv, i, pllcfg[i][PLLCFG_O]);
>  	}
>  
> @@ -2048,14 +2045,14 @@ static int stm32mp1_clktree(struct udevice *dev)
>  		stm32mp1_lse_wait(rcc);
>  
>  	/* configure with expected clock source */
> -	debug("CLKSRC\n");
> +	dev_dbg(dev, "CLKSRC\n");
>  	set_clksrc(priv, clksrc[CLKSRC_MPU]);
>  	set_clksrc(priv, clksrc[CLKSRC_AXI]);
>  	set_clksrc(priv, clksrc[CLKSRC_MCU]);
>  	set_rtcsrc(priv, clksrc[CLKSRC_RTC], lse_css);
>  
>  	/* configure PKCK */
> -	debug("PKCK\n");
> +	dev_dbg(dev, "PKCK\n");
>  	pkcs_cell = dev_read_prop(dev, "st,pkcs", &len);
>  	if (pkcs_cell) {
>  		bool ckper_disabled = false;
> @@ -2081,7 +2078,7 @@ static int stm32mp1_clktree(struct udevice *dev)
>  	/* STGEN clock source can change with CLK_STGEN_XXX */
>  	stgen_config(priv);
>  
> -	debug("oscillator off\n");
> +	dev_dbg(dev, "oscillator off\n");
>  	/* switch OFF HSI if not found in device-tree */
>  	if (!priv->osc[_HSI])
>  		stm32mp1_hsi_set(rcc, 0);
> @@ -2147,14 +2144,12 @@ static ulong stm32mp1_clk_set_rate(struct clk *clk, unsigned long clk_rate)
>  	case DSI_PX:
>  		break;
>  	default:
> -		pr_err("not supported");
> +		dev_err(clk->dev, "Set of clk %ld not supported", clk->id);
>  		return -EINVAL;
>  	}
>  
>  	p = stm32mp1_clk_get_parent(priv, clk->id);
> -#ifdef DEBUG
> -	debug("%s: parent = %d:%s\n", __func__, p, stm32mp1_clk_parent_name[p]);
> -#endif
> +	dev_vdbg(clk->dev, "parent = %d:%s\n", p, stm32mp1_clk_parent_name[p]);
>  	if (p < 0)
>  		return -EINVAL;
>  
> @@ -2192,7 +2187,7 @@ static void stm32mp1_osc_clk_init(const char *name,
>  	clk.id = 0;
>  	if (!uclass_get_device_by_name(UCLASS_CLK, name, &dev)) {
>  		if (clk_request(dev, &clk))
> -			pr_err("%s request", name);
> +			log_err("%s request", name);
>  		else
>  			priv->osc[index] = clk_get_rate(&clk);
>  	}
> @@ -2214,7 +2209,7 @@ static void stm32mp1_osc_init(struct udevice *dev)
>  
>  	for (i = 0; i < NB_OSC; i++) {
>  		stm32mp1_osc_clk_init(name[i], priv, i);
> -		debug("%d: %s => %x\n", i, name[i], (u32)priv->osc[i]);
> +		dev_dbg(dev, "%d: %s => %x\n", i, name[i], (u32)priv->osc[i]);
>  	}
>  }
>  
> @@ -2288,11 +2283,11 @@ static int stm32mp1_clk_probe(struct udevice *dev)
>  	if (!(gd->flags & GD_FLG_RELOC))
>  		result = stm32mp1_clktree(dev);
>  	if (result)
> -		printf("clock tree initialization failed (%d)\n", result);
> +		dev_err(dev, "clock tree initialization failed (%d)\n", result);
>  #endif
>  
>  #ifndef CONFIG_SPL_BUILD
> -#if defined(DEBUG)
> +#if defined(VERBOSE_DEBUG)
>  	/* display debug information for probe after relocation */
>  	if (gd->flags & GD_FLG_RELOC)
>  		stm32mp1_clk_dump(priv);
> @@ -2306,14 +2301,14 @@ static int stm32mp1_clk_probe(struct udevice *dev)
>  	if (gd->flags & GD_FLG_RELOC) {
>  		char buf[32];
>  
> -		printf("Clocks:\n");
> -		printf("- MPU : %s MHz\n", strmhz(buf, gd->cpu_clk));
> -		printf("- MCU : %s MHz\n",
> -		       strmhz(buf, stm32mp1_clk_get(priv, _CK_MCU)));
> -		printf("- AXI : %s MHz\n", strmhz(buf, gd->bus_clk));
> -		printf("- PER : %s MHz\n",
> -		       strmhz(buf, stm32mp1_clk_get(priv, _CK_PER)));
> -		printf("- DDR : %s MHz\n", strmhz(buf, gd->mem_clk));
> +		log_info("Clocks:\n");
> +		log_info("- MPU : %s MHz\n", strmhz(buf, gd->cpu_clk));
> +		log_info("- MCU : %s MHz\n",
> +			 strmhz(buf, stm32mp1_clk_get(priv, _CK_MCU)));
> +		log_info("- AXI : %s MHz\n", strmhz(buf, gd->bus_clk));
> +		log_info("- PER : %s MHz\n",
> +			 strmhz(buf, stm32mp1_clk_get(priv, _CK_PER)));
> +		log_info("- DDR : %s MHz\n", strmhz(buf, gd->mem_clk));
>  	}
>  #endif /* CONFIG_DISPLAY_CPUINFO */
>  #endif

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
