Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE3C179952
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Mar 2020 20:52:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7024FC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Mar 2020 19:52:49 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 915B0C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Mar 2020 19:52:47 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id m3so3165803wmi.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Mar 2020 11:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KHUtPOUJR1ak/IRkDk+3s5t5XT3ZlTl5e3fXGVnJ5GQ=;
 b=ONPsHhaU3qT20CWht8FJq38plepKDNLv11qxt31kF0Th8Y2dBK4o6QR4P9kgox7YGA
 XYE13Gwqeuu60vepqclEPQ4AZD1AERqbmvsfQlDkhSX938lcTVnqqroB/xgtDzNK2t0C
 yGtT01v03stHZybfl73Iervm6BnHC+FeKcra9ASkrIR2zJvDmBFC+C8KBT88Bxkz8Yyq
 MPfiHycCYd4WKZI0qjWjzTC8eP39gq8Q302/Zb+K3qK7GCVRq83+vl2HZTjUqgsLiNlN
 q0E326RunDP3zQlfTq06MZq52JmrgCsnPoybIiLPfxrPDn/bLVNkECG0j8RtM2IZgatd
 l15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KHUtPOUJR1ak/IRkDk+3s5t5XT3ZlTl5e3fXGVnJ5GQ=;
 b=MrOZRMEu4jBj+GiNklbYhbP5HiThlYMy5rofyIhgeIkDGrouqNNJ1hoNLkWZb9eOYT
 bcZ/W7M8m6qU5gRi+KEWwSEdHjFbzbAvMuG6ab60zgPcHQzFLwb+GVD0NYH5hdej/woQ
 FKjIuiwptpmQqUUQyoBb5VuGekmE0CJrHk14DR3dn0511CQ2wHlz5LTbhelKasFSpopj
 xHryTmHlQkIrvUlj6dmSGU+tiIDCIKLcPgC6zUpju+hE6S+bxmSA2nA6U6cRej3c1alj
 lFqo8DujtDsXiQVHfEpskS/3BtaXIggVxHs1nddbrkXstCtfiLUCqY6nwcVaXAbLlDJE
 fi4A==
X-Gm-Message-State: ANhLgQ3bDt37ptKhlkdHVrnZnKEjnLyu5IrqBCBLKr0PLXwOTHC8Q/Kv
 iJdQl3ET7O2Ed4HP4fu7F7Dmgfbn
X-Google-Smtp-Source: ADFU+vtVRPHIOWjAK6tC073Jpwr/C44/OpM7lP3Q+07QlwH4LCHBfAIWedgtmt1ZyuOYKkiJrFPeCQ==
X-Received: by 2002:a7b:cb17:: with SMTP id u23mr5335529wmj.12.1583351566756; 
 Wed, 04 Mar 2020 11:52:46 -0800 (PST)
Received: from ?IPv6:2a02:8071:6cd:f600:3dff:b879:b41b:fa13?
 ([2a02:8071:6cd:f600:3dff:b879:b41b:fa13])
 by smtp.gmail.com with ESMTPSA id c11sm40217811wrp.51.2020.03.04.11.52.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2020 11:52:46 -0800 (PST)
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <20200218083503.5468-1-patrick.delaunay@st.com>
 <20200218083503.5468-3-patrick.delaunay@st.com>
From: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
Message-ID: <9c919bd2-87b9-0052-579a-a3fa491445dd@gmail.com>
Date: Wed, 4 Mar 2020 20:51:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200218083503.5468-3-patrick.delaunay@st.com>
Content-Language: en-US
Cc: Marek Vasut <marex@denx.de>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Simon Glass <sjg@chromium.org>, ley.foon.tan@intel.com, b.galvani@gmail.com,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Suchanek <msuchanek@suse.de>
Subject: Re: [Uboot-stm32] [PATCH v4 2/5] usb: host: dwc2: add phy support
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

