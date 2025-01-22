Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 273BCA18DE3
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Jan 2025 09:55:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B56A0C78F75;
	Wed, 22 Jan 2025 08:55:47 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 010C4C7128A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jan 2025 08:55:39 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-38a25d4b9d4so3552697f8f.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jan 2025 00:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737536139; x=1738140939;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=dGWwsG/XzfO7NwnbGT0Xp/2hNB+Hmy5CfDuT7KyqAsg=;
 b=YpM3I143bfNRxROK4vr3K/w1PpYOTBsf3GGjsGpNeDyTB9ZPOuAXycrLIVyBG8gzZ6
 BRhp0bb62L3g+TbaHsWHCd5b+YsUwk4RNjsyDBy76YX0frATiDVutNEiUcEg/2tVVH6r
 1+y34O09hS0y5cq+7QhJbZ2mnnm6nmXEC/I8HcBmpq2+ncEsuWNNkmj9MS9JDaQ3QeJi
 GQf0AzNekfXWzPqiQkkmHd/3a3O+180LsbgGIIzHzW4FWN+7Vvp+nEduQn8GjTFQQyYR
 XH3bjVvM1IQ+Fcd3vEpm1oLfMrCyGkAIwrxhojRW7uJMv3e7YMtewoBckyxTGejA0pWX
 JP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737536139; x=1738140939;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dGWwsG/XzfO7NwnbGT0Xp/2hNB+Hmy5CfDuT7KyqAsg=;
 b=VpZxmkfje6Uni5FwQzwlu6TqnwNDhZx+NmJ40DjX9ktdm+kHPC4Rl1TlKOD727nmzf
 7n5bD1uhzQDrSFBsjtgIgT6RVkn2QITgx5BNvsE0Mpd0HZP4WSB8A05hIFt8xLwjABQI
 rb8NfYpiF2Fjb55qqDjy780FKcAX6iz3hmqN/VqcuaK4/zBM4xxI86Wz9DewleTX92FV
 T08v2iDKUH13svcnA4hAiHhbe6xjfPDUJFsRBenbN7+m8XznHc24Xy0+G6uc5PSeTvZP
 WH7bJfWc+yOkZiWciei6GD0oQw/VSoRjtpOmOysZR7+3pHUjY0NXyHwAOj3Rak45vP7m
 5iug==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5d3xN7/m2XlZnv611ylozj71e90+3EEK2Nb/xesxqalOUeFKSBCJ0tKhlK0KYePLzBrhc9uPvyryiUg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw22SgM3vVEfPGpmKCSX0ZjyLCq0brO3Xb+Ounj8jvtW6P+po4d
 KcHhX4pA/jdKtQgd3sXfyVYfafp27nMGVTaggLheJjs4iKp4Sz7CbGT/acX0yd0=
X-Gm-Gg: ASbGncvB7h0ka1x213qQuDwzO5iQEnO0KO4LONYg8M0WYpi89J9QIoOuBKpcmNKy1qL
 8e2wOP+OyjiGxr8VARUCSdhJ9faGEKSth1YBcgww344k/GZh1a6LsRwh+DSWkqJDJZz14SwFjPy
 t9tidIL740lXSf7zLFDbUt2xMXIRTFvWRFViKHvtf97zrMZ/lMzs3xs9foRLJLn2VnAZHmvPjGP
 L8RhFZAEl40TlD5+q+SxoqpK14jd8wcq9vsqquqZ5Y03gjxGI2mwSG0T6ohT7DdmjMY2cVJKS51
 mOwubPApH7J6Lg==
X-Google-Smtp-Source: AGHT+IGf+XpOR0ZbaZev6nXAj7CaAHOfSzCQAOtoktCgm9+mNyNk0LsnDcb0CBxR6sd+zK9ywhmYiw==
X-Received: by 2002:a5d:6d86:0:b0:38a:8e2e:9fcc with SMTP id
 ffacd0b85a97d-38bf57befa9mr19968016f8f.45.1737536139214; 
 Wed, 22 Jan 2025 00:55:39 -0800 (PST)
Received: from localhost ([2a01:cb19:95ba:5000:d6dd:417f:52ac:335b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf3222bebsm15834308f8f.30.2025.01.22.00.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 00:55:38 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
In-Reply-To: <20250120080120.51657-4-patrice.chotard@foss.st.com>
References: <20250120080120.51657-1-patrice.chotard@foss.st.com>
 <20250120080120.51657-4-patrice.chotard@foss.st.com>
Date: Wed, 22 Jan 2025 09:55:37 +0100
Message-ID: <874j1rkz1y.fsf@baylibre.com>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Tom Rini <trini@konsulko.com>,
 Jan Kiszka <jan.kiszka@siemens.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 3/9] usb: dwc3-generic: Reorder include
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

Hi Patrice,

Thank you for the patch.

On lun., janv. 20, 2025 at 09:01, Patrice Chotard <patrice.chotard@foss.st.com> wrote:

> Reorder include following rules available here :
> https://docs.u-boot.org/en/latest/develop/codingstyle.html#include-files
>
> Remove useless include files.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Marek Vasut <marex@denx.de>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

>
> ---
>
> Changes in v3:
>   - Update comment by adding "Remove useless include files"
>
> Changes in v2:
>   - remove useless include files
>
>  drivers/usb/dwc3/dwc3-generic.c | 20 ++++----------------
>  1 file changed, 4 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/usb/dwc3/dwc3-generic.c b/drivers/usb/dwc3/dwc3-generic.c
> index 2ab41cbae45..bc7d2d4234b 100644
> --- a/drivers/usb/dwc3/dwc3-generic.c
> +++ b/drivers/usb/dwc3/dwc3-generic.c
> @@ -7,29 +7,17 @@
>   * Based on dwc3-omap.c.
>   */
>  
> -#include <cpu_func.h>
> -#include <log.h>
>  #include <dm.h>
> -#include <dm/device-internal.h>
> +#include <reset.h>
> +#include <asm/gpio.h>
>  #include <dm/lists.h>
> -#include <dwc3-uboot.h>
> -#include <generic-phy.h>
> -#include <linux/bitops.h>
>  #include <linux/delay.h>
> -#include <linux/printk.h>
> -#include <linux/usb/ch9.h>
>  #include <linux/usb/gadget.h>
> -#include <malloc.h>
>  #include <power/regulator.h>
> -#include <usb.h>
> -#include "core.h"
> -#include "gadget.h"
> -#include <reset.h>
> -#include <clk.h>
>  #include <usb/xhci.h>
> -#include <asm/gpio.h>
> -
> +#include "core.h"
>  #include "dwc3-generic.h"
> +#include "gadget.h"
>  
>  struct dwc3_generic_plat {
>  	fdt_addr_t base;
> -- 
> 2.25.1
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
