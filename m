Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1968D18090B
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Mar 2020 21:19:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C35EEC36B0D
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Mar 2020 20:19:39 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33E6EC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2020 20:19:38 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id m3so2841672wmi.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2020 13:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LOMXhckUtovHLWWjV0LqF8/++ER9sHqXK5tdCnhWGSo=;
 b=n3mmfRZeNwcxi39xjeQW+1wOTTxrMBVS6Z1hh04q9XhHHUXX0QOdofW5ShZJNcNwJO
 9JbSJzXD2QUhgXzYiJvPj09r56psINBwCdDWTeYXmxA3zPW1zed75EL1Ren3deAkwgfu
 ayO0EKCaATcM038+nU8hPnQU3mQGrXMFQjMwcZY1s5we3bFOWApQVifNuGaha7SwAhFR
 m8YPBtLuyfuz6UbAuNBmYv2hoHhG4wqzULNxiEhZ/UkiH23kxOOqaHhtTrPnUBGkPkh+
 4kg5o+2zk2teA82jPCSBuQpXt5g9tw+yT7AhxdTmCBcPIppSvDyBFxFldlfrh/hLr8LL
 LUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LOMXhckUtovHLWWjV0LqF8/++ER9sHqXK5tdCnhWGSo=;
 b=KNdM6KKvYGPialn1tJjkQGas2nAeuXDQ8YoWGshaq/LEQ26kS6nCaQdC3U058Rq0v4
 3N3d/oX4Kd06OnQT2iF81qY80OKKv5XgKXxX3qbsJQ8mkUNYpkXUq0eB6D0kLqRzNMdv
 mNdABq9KI0h+XpUCigoY2CjT8XQ0K1STk3HLLcw2Dsn22beIFx9sVSrOky87M2ET9koA
 Z7ap0msdiWwBeDc3EacizlOdaS4aUpePOdGnF6XRvbNj7obniw7fWV34sSHXbL2rxjs9
 9nG8fwEd/eqmFEzZxNr3LLKAFBOSoUCXvS5bqfSuYlkSICQ8SSiY6azRdaEkHDbYkSJq
 mSgg==
X-Gm-Message-State: ANhLgQ3l7o6lyTkUemko43jkAzx5mFTdSf9Zc2Pu9HY0KBgXPA+LcAeS
 lQ5syMaceTJWSFhcnxW6lx9u7Yed
X-Google-Smtp-Source: ADFU+vubXp5iAMLyKlvGHfY+YaceQOQ6y57dSJJm1ZUgqYOcWNYlIMnRsnYSiEtXI25kiA3YCVqICw==
X-Received: by 2002:a1c:5585:: with SMTP id j127mr3745065wmb.35.1583871578145; 
 Tue, 10 Mar 2020 13:19:38 -0700 (PDT)
Received: from ?IPv6:2a02:8071:6cd:f600:3dff:b879:b41b:fa13?
 ([2a02:8071:6cd:f600:3dff:b879:b41b:fa13])
 by smtp.gmail.com with ESMTPSA id o11sm58391719wrn.6.2020.03.10.13.19.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2020 13:19:37 -0700 (PDT)
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <20200310100912.28129-1-patrick.delaunay@st.com>
 <20200310100912.28129-5-patrick.delaunay@st.com>
From: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
Message-ID: <8ede9caa-d939-cc61-bf06-cf8446898450@gmail.com>
Date: Tue, 10 Mar 2020 21:18:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310100912.28129-5-patrick.delaunay@st.com>
Content-Language: en-US
Cc: Marek Vasut <marex@denx.de>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Simon Glass <sjg@chromium.org>, ley.foon.tan@intel.com, b.galvani@gmail.com,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Suchanek <msuchanek@suse.de>
Subject: Re: [Uboot-stm32] [PATCH v6 4/5] usb: host: dwc2: force reset assert
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

Am 10.03.2020 um 11:09 schrieb Patrick Delaunay:
> Assert reset before deassert in dwc2_reset;
> this patch solve issues when the DWC2 registers are already
> initialized with value incompatible with host mode.
> 
> Force a hardware reset of the IP reset all the DWC2 registers at
> default value, the host driver start with a clean state
> (Core Soft reset doen in dwc_otg_core_reset is not enought
>  to reset all register).
> 
> The error can occurs in U-Boot when DWC2 device gadget driver
> force device mode (called by ums or dfu command, before to execute
> the usb start command).
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Reviewed-by: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>

> ---
> 
> Changes in v6: None
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2:
> - add clk_disable_bulk in dwc2_usb_remove
> 
>  drivers/usb/host/dwc2.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/host/dwc2.c b/drivers/usb/host/dwc2.c
> index b1b79d0a18..640ae3e730 100644
> --- a/drivers/usb/host/dwc2.c
> +++ b/drivers/usb/host/dwc2.c
> @@ -1151,6 +1151,8 @@ static int dwc2_reset(struct udevice *dev)
>  			return ret;
>  	}
>  
> +	/* force reset to clear all IP register */
> +	reset_assert_bulk(&priv->resets);
>  	ret = reset_deassert_bulk(&priv->resets);
>  	if (ret) {
>  		reset_release_bulk(&priv->resets);
> 

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
