Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 026A6D6C15
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Oct 2019 01:36:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B250EC36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 23:36:09 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78C6FC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Oct 2019 23:36:08 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46sZgq20nNz1qrK0;
 Tue, 15 Oct 2019 01:36:07 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46sZgq1SNtz1qr9B;
 Tue, 15 Oct 2019 01:36:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id JxabD6eH0K2g; Tue, 15 Oct 2019 01:36:06 +0200 (CEST)
X-Auth-Info: m3+nZBd3gUDohltTUnG78c69LR9XyfM+FBEnSBR38SA=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 15 Oct 2019 01:36:06 +0200 (CEST)
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <20191014080025.11245-1-patrick.delaunay@st.com>
 <20191014080025.11245-2-patrick.delaunay@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <67fe66ee-4ee9-ceb4-c303-801605764bdb@denx.de>
Date: Tue, 15 Oct 2019 01:26:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191014080025.11245-2-patrick.delaunay@st.com>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Suchanek <msuchanek@suse.de>, Sven Schwermer <sven@svenschwermer.de>
Subject: Re: [Uboot-stm32] [RESEND PATCH 1/5] usb: host: dwc2: add phy
	support
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

On 10/14/19 10:00 AM, Patrick Delaunay wrote:
> Use generic phy to initialize the PHY associated to the

PHY and USB are abbreviations, should be in capitals.

> DWC2 device and available in the device tree.

[...]

General question -- is the PHY subsystem a mandatory dependency of this
driver now or will it work without the PHY subsystem still ?

> +static int dwc2_setup_phy(struct udevice *dev)
> +{
> +	struct dwc2_priv *priv = dev_get_priv(dev);
> +	int ret;
> +
> +	ret = generic_phy_get_by_index(dev, 0, &priv->phy);
> +	if (ret) {
> +		if (ret != -ENOENT) {
> +			dev_err(dev, "failed to get usb phy\n");

Sentence starts with capital letter, USB and PHY are in capitals. Fix
globally please.

It would be useful to print the $ret value too.

> +			return ret;
> +		}
> +		return 0;
> +	}
> +
> +	ret = generic_phy_init(&priv->phy);
> +	if (ret) {
> +		dev_err(dev, "failed to init usb phy\n");
> +		return ret;
> +	}
> +
> +	ret = generic_phy_power_on(&priv->phy);
> +	if (ret) {
> +		dev_err(dev, "failed to power on usb phy\n");
> +		return generic_phy_exit(&priv->phy);
> +	}
> +
> +	return 0;
> +}
> +
> +static int dwc2_shutdown_phy(struct udevice *dev)
> +{
> +	struct dwc2_priv *priv = dev_get_priv(dev);
> +	int ret;
> +
> +	if (!generic_phy_valid(&priv->phy))
> +		return 0;
> +
> +	ret = generic_phy_power_off(&priv->phy);
> +	if (ret) {
> +		dev_err(dev, "failed to power off usb phy\n");
> +		return ret;
> +	}
> +
> +	ret = generic_phy_exit(&priv->phy);
> +	if (ret) {
> +		dev_err(dev, "failed to power off usb phy\n");

Shouldn't all those error prints be produced by the PHY subsystem ?

> +		return ret;

[...]

> @@ -1339,6 +1398,8 @@ static int dwc2_usb_remove(struct udevice *dev)
>  	if (ret)
>  		return ret;
>  
> +	dwc2_shutdown_phy(dev);

This function returns a return value, but it's ignored here ?

>  	dwc2_uninit_common(priv->regs);
>  
>  	reset_release_bulk(&priv->resets);
> 

[...]
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
