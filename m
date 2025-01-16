Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3F0A1378C
	for <lists+uboot-stm32@lfdr.de>; Thu, 16 Jan 2025 11:12:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5236C78F73;
	Thu, 16 Jan 2025 10:12:57 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B710C78F6D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2025 10:12:50 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-38637614567so366617f8f.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2025 02:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737022370; x=1737627170;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=1sZLeW/e4nK6k7TBZfoml57UfddSa5n/ufI29ugtAVA=;
 b=bzAiEm5g5CORDiNG3t5Tq+zaFcRMACp3YgBHX5bMcG65lAnmZtsmD/P8mqeIs6nvVo
 L8dIz8/MZr7DbFiXDl9vb2nlDxYAF0qi5/dLl2oT3puyn5sGyHCO6QxYI61h06Emlnhc
 rcvaqcGYxobMSj2zjaSOo6T6R6MRT2p8GrFN2pr3uiMY3QJ/zB5wcS4IrjAXcsnabb1k
 ke8Jw0VYaxs+tGByCsMBzo6Ds3qPcq3OLiS9hUN1G79k4jM+Oxs91mDvKeCsIpsdDjIV
 X0tVhf7n795e/Nddg/10h94IlnQWzbePzuUHDCZdRRNdhFgpCMW2J94EmXUhtVKogVq9
 H/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737022370; x=1737627170;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1sZLeW/e4nK6k7TBZfoml57UfddSa5n/ufI29ugtAVA=;
 b=tsbTaYkc5niJMFpctIofDGRr8OnGjb4nKGjSbzMxzlLlPcHHx4QxFq0d9hk5pD8yTD
 1a2Gf1nFG7tgezsz5ALQpMnV5GzrYnveNOwqZh45/nouBsK8dECfPewAJUFf6c9AvWDd
 Vx3QwnQ0K+Rq8Kyt+tkBLT1FV2s4M7UJLk3XCkt+QAuL5sDEk7mDjEfedDun39UyI7CC
 YdjQqZ8NdhPBzReV4IH4oZwx0hRpL/H636SOV53tsTMqoEe5vZ/E+AEPdo1iavSJeYJh
 tTxqLbPOd/yonlurRqB6YSad9tEMlZo7tqWtRDR0fdfIiPv2/lOiYpHjf+18a6xpqQYb
 Wphg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzhflAziiFrkSl4QNuTUC7V4K3XbZvhsH++s++zzlJS82HMiKFJ5lkjxofkyr3HEHAUIsnRb+Vz/PhWw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwUtQWOOgd+SuSxsDnpPcaz0909QH8R1+y54ppdEnSt2yHIRqOA
 OasXYu4p7ab3y1Mce1xJm9kPaTxwbM2u6aa7YKs/e5LraVe6iOlFto9awcBBU9Q=
X-Gm-Gg: ASbGncsoP8zBnNjKCcLXVoQmmeWbcCdXdfjA4cU4GaN/Z52fL5P2+PmfnG0K6LSjf+e
 fg/4CnC3Xg0PyyS0cj2H5bwCJ9X6O8tgm936usTw+aVb8Q+kdfqn1lDkfLexRmmYs3Xo+7PhoAI
 AAdnWcIgKPBKRqaFXGLUgWjEWQYzvezQuq0IdB1ufiROushme9Jb9Tl2Wd/Qopr9WLqW4mewiZM
 PREayr0EhFpjito468ROjRVNIip1mGfi4vLrFNUjj81+XirL39DvmAmS0cuHRL0Cg==
X-Google-Smtp-Source: AGHT+IEBZWWf0hGg7JL5kQsEal9SRk5oUcOVywFDBMAFrWyGSiXNusntukw7nhveXpQ7uj+4xENPUw==
X-Received: by 2002:a05:6000:4007:b0:38b:ed19:756 with SMTP id
 ffacd0b85a97d-38bed19084cmr1539162f8f.41.1737022368574; 
 Thu, 16 Jan 2025 02:12:48 -0800 (PST)
Received: from localhost ([2a01:cb19:95ba:5000:d6dd:417f:52ac:335b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b7f79sm20398446f8f.69.2025.01.16.02.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 02:12:48 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
In-Reply-To: <20250116081738.2511223-4-patrice.chotard@foss.st.com>
References: <20250116081738.2511223-1-patrice.chotard@foss.st.com>
 <20250116081738.2511223-4-patrice.chotard@foss.st.com>
Date: Thu, 16 Jan 2025 11:12:47 +0100
Message-ID: <877c6v83ts.fsf@baylibre.com>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Tom Rini <trini@konsulko.com>,
 Jan Kiszka <jan.kiszka@siemens.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 3/9] usb: dwc3-generic: Reorder include
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

On jeu., janv. 16, 2025 at 09:17, Patrice Chotard <patrice.chotard@foss.st.com> wrote:

> Reorder include following rules available here :
> https://docs.u-boot.org/en/latest/develop/codingstyle.html#include-files

Nitpick: we don't state in the commit message that we also removed the
unused includes.
A sentence like: "While at it, also remove the unused includes" would be
nice to have.

If you need to send v3 for other reasons than this comment, please
consider adding it.

In case, this is a nitpick, so:

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Marek Vasut <marex@denx.de>
>
> ---
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
