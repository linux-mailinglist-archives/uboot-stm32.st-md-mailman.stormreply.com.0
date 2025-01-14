Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABA8A10DF6
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Jan 2025 18:41:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20821C7802D;
	Tue, 14 Jan 2025 17:41:54 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40BB5C78018
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 17:41:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7DE3D104802BE; Tue, 14 Jan 2025 18:41:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1736876506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gm8imiLKYxS89ddqh2LOxpsLKvJpEH5VWMKmCXP8gi4=;
 b=ZWqNTPvAI/ZlGfLpZJUGl9q2i8+6IFW8/M9vrTdPEDW839aikElqsQXU85fLLJ0ICMZTWw
 y3DMU+T54YGuDGrxEXgnRux+a2VQqi1eFVbTfjqq0I2jaRknOWG9SwrDkxnQTMQCtsv2sP
 SclT//nSe/dCNfq7l0YIPwECdMPoFge3jsgu/Y71UhGlZfnOook61v9ZM+w7RTXT4QMQyx
 Am9HnlKaYtArB5gOsSBjA599yuJm/xyWdr/1oMV09TyKIzMMbN2MNhGx8rFNEH/YIOTzP9
 i0RbSB2fExJw0tkTdG8IXv1KDOgcEugGQ20qahiVpv06B5Ent5elZUzsvo6M5A==
Message-ID: <912f42f2-9358-4295-8382-8a5aa82c7804@denx.de>
Date: Tue, 14 Jan 2025 15:51:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20250114144528.1612168-1-patrice.chotard@foss.st.com>
 <20250114144528.1612168-4-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250114144528.1612168-4-patrice.chotard@foss.st.com>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Tom Rini <trini@konsulko.com>,
 Jan Kiszka <jan.kiszka@siemens.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 03/10] usb: dwc3-generic: Reorder include
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
> Reorder include following rules available here :
> https://docs.u-boot.org/en/latest/develop/codingstyle.html#include-files
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Marek Vasut <marex@denx.de>
> ---
> 
>   drivers/usb/dwc3/dwc3-generic.c | 21 ++++++++++-----------
>   1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-generic.c b/drivers/usb/dwc3/dwc3-generic.c
> index 2ab41cbae45..cb96e1f344f 100644
> --- a/drivers/usb/dwc3/dwc3-generic.c
> +++ b/drivers/usb/dwc3/dwc3-generic.c
> @@ -7,29 +7,28 @@
>    * Based on dwc3-omap.c.
>    */
>   
> +#include <clk.h>
>   #include <cpu_func.h>
> -#include <log.h>
>   #include <dm.h>
> -#include <dm/device-internal.h>
> -#include <dm/lists.h>
>   #include <dwc3-uboot.h>
>   #include <generic-phy.h>
> +#include <log.h>
> +#include <malloc.h>
> +#include <reset.h>
> +#include <usb.h>
> +#include <asm/gpio.h>
> +#include <dm/device-internal.h>
> +#include <dm/lists.h>
>   #include <linux/bitops.h>
>   #include <linux/delay.h>
>   #include <linux/printk.h>
>   #include <linux/usb/ch9.h>
>   #include <linux/usb/gadget.h>
> -#include <malloc.h>
>   #include <power/regulator.h>
> -#include <usb.h>
> -#include "core.h"
> -#include "gadget.h"
> -#include <reset.h>
> -#include <clk.h>
>   #include <usb/xhci.h>
> -#include <asm/gpio.h>
Can you remove some of them too ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
