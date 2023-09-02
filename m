Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AEE791272
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Sep 2023 09:42:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AC63C6C821;
	Mon,  4 Sep 2023 07:42:57 +0000 (UTC)
Received: from mx1.tinet.cat (mx1.tinet.cat [195.77.216.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0463C6A613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Sep 2023 09:06:22 +0000 (UTC)
X-ASG-Debug-ID: 1693645581-163e7b47df389520001-idqh3N
Received: from smtp01.tinet.cat (smtp01.tinet.cat [195.77.216.131]) by
 mx1.tinet.cat with ESMTP id cZsz5rTkVHB8ckeq;
 Sat, 02 Sep 2023 11:06:21 +0200 (CEST)
X-Barracuda-Envelope-From: xdrudis@tinet.cat
X-Barracuda-Effective-Source-IP: smtp01.tinet.cat[195.77.216.131]
X-Barracuda-Apparent-Source-IP: 195.77.216.131
Received: from xdrudis.tinet.cat (42.red-79-152-186.dynamicip.rima-tde.net
 [79.152.186.42])
 by smtp01.tinet.cat (Postfix) with ESMTPSA id 37007605D0AC;
 Sat,  2 Sep 2023 11:06:21 +0200 (CEST)
Date: Sat, 2 Sep 2023 11:06:20 +0200
From: Xavier Drudis Ferran <xdrudis@tinet.cat>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZPL7DAQfE3WxCFa+@xdrudis.tinet.cat>
X-ASG-Orig-Subj: Re: [PATCH] usb: host: ohci-generic: Make usage of clock/reset
 bulk() API
References: <20230830080150.473374-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230830080150.473374-1-fabrice.gasnier@foss.st.com>
X-Barracuda-Connect: smtp01.tinet.cat[195.77.216.131]
X-Barracuda-Start-Time: 1693645581
X-Barracuda-URL: https://webmail.tinet.cat:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at tinet.cat
X-Barracuda-Scan-Msg-Size: 5737
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.5003 1.0000 0.7500
X-Barracuda-Spam-Score: 1.35
X-Barracuda-Spam-Status: No, SCORE=1.35 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=6.0 KILL_LEVEL=8.0 tests=MARKETING_SUBJECT
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.113557
 Rule breakdown below
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.60 MARKETING_SUBJECT      Subject contains popular marketing words
X-Mailman-Approved-At: Mon, 04 Sep 2023 07:42:57 +0000
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Marek Vasut <marex@denx.de>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Is the change of behaviour intended when a clock or reset is not found ?
(see below)

El Wed, Aug 30, 2023 at 10:01:49AM +0200, Fabrice Gasnier deia:
> Make usage of clock and reset bulk API in order to simplify the code
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> 
>  drivers/usb/host/ohci-generic.c | 92 +++++++++++----------------------
>  1 file changed, 29 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-generic.c b/drivers/usb/host/ohci-generic.c
> index 2d8d38ce9a40..95aa608d8c19 100644
> --- a/drivers/usb/host/ohci-generic.c
> +++ b/drivers/usb/host/ohci-generic.c
> @@ -16,75 +16,41 @@
>  
>  struct generic_ohci {
>  	ohci_t ohci;
> -	struct clk *clocks;	/* clock list */
> -	struct reset_ctl *resets; /* reset list */
> +	struct clk_bulk clocks;	/* clock list */
> +	struct reset_ctl_bulk resets; /* reset list */
>  	struct phy phy;
> -	int clock_count;	/* number of clock in clock list */
> -	int reset_count;	/* number of reset in reset list */
>  };
>  
>  static int ohci_usb_probe(struct udevice *dev)
>  {
>  	struct ohci_regs *regs = dev_read_addr_ptr(dev);
>  	struct generic_ohci *priv = dev_get_priv(dev);
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

Please note the old code was tolerant of not finding some clocks. It
ignored any clock not found and any other listed after it in the
"clocks" property and enabled the clocks before it.

The clk_get_bulk() function instead returns an error when any clock in
"clocks" is not found and releases (disables again and frees) those
before it.

I'm not aware of any case that breaks because of this, but I once saw
a case of ehci not working and ohci working because one of the listed
clocks not being found (ehci called clk_get_bulk(),
clk_enable_blk()). In that case, a fix by ignoring the missing clock
in ehci was rejected, so maybe that criteria applies here as well and
your patch is deemed correct. I don't know. That case won't break now,
I think, either with or without your patch, because after another fix,
that clock will be found. But I don't know if there might be similar
cases.

I just wanted to point out the change in behaviour. If the change is
intended, then all is fine.

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
> +		return ret;
> +	}
> +
> +	err = clk_enable_bulk(&priv->clocks);
> +	if (err) {
> +		dev_err(dev, "Failed to enable clocks (err=%d)\n", err);
> +		goto clk_err;
>  	}
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

Similar here.

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
>  		goto clk_err;
>  	}
>  
> +	err = reset_deassert_bulk(&priv->resets);
> +	if (err) {
> +		dev_err(dev, "failed to get deassert resets (err=%d)\n", err);
> +		goto reset_err;
> +	}
> +
>  	err = generic_setup_phy(dev, &priv->phy, 0);
>  	if (err)
>  		goto reset_err;
> @@ -101,13 +67,13 @@ phy_err:
>  		dev_err(dev, "failed to shutdown usb phy\n");
>  
>  reset_err:
> -	ret = reset_release_all(priv->resets, priv->reset_count);
> +	ret = reset_release_bulk(&priv->resets);
>  	if (ret)
> -		dev_err(dev, "failed to assert all resets\n");
> +		dev_err(dev, "failed to release resets (ret=%d)\n", ret);
>  clk_err:
> -	ret = clk_release_all(priv->clocks, priv->clock_count);
> +	ret = clk_release_bulk(&priv->clocks);
>  	if (ret)
> -		dev_err(dev, "failed to disable all clocks\n");
> +		dev_err(dev, "failed to release clocks (ret=%d)\n", ret);
>  
>  	return err;
>  }
> @@ -125,11 +91,11 @@ static int ohci_usb_remove(struct udevice *dev)
>  	if (ret)
>  		return ret;
>  
> -	ret = reset_release_all(priv->resets, priv->reset_count);
> +	ret = reset_release_bulk(&priv->resets);
>  	if (ret)
>  		return ret;
>  
> -	return clk_release_all(priv->clocks, priv->clock_count);
> +	return clk_release_bulk(&priv->clocks);
>  }
>  
>  static const struct udevice_id ohci_usb_ids[] = {
> -- 
> 2.25.1
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
