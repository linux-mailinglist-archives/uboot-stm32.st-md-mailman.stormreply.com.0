Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC72179957
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Mar 2020 20:53:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87DE4C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  4 Mar 2020 19:53:49 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 230E1C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Mar 2020 19:53:48 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a5so3587372wmb.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Mar 2020 11:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=O5irfjiO+FRmSrn2crWGi0Yv64EJAT628XbnInKLEEA=;
 b=IBH+IloLLvTsSO1HIx0/ERYFF1cLAV8gaGkQ/goQ03QGO0A4pVP2hXwtrEgLKHRWpd
 e9WxfH6NWAl5KSjpS7ZuJAaEU6+SwFkg4qIDLPkzvsPtwKT2UCOlXqbc99M6CY412KHY
 4lYZ7le4pu/xFJCGnnnFLpLLAcP2zGANSILXjHOI45Z6pgw80yYa4E6ga6zNEr/RyLyS
 IFVrQCFco+8cfZHPhaOZdNhiZt2MegskgKJiyf8jHDsIiF2v90Yj7E73/x/p80MJzp8Z
 T4h5C82LKNDhK6hv/BSwPr6IL9IsUtvS7LXqUMs70qbrpyMIaGmZAfjUFSw5sPb+elmJ
 Pbwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O5irfjiO+FRmSrn2crWGi0Yv64EJAT628XbnInKLEEA=;
 b=rRx13FUjDAbkgFP5zqL6MpSoQ9KE5rISqixxsL98V4qvRNLCMnY6I/Y6+OmfEwI98v
 X+NGRdYKVXp/La+pMmLyi/E9CJ4msj/nNOBe3UIwfeKeDhA5/E5RWFYV8MKCSQ85TB/W
 kdHXq7mRAKoHtLvms0rkUGp+AHvGX4rx+PG3VaJtc6dY9B+0+X74+QdfZiplnTBOC7gp
 cMur8Q9eFycsNnCYmuj3sb27nZZhkMRPhfg+y9zOqeowtoBaq882Ir3KkqBXwG9/55e5
 uOaML2bBAY0uOwidlcEBuPCXFR9lcRA2dN+qef2h2QpDljiWhGoeQsLN2i+Kqvpbg6qU
 7/eA==
X-Gm-Message-State: ANhLgQ39cHZUnB2UzvPQ1BwXhLRcXvGTSMdzJsbxmFCKFm1XV2NzuK8F
 MlO8M0jPJKlqXERCVAf0iKlJ6S2P
X-Google-Smtp-Source: ADFU+vvtzZuxr9LuIz0FWB/lER+Z5amkLGK33d9EGRS/n5NXYZOU108/aFcN0S75iKOQe5vz8aW0jw==
X-Received: by 2002:a05:600c:224e:: with SMTP id
 a14mr4967889wmm.58.1583351627422; 
 Wed, 04 Mar 2020 11:53:47 -0800 (PST)
Received: from ?IPv6:2a02:8071:6cd:f600:3dff:b879:b41b:fa13?
 ([2a02:8071:6cd:f600:3dff:b879:b41b:fa13])
 by smtp.gmail.com with ESMTPSA id z131sm5444148wmg.25.2020.03.04.11.53.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2020 11:53:46 -0800 (PST)
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <20200218083503.5468-1-patrick.delaunay@st.com>
 <20200218083503.5468-4-patrick.delaunay@st.com>
From: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
Message-ID: <0e448f99-c257-2f5e-3d5c-6d05feb0d2ef@gmail.com>
Date: Wed, 4 Mar 2020 20:52:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200218083503.5468-4-patrick.delaunay@st.com>
Content-Language: en-US
Cc: Marek Vasut <marex@denx.de>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Simon Glass <sjg@chromium.org>, ley.foon.tan@intel.com, b.galvani@gmail.com,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Suchanek <msuchanek@suse.de>
Subject: Re: [Uboot-stm32] [PATCH v4 3/5] usb: host: dwc2: add clk support
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
> Add support for clock with driver model.
> 
> This patch don't added dependency because when CONFIG_CLK
> is not activated the clk function are stubbed.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Reviewed-by: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>

> ---
> 
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
> 
>  drivers/usb/host/dwc2.c | 30 +++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/dwc2.c b/drivers/usb/host/dwc2.c
> index 5e7ffaddd9..d56d0e61b5 100644
> --- a/drivers/usb/host/dwc2.c
> +++ b/drivers/usb/host/dwc2.c
> @@ -5,14 +5,15 @@
>   */
>  
>  #include <common.h>
> +#include <clk.h>
>  #include <cpu_func.h>
>  #include <dm.h>
>  #include <errno.h>
>  #include <generic-phy.h>
> -#include <usb.h>
>  #include <malloc.h>
>  #include <memalign.h>
>  #include <phys2bus.h>
> +#include <usb.h>
>  #include <usbroothubdes.h>
>  #include <wait_bit.h>
>  #include <asm/io.h>
> @@ -39,6 +40,7 @@ struct dwc2_priv {
>  	struct udevice *vbus_supply;
>  #endif
>  	struct phy phy;
> +	struct clk_bulk clks;
>  #else
>  	uint8_t *aligned_buffer;
>  	uint8_t *status_buffer;
> @@ -1377,6 +1379,26 @@ static int dwc2_shutdown_phy(struct udevice *dev)
>  	return 0;
>  }
>  
> +static int dwc2_clk_init(struct udevice *dev)
> +{
> +	struct dwc2_priv *priv = dev_get_priv(dev);
> +	int ret;
> +
> +	ret = clk_get_bulk(dev, &priv->clks);
> +	if (ret == -ENOSYS || ret == -ENOENT)
> +		return 0;
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_enable_bulk(&priv->clks);
> +	if (ret) {
> +		clk_release_bulk(&priv->clks);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int dwc2_usb_probe(struct udevice *dev)
>  {
>  	struct dwc2_priv *priv = dev_get_priv(dev);
> @@ -1385,6 +1407,10 @@ static int dwc2_usb_probe(struct udevice *dev)
>  
>  	bus_priv->desc_before_addr = true;
>  
> +	ret = dwc2_clk_init(dev);
> +	if (ret)
> +		return ret;
> +
>  	ret = dwc2_setup_phy(dev);
>  	if (ret)
>  		return ret;
> @@ -1410,6 +1436,8 @@ static int dwc2_usb_remove(struct udevice *dev)
>  	dwc2_uninit_common(priv->regs);
>  
>  	reset_release_bulk(&priv->resets);
> +	clk_disable_bulk(&priv->clks);
> +	clk_release_bulk(&priv->clks);
>  
>  	return 0;
>  }
> 

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
