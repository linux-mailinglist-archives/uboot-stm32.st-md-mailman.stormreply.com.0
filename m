Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D6B78D6E5
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Aug 2023 17:18:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCDFEC6B444;
	Wed, 30 Aug 2023 15:18:31 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10C44C6B442
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Aug 2023 15:18:30 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4AF8F863DD;
 Wed, 30 Aug 2023 17:18:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1693408710;
 bh=bfhiaHdMu59TbFvbRiQ6frHt46FeRhSnbc2XVscnafQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kaYU3qObJ3MsAuK2twVfH20G1IMT7EHTrAMwenI9rxbJ5MhumTuCSaaJjtqU2Opi3
 T+0nbLHP3T5Ae8tdzCBV86VK25Ik8mK++982/FnmlKIbW8Prh7h1hpnyBlrwuyMujU
 mSx8AT6DCNdkYBKw/FSJBquVqWr5B55QYFWqA0MWv2wQ9IzUzYoelnIMP1qaWOdl9f
 UnosRB7DXh3ftqg4Ye/XB5tOKVNJYGlYv3ScOc/Hj/6S08mkelH3hab05HfvlerFUI
 SyQMhaU/Xgx+6dHh2rffq3kMxHnjm7EP12FHz1UXVcFN57oIQZIU62f4PkdT3omOAR
 oldmzrqyYDbuA==
Message-ID: <84041468-abf2-9b68-6701-6605f4948bf5@denx.de>
Date: Wed, 30 Aug 2023 17:18:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, u-boot@lists.denx.de
References: <20230830080150.473374-1-fabrice.gasnier@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230830080150.473374-1-fabrice.gasnier@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] usb: host: ohci-generic: Make usage of
 clock/reset bulk() API
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

On 8/30/23 10:01, Fabrice Gasnier wrote:
> Make usage of clock and reset bulk API in order to simplify the code
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> 
>   drivers/usb/host/ohci-generic.c | 92 +++++++++++----------------------
>   1 file changed, 29 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-generic.c b/drivers/usb/host/ohci-generic.c
> index 2d8d38ce9a40..95aa608d8c19 100644
> --- a/drivers/usb/host/ohci-generic.c
> +++ b/drivers/usb/host/ohci-generic.c
> @@ -16,75 +16,41 @@
>   
>   struct generic_ohci {
>   	ohci_t ohci;
> -	struct clk *clocks;	/* clock list */
> -	struct reset_ctl *resets; /* reset list */
> +	struct clk_bulk clocks;	/* clock list */
> +	struct reset_ctl_bulk resets; /* reset list */
>   	struct phy phy;
> -	int clock_count;	/* number of clock in clock list */
> -	int reset_count;	/* number of reset in reset list */
>   };
>   
>   static int ohci_usb_probe(struct udevice *dev)
>   {
>   	struct ohci_regs *regs = dev_read_addr_ptr(dev);
>   	struct generic_ohci *priv = dev_get_priv(dev);
> -	int i, err, ret, clock_nb, reset_nb;
> -
> -	err = 0;
> -	priv->clock_count = 0;
> -	clock_nb = dev_count_phandle_with_args(dev, "clocks", "#clock-cells",
> -					       0);
> -	if (clock_nb > 0) {
> -		priv->clocks = devm_kcalloc(dev, clock_nb, sizeof(struct clk),
> -					    GFP_KERNEL);
> -		if (!priv->clocks)
> -			return -ENOMEM;
> -
> -		for (i = 0; i < clock_nb; i++) {
> -			err = clk_get_by_index(dev, i, &priv->clocks[i]);
> -			if (err < 0)
> -				break;
> -
> -			err = clk_enable(&priv->clocks[i]);
> -			if (err && err != -ENOSYS) {
> -				dev_err(dev, "failed to enable clock %d\n", i);
> -				clk_free(&priv->clocks[i]);
> -				goto clk_err;
> -			}
> -			priv->clock_count++;
> -		}
> -	} else if (clock_nb != -ENOENT) {
> -		dev_err(dev, "failed to get clock phandle(%d)\n", clock_nb);
> -		return clock_nb;
> +	int err, ret;
> +
> +	ret = clk_get_bulk(dev, &priv->clocks);
> +	if (ret && ret != -ENOENT) {
> +		dev_err(dev, "Failed to get clocks (ret=%d)\n", ret);

Plural of 'clock' is still 'clock' , please fix just the text, keep the 
variable name .

> +		return ret;
> +	}
> +
> +	err = clk_enable_bulk(&priv->clocks);
> +	if (err) {
> +		dev_err(dev, "Failed to enable clocks (err=%d)\n", err);

DTTO here

> +		goto clk_err;
>   	}
>   
> -	priv->reset_count = 0;
> -	reset_nb = dev_count_phandle_with_args(dev, "resets", "#reset-cells",
> -					       0);
> -	if (reset_nb > 0) {
> -		priv->resets = devm_kcalloc(dev, reset_nb,
> -					    sizeof(struct reset_ctl),
> -					    GFP_KERNEL);
> -		if (!priv->resets)
> -			return -ENOMEM;
> -
> -		for (i = 0; i < reset_nb; i++) {
> -			err = reset_get_by_index(dev, i, &priv->resets[i]);
> -			if (err < 0)
> -				break;
> -
> -			err = reset_deassert(&priv->resets[i]);
> -			if (err) {
> -				dev_err(dev, "failed to deassert reset %d\n", i);
> -				reset_free(&priv->resets[i]);
> -				goto reset_err;
> -			}
> -			priv->reset_count++;
> -		}
> -	} else if (reset_nb != -ENOENT) {
> -		dev_err(dev, "failed to get reset phandle(%d)\n", reset_nb);
> +	err = reset_get_bulk(dev, &priv->resets);
> +	if (err && err != -ENOENT) {
> +		dev_err(dev, "failed to get resets (err=%d)\n", err);
>   		goto clk_err;
>   	}
>   
> +	err = reset_deassert_bulk(&priv->resets);
> +	if (err) {
> +		dev_err(dev, "failed to get deassert resets (err=%d)\n", err);

Drop the 'get' from the text here, I think it's copy-paste error.

> +		goto reset_err;
> +	}
> +
>   	err = generic_setup_phy(dev, &priv->phy, 0);
>   	if (err)
>   		goto reset_err;

With that fixed:

Reviewed-by: Marek Vasut <marex@denx.de>

Nice cleanup, thanks !
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