Am 18.02.2020 um 09:35 schrieb Patrick Delaunay:
> Use generic phy to initialize the PHY associated to the
> DWC2 device and available in the device tree.
> 
> This patch don't added dependency because when CONFIG_PHY
> is not activated, the generic PHY function are stubbed.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
> Changes in v4: None
> Changes in v3: None
> Changes in v2:
> - update dev_err
> - update commit message
> - change dev_err to dev_dbg for PHY function call
> - treat dwc2_shutdown_phy error
> 
>  drivers/usb/host/dwc2.c | 66 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/drivers/usb/host/dwc2.c b/drivers/usb/host/dwc2.c
> index e4efaf1e59..5e7ffaddd9 100644
> --- a/drivers/usb/host/dwc2.c
> +++ b/drivers/usb/host/dwc2.c
> @@ -8,6 +8,7 @@
>  #include <cpu_func.h>
>  #include <dm.h>
>  #include <errno.h>
> +#include <generic-phy.h>
>  #include <usb.h>
>  #include <malloc.h>
>  #include <memalign.h>
> @@ -37,6 +38,7 @@ struct dwc2_priv {
>  #ifdef CONFIG_DM_REGULATOR
>  	struct udevice *vbus_supply;
>  #endif
> +	struct phy phy;
>  #else
>  	uint8_t *aligned_buffer;
>  	uint8_t *status_buffer;
> @@ -1322,13 +1324,71 @@ static int dwc2_usb_ofdata_to_platdata(struct udevice *dev)
>  	return 0;
>  }
>  
> +static int dwc2_setup_phy(struct udevice *dev)
> +{
> +	struct dwc2_priv *priv = dev_get_priv(dev);
> +	int ret;
> +
> +	ret = generic_phy_get_by_index(dev, 0, &priv->phy);
> +	if (ret) {
> +		if (ret != -ENOENT) {

Could you invert this logic and add a comment like "no PHY" or something?

> +			dev_err(dev, "Failed to get USB PHY: %d.\n", ret);
> +			return ret;
> +		}
> +		return 0;
> +	}
> +
> +	ret = generic_phy_init(&priv->phy);
> +	if (ret) {
> +		dev_dbg(dev, "Failed to init USB PHY: %d.\n", ret);
> +		return ret;
> +	}
> +
> +	ret = generic_phy_power_on(&priv->phy);
> +	if (ret) {
> +		dev_dbg(dev, "Failed to power on USB PHY: %d.\n", ret);
> +		generic_phy_exit(&priv->phy);
> +		return ret;
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

A comment saying that this is for platforms without a phy driver would
be nice.

Other than that:
Reviewed-by: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>

> +		return 0;
> +
> +	ret = generic_phy_power_off(&priv->phy);
> +	if (ret) {
> +		dev_dbg(dev, "Failed to power off USB PHY: %d.\n", ret);
> +		return ret;
> +	}
> +
> +	ret = generic_phy_exit(&priv->phy);
> +	if (ret) {
> +		dev_dbg(dev, "Failed to power off USB PHY: %d.\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int dwc2_usb_probe(struct udevice *dev)
>  {
>  	struct dwc2_priv *priv = dev_get_priv(dev);
>  	struct usb_bus_priv *bus_priv = dev_get_uclass_priv(dev);
> +	int ret;
>  
>  	bus_priv->desc_before_addr = true;
>  
> +	ret = dwc2_setup_phy(dev);
> +	if (ret)
> +		return ret;
> +
>  	return dwc2_init_common(dev, priv);
>  }
>  
> @@ -1341,6 +1401,12 @@ static int dwc2_usb_remove(struct udevice *dev)
>  	if (ret)
>  		return ret;
>  
> +	ret = dwc2_shutdown_phy(dev);
> +	if (ret) {
> +		dev_dbg(dev, "Failed to shutdown USB PHY: %d.\n", ret);
> +		return ret;
> +	}
> +
>  	dwc2_uninit_common(priv->regs);
>  
>  	reset_release_bulk(&priv->resets);
> 

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
