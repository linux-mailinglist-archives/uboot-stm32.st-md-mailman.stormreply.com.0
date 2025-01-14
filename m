Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B756A10DF8
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Jan 2025 18:41:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34FC9C78F70;
	Tue, 14 Jan 2025 17:41:54 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44DA2C78032
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 17:41:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 22B91101C6205; Tue, 14 Jan 2025 18:41:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1736876509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AQtFMwfFS1FblTd2LXCB7mNYXTMtPIBTWiQO0761PkY=;
 b=flH1Ua2dId9LsZoz1yI5sssKV63MO70Xr7CzmKQGkMFB86AoZ3Bpv4I+1KVsDQgIY4VE4H
 M3H7vRZ0pyOZYLvdk3sx5N3QRCSkoY4vK3qmdRQlezAwYc5myEriH415UzyHxRSs5FMP+I
 tBnYuNlslbCiquR34X6vBC/ZgHF+cDmTsGqUZNcfFhZ+6r+EES18Ru7ZPn5g/h3u5C6oyP
 pOFA6GYEXEgkjQMaYkTTXRTou4U/21ebKcHvDtLhVuVIoZURuViYEyxwPJripWb0NcsBn0
 bJSNMd/nZcG8j7mVeh064xyXS2mlCJzLvXIZkN3RAvNttZ1oB+QxIoCC3BwVQg==
Message-ID: <de9e66e1-ab5a-4d46-9ec9-b19627f4ea9b@denx.de>
Date: Tue, 14 Jan 2025 15:54:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20250114144528.1612168-1-patrice.chotard@foss.st.com>
 <20250114144528.1612168-7-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250114144528.1612168-7-patrice.chotard@foss.st.com>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Sjoerd Simons <sjoerd@collabora.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 06/10] dw3-generic: Add dependencies whith
 SYSCON and REGMAP
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

On 1/14/25 3:45 PM, Patrice Chotard wrote:
> Since addition of STiH407 support in dwc3-generic, SYSCON and REGMAP
> support are needed.
> 
> Add dependencies with SPL_REGMAP and SPL_SYSCON for:
> qcm6490, imx8mp_evk, phycore-imx8mp, librem5, qcom,
> xilinx_versal_net_virt, amd_versal2_virt, xilinx_zynqmp_kria
> xilinx_zynqmp_virt.
> 
> Add dependencies with SPL_REGMAP and SPL_SYSCON for am57xx_hs_evm_usb.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Marek Vasut <marex@denx.de>
> ---
> 
>   drivers/usb/dwc3/Kconfig | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> index 0100723a68b..ef82a3e9626 100644
> --- a/drivers/usb/dwc3/Kconfig
> +++ b/drivers/usb/dwc3/Kconfig
> @@ -26,6 +26,10 @@ config USB_DWC3_OMAP
>   config USB_DWC3_GENERIC
>   	bool "Generic implementation of a DWC3 wrapper (aka dwc3 glue)"
>   	depends on DM_USB && USB_DWC3 && MISC
> +	select SPL_REGMAP if SPL
> +	select SPL_SYSCON if SPL
> +	select REGMAP
> +	select SYSCON
Why was this not needed so far ? Or is this a bugfix ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
