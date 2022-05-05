Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BAE51C125
	for <lists+uboot-stm32@lfdr.de>; Thu,  5 May 2022 15:44:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B941C6047D;
	Thu,  5 May 2022 13:44:53 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8846FC5F1F1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 May 2022 13:44:51 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id BC02683D7D;
 Thu,  5 May 2022 15:44:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1651758291;
 bh=P+IBEUHb/MQrCuc8muZcbBfRldYqxRd1EZ45bu/YY6w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lm64nekNz0QMAnXurhW0PUxQl8ax+aSqqTg0Z/U8uaF/81Eb6oD6OdYkvd6GuzsQn
 tsokpfgn4CHKE3B2q3B5lzsMRDX0lV7/sha5aVfwALytfX//z8HjLQ+DjeC8UXo/Ty
 ZZ+lPOReFM/uiXWIoHQkKeYhwIZE6RbKIB11T9QHRLkT1mYteRpI5/RH24dG4aYLiA
 botvto1nc6ewNQozgqPzdgIAuMINGVosn+MEQNsJGL1i+nKFNOuYUjD/AZPo4osfI6
 5ZcIUHteFt+elrCqpKfxShf6Qh5FfgSOu0HXIVZaL2ahIlYbGKXdncJpf/hVwB3glD
 vrREgZRvMaBVg==
Message-ID: <40514ed1-9899-059f-0010-eb6b972c217a@denx.de>
Date: Thu, 5 May 2022 15:44:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20220505151756.1.Ia5711b14a17cf1d042bdab9d3f28437d5c53272c@changeid>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220505151756.1.Ia5711b14a17cf1d042bdab9d3f28437d5c53272c@changeid>
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] usb: host: ehci-generic: Make usage
 of clock/reset bulk() API
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

On 5/5/22 15:17, Patrice Chotard wrote:

[...]

> @@ -81,68 +79,31 @@ static int ehci_usb_probe(struct udevice *dev)
>   	struct generic_ehci *priv = dev_get_priv(dev);
>   	struct ehci_hccr *hccr;
>   	struct ehci_hcor *hcor;
> -	int i, err, ret, clock_nb, reset_nb;
> +	int err, ret;
>   
>   	err = 0;
> -	priv->clock_count = 0;
> -	clock_nb = ofnode_count_phandle_with_args(dev_ofnode(dev), "clocks",
> -						  "#clock-cells", 0);
> -	if (clock_nb > 0) {
> -		priv->clocks = devm_kcalloc(dev, clock_nb, sizeof(struct clk),
> -					    GFP_KERNEL);
> -		if (!priv->clocks)
> -			return -ENOMEM;
> -
> -		for (i = 0; i < clock_nb; i++) {
> -			err = clk_get_by_index(dev, i, &priv->clocks[i]);
> -
> -			if (err < 0)
> -				break;
> -			err = clk_enable(&priv->clocks[i]);
> -			if (err && err != -ENOSYS) {
> -				dev_err(dev, "failed to enable clock %d\n", i);
> -				clk_free(&priv->clocks[i]);
> -				goto clk_err;
> -			}
> -			priv->clock_count++;
> -		}
> -	} else {
> -		if (clock_nb != -ENOENT) {
> -			dev_err(dev, "failed to get clock phandle(%d)\n",
> -				clock_nb);
> -			return clock_nb;
> -		}
> +	ret = clk_get_bulk(dev, &priv->clocks);
> +	if (ret) {
> +		dev_err(dev, "Failed to get clocks\n");

Print the error code in the error message, so the user can immediately 
determine what went wrong without rebuilding the code with extra debug 
prints (and that goes for other messages and other drivers too, the 
error code is useful there).

dev_err(dev, "Failed to get clocks (ret=%d)\n", ret);

[...]
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
