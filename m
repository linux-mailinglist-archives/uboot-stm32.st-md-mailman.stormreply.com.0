Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E55AA51EF0F
	for <lists+uboot-stm32@lfdr.de>; Sun,  8 May 2022 20:21:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EAB6C5EC6B;
	Sun,  8 May 2022 18:21:09 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3DD3C5A4FD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  8 May 2022 18:21:07 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id o18so9589583qtk.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 08 May 2022 11:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zfOAOltfyWIJSqeg+P0dHCl7n0yrFAwAlAC9ZYR0K9w=;
 b=HZohL2SdfU2FfMXJGbaBZgQq/thgVaDvSbymZdtCBVY0SLbP8xfe/7Ca3Zzc+tUnwU
 PDNTwlfWMyclWfh5FJbhtWZVIuMMriPA7X9+Y1/FmRB77pE/mCjokuRj+P/j0lLr/ott
 e5Qni/gOsCR4cJnON3Y3561mBN5Xc9OCiLdID9nZghYFfDhyWGGztHpnOhaCkkPokhyd
 8hnt/HKvQhMT8xU9w9+6xSPz4OHT+Mn2u3qRpXVi5pcZB0jc6CeK41maGFWUQYHnsklT
 7F/ihz5StlUK3MTAasfnrBjO6KQG34xLj4XQL+WWHEyQ/6+kahZgq4se7FZ44Zx58PDw
 PsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zfOAOltfyWIJSqeg+P0dHCl7n0yrFAwAlAC9ZYR0K9w=;
 b=Kc0EynYXvVI+gy67yXVuBrB2xfdMEjgBe99Jn9YczwEZNBDMf/jHUoz77QFo8mdFvq
 Z9HFm0zHtSijZHxPnMxtH3x9a5Fh5ArpB2v3pJq0reI1Gp9dblxL76//uj2HQ7DEit9L
 9sgq5GATtlajUyjpWXoyVeBs8RDm1epl+JafXTWq3DhWiaiz/+dC6BwGdfnRNJh0PIhX
 j/Hlv7ruN1o6ViAWBqOihtiqnoDc6kFKjm4JsaF9QYq4ZrAtDB6yAq5jO2Ixkai2aWtP
 P90MFx5oPunucNUanEvLIv9NINy5E0lsNiG7vWePtYZkQvrNGiAMz/+aQ/czlN8LaC3R
 1STg==
X-Gm-Message-State: AOAM53255kj5sxxv1aUqugWiNhfhnHaGDLYFfRp5WCXbt7UfIKG1ez2b
 kxm3+sAz/f8zuLZg+DCIrdd78Dg99AA=
X-Google-Smtp-Source: ABdhPJwHieEneMx4BTXmjayE9a0VGx1S8t7D3tPZux45cct7QENpA5NM7ggYpO7OeyI/gzqSbGDoHA==
X-Received: by 2002:ac8:5f88:0:b0:2f3:b80c:a7a4 with SMTP id
 j8-20020ac85f88000000b002f3b80ca7a4mr12354050qta.38.1652034066194; 
 Sun, 08 May 2022 11:21:06 -0700 (PDT)
Received: from [192.168.1.201] (pool-108-18-248-138.washdc.fios.verizon.net.
 [108.18.248.138]) by smtp.googlemail.com with ESMTPSA id
 o28-20020a05620a0d5c00b0069fc167df92sm5682791qkl.82.2022.05.08.11.21.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 May 2022 11:21:05 -0700 (PDT)
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20220426123750.579726-1-patrick.delaunay@foss.st.com>
 <20220426143736.1.I15bd7c3c8c983d6a6cec3d2ee371d75fe72fcd41@changeid>
From: Sean Anderson <seanga2@gmail.com>
Message-ID: <27373592-d6c9-ff00-799b-a2f04f4500b1@gmail.com>
Date: Sun, 8 May 2022 14:21:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20220426143736.1.I15bd7c3c8c983d6a6cec3d2ee371d75fe72fcd41@changeid>
Content-Language: en-US
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] phy: stm32-usbphyc: add counter of
	PLL consumer
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

On 4/26/22 8:37 AM, Patrick Delaunay wrote:
> Add the counter of the PLL user n_pll_cons managed by the 2 functions
> stm32_usbphyc_pll_enable / stm32_usbphyc_pll_disable.
> 
> This counter allow to remove the function stm32_usbphyc_is_init
> and it is a preliminary step for ck_usbo_48m introduction.

Is it necessary to disable this clock before booting to Linux? If it isn't,
then perhaps it is simpler to just not disable the clock.

--Sean

> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>   drivers/phy/phy-stm32-usbphyc.c | 76 +++++++++++++++++++++------------
>   1 file changed, 48 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/phy/phy-stm32-usbphyc.c b/drivers/phy/phy-stm32-usbphyc.c
> index 9c1dcfae52..16c8799eca 100644
> --- a/drivers/phy/phy-stm32-usbphyc.c
> +++ b/drivers/phy/phy-stm32-usbphyc.c
> @@ -65,6 +65,7 @@ struct stm32_usbphyc {
>   		bool init;
>   		bool powered;
>   	} phys[MAX_PHYS];
> +	int n_pll_cons;
>   };
>   
>   static void stm32_usbphyc_get_pll_params(u32 clk_rate,
> @@ -124,18 +125,6 @@ static int stm32_usbphyc_pll_init(struct stm32_usbphyc *usbphyc)
>   	return 0;
>   }
>   
> -static bool stm32_usbphyc_is_init(struct stm32_usbphyc *usbphyc)
> -{
> -	int i;
> -
> -	for (i = 0; i < MAX_PHYS; i++) {
> -		if (usbphyc->phys[i].init)
> -			return true;
> -	}
> -
> -	return false;
> -}
> -
>   static bool stm32_usbphyc_is_powered(struct stm32_usbphyc *usbphyc)
>   {
>   	int i;
> @@ -148,18 +137,17 @@ static bool stm32_usbphyc_is_powered(struct stm32_usbphyc *usbphyc)
>   	return false;
>   }
>   
> -static int stm32_usbphyc_phy_init(struct phy *phy)
> +static int stm32_usbphyc_pll_enable(struct stm32_usbphyc *usbphyc)
>   {
> -	struct stm32_usbphyc *usbphyc = dev_get_priv(phy->dev);
> -	struct stm32_usbphyc_phy *usbphyc_phy = usbphyc->phys + phy->id;
>   	bool pllen = readl(usbphyc->base + STM32_USBPHYC_PLL) & PLLEN ?
>   		     true : false;
>   	int ret;
>   
> -	dev_dbg(phy->dev, "phy ID = %lu\n", phy->id);
> -	/* Check if one phy port has already configured the pll */
> -	if (pllen && stm32_usbphyc_is_init(usbphyc))
> -		goto initialized;
> +	/* Check if one consumer has already configured the pll */
> +	if (pllen && usbphyc->n_pll_cons) {
> +		usbphyc->n_pll_cons++;
> +		return 0;
> +	}
>   
>   	if (usbphyc->vdda1v1) {
>   		ret = regulator_set_enable(usbphyc->vdda1v1, true);
> @@ -190,23 +178,19 @@ static int stm32_usbphyc_phy_init(struct phy *phy)
>   	if (!(readl(usbphyc->base + STM32_USBPHYC_PLL) & PLLEN))
>   		return -EIO;
>   
> -initialized:
> -	usbphyc_phy->init = true;
> +	usbphyc->n_pll_cons++;
>   
>   	return 0;
>   }
>   
> -static int stm32_usbphyc_phy_exit(struct phy *phy)
> +static int stm32_usbphyc_pll_disable(struct stm32_usbphyc *usbphyc)
>   {
> -	struct stm32_usbphyc *usbphyc = dev_get_priv(phy->dev);
> -	struct stm32_usbphyc_phy *usbphyc_phy = usbphyc->phys + phy->id;
>   	int ret;
>   
> -	dev_dbg(phy->dev, "phy ID = %lu\n", phy->id);
> -	usbphyc_phy->init = false;
> +	usbphyc->n_pll_cons--;
>   
> -	/* Check if other phy port requires pllen */
> -	if (stm32_usbphyc_is_init(usbphyc))
> +	/* Check if other consumer requires pllen */
> +	if (usbphyc->n_pll_cons)
>   		return 0;
>   
>   	clrbits_le32(usbphyc->base + STM32_USBPHYC_PLL, PLLEN);
> @@ -235,6 +219,42 @@ static int stm32_usbphyc_phy_exit(struct phy *phy)
>   	return 0;
>   }
>   
> +static int stm32_usbphyc_phy_init(struct phy *phy)
> +{
> +	struct stm32_usbphyc *usbphyc = dev_get_priv(phy->dev);
> +	struct stm32_usbphyc_phy *usbphyc_phy = usbphyc->phys + phy->id;
> +	int ret;
> +
> +	dev_dbg(phy->dev, "phy ID = %lu\n", phy->id);
> +	if (usbphyc_phy->init)
> +		return 0;
> +
> +	ret = stm32_usbphyc_pll_enable(usbphyc);
> +	if (ret)
> +		return log_ret(ret);
> +
> +	usbphyc_phy->init = true;
> +
> +	return 0;
> +}
> +
> +static int stm32_usbphyc_phy_exit(struct phy *phy)
> +{
> +	struct stm32_usbphyc *usbphyc = dev_get_priv(phy->dev);
> +	struct stm32_usbphyc_phy *usbphyc_phy = usbphyc->phys + phy->id;
> +	int ret;
> +
> +	dev_dbg(phy->dev, "phy ID = %lu\n", phy->id);
> +	if (!usbphyc_phy->init)
> +		return 0;
> +
> +	ret = stm32_usbphyc_pll_disable(usbphyc);
> +
> +	usbphyc_phy->init = false;
> +
> +	return log_ret(ret);
> +}
> +
>   static int stm32_usbphyc_phy_power_on(struct phy *phy)
>   {
>   	struct stm32_usbphyc *usbphyc = dev_get_priv(phy->dev);
> 

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
