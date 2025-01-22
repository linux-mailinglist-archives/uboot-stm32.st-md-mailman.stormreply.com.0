Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B05A18E08
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Jan 2025 10:02:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B63EC78F75;
	Wed, 22 Jan 2025 09:02:40 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27CBEC7128A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jan 2025 09:02:33 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-385d7f19f20so3222458f8f.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Jan 2025 01:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737536552; x=1738141352;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=pQq1+exsL0QSrKEq3NmrePMQ0o5wAO1KhXaH/Ripk+g=;
 b=TxR2txGdmKLO+5El/wyXtvPXWnlQjirjCfM9EqwDDoFQ6ZrBkmz1AJss93mcvYoRAX
 mk8ogQEJj2v7ibYxVnIfHmS5WMNpjVSOTbAvIszq7Q5NUatZLP+7bBn+RsOwiAi27U8Y
 5GssFYkouP/rQ/Rk2lMzAMTv6EqePZx3vdHPOGi2KkLhh+5Zg7qMtLE3WXwRZPIQpErw
 iagQSnqwdDAWd1rkW9LLWEakzThlDkg7pEXTD7w4NTZ/Lc/f1/VhHA8U64ZVH0hqCc3a
 /cvzAhtYS2sg3dpQUJDhOT5VNsh5Veatyb+35jAkwI0KDo9sFfH3ALyLXItCZ8rhDTRE
 AxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737536552; x=1738141352;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pQq1+exsL0QSrKEq3NmrePMQ0o5wAO1KhXaH/Ripk+g=;
 b=HpSfLtYTZrfCy/B93NmmO+kxfGI0lE9D+HLgSVVbkgInX7TYaZFl9YlzJaBamGfS2m
 Zvrn0BhXYusASURa3NYclRu5hIxedqkYvYMykaj+9Xce0kSi7enITb9+J/NGUIwKJU3n
 G/OPjNOHAZpU9MPIA8URFuQY/K0aLUH0iIMP6s4q9hQLo/HmSg6SDgc5JDm9Mm5GU7OP
 /Mhj4E1njapPOS2Oq8Ua+wGXo9yq7hrnBF5B+2yrKsj+Cpxu7hENPNnruVQRVemZ4jtf
 b4WhyUtNTyVlGH3EaPm/7QLcoDrt65F/9csiS0w2T2LQ5aHPL6cyEsCQmbXEQcinThZy
 yrRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVY6KDNcNDaHK6TrM8aBCFqG/jge99He4bbNtWWH1I7zFLA3ccGhdQoXQSlDMe+dwQ0RMarNJkXmCzuWw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzBJt5MDuUc0TheEv7bwrbszgxzNave1f36YKmleUkCt3cTsfg5
 yUUlC8FZIyupWkw8iUvpHTYkB52ci2dOUdO7tslGVRTBxbW7nGlZncA+UoLAaDA=
X-Gm-Gg: ASbGncutwGPO8D1FZyWscCuRBZeyHtZKkfWNDcMiCz7bgmwx9+ufrtiPVF8l60OIVnJ
 Mpe1G8mKo1zE/yBOGT/n7361WiWO/P3+E1bfCg7gUqczhqUFkpvjMX/OWH4RvEUu4rfgM1sv3cI
 ZumiGB8LXTUEQeaSQfK+zKjrW/4mQ44dP+R2UEjBmirPNk78SUwBvjVAQmPstCx8XVj7M3REghx
 LPEcY7DWDPBZbl554bbUvEiDbb9XiVuktRsn2y6y0tO5DhsL94SqZntc9TAtrjoYqffE00LuwgB
 vdc=
X-Google-Smtp-Source: AGHT+IHsU15VnyOi+30uigh1aSt8FTfoj3oPVrVig3dg6hyc3uxfjFRE0jX2QPtJi7NWA4U4StPgow==
X-Received: by 2002:a5d:4303:0:b0:385:f892:c8fe with SMTP id
 ffacd0b85a97d-38bf566b62dmr15833681f8f.21.1737536552411; 
 Wed, 22 Jan 2025 01:02:32 -0800 (PST)
Received: from localhost ([2a01:cb19:95ba:5000:d6dd:417f:52ac:335b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf3221baasm15846309f8f.35.2025.01.22.01.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 01:02:31 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
In-Reply-To: <20250120080120.51657-5-patrice.chotard@foss.st.com>
References: <20250120080120.51657-1-patrice.chotard@foss.st.com>
 <20250120080120.51657-5-patrice.chotard@foss.st.com>
Date: Wed, 22 Jan 2025 10:02:31 +0100
Message-ID: <871pwvkyqg.fsf@baylibre.com>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sjoerd Simons <sjoerd@collabora.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Robert Marko <robert.marko@sartura.hr>,
 Sam Protsenko <semen.protsenko@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v3 4/9] usb: dwc3-generic: Add STih407
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

Hi Patrice,

Thank you for the patch.

On lun., janv. 20, 2025 at 09:01, Patrice Chotard <patrice.chotard@foss.st.com> wrote:

> Add STi glue logic to manage the DWC3 HC on STiH407
> SoC family. It configures the internal glue logic and
> syscfg registers.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Marek Vasut <marex@denx.de>
>
> ---
>
> Changes in v3:
>   - Replace debug() by dev_err()
>   - check return value of syscon_regmap_lookup_by_phandle()
>
> Changes in v2:
>   - add dwc3-sti.c DWC3 wrapper as done for dwc3-am62.c
>
>  MAINTAINERS                         |   1 +
>  drivers/usb/dwc3/Kconfig            |   6 ++
>  drivers/usb/dwc3/Makefile           |   1 +
>  drivers/usb/dwc3/dwc3-generic-sti.c | 132 ++++++++++++++++++++++++++++
>  4 files changed, 140 insertions(+)
>  create mode 100644 drivers/usb/dwc3/dwc3-generic-sti.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8c6c0c2a4bc..5d7e251e601 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -656,6 +656,7 @@ F:	drivers/mmc/sti_sdhci.c
>  F:	drivers/reset/sti-reset.c
>  F:	drivers/serial/serial_sti_asc.c
>  F:	drivers/sysreset/sysreset_sti.c
> +F:	drivers/usb/host/dwc3-sti.c
>  F:	drivers/timer/arm_global_timer.c
>  F:	drivers/usb/host/dwc3-sti-glue.c
>  F:	include/dwc3-sti-glue.h
> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> index 0100723a68b..7d58ae65fb6 100644
> --- a/drivers/usb/dwc3/Kconfig
> +++ b/drivers/usb/dwc3/Kconfig
> @@ -87,6 +87,12 @@ config USB_DWC3_LAYERSCAPE
>  	  Host and Peripheral operation modes are supported. OTG is not
>  	  supported.
>  
> +config USB_DWC3_STI
> +	bool "STi USB wrapper"
> +	depends on DM_USB && USB_DWC3_GENERIC && SYSCON
> +	help
> +	  Select this for STi Platforms.

The improvements done in v3 based on the comments from v2 look good to me.
However, checkpatch seems unhappy about this:

$ ./scripts/checkpatch.pl --git --u-boot --git master..HEAD

--------------------------------------------------------------
Commit 2a4d2432f669 ("usb: dwc3-generic: Add STih407 support")
--------------------------------------------------------------
WARNING: please write a paragraph that describes the config symbol fully
#42: FILE: drivers/usb/dwc3/Kconfig:90:
+config USB_DWC3_STI

Can't we reuse the help description from 'config USB_XHCI_STI' ?
I'm sorry I missed this before.

With that addressed, please add:

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> +
>  menu "PHY Subsystem"
>  
>  config USB_DWC3_PHY_OMAP
> diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
> index a085c9d4628..985206eafe4 100644
> --- a/drivers/usb/dwc3/Makefile
> +++ b/drivers/usb/dwc3/Makefile
> @@ -15,3 +15,4 @@ obj-$(CONFIG_USB_DWC3_UNIPHIER)		+= dwc3-uniphier.o
>  obj-$(CONFIG_USB_DWC3_LAYERSCAPE)	+= dwc3-layerscape.o
>  obj-$(CONFIG_USB_DWC3_PHY_OMAP)		+= ti_usb_phy.o
>  obj-$(CONFIG_USB_DWC3_PHY_SAMSUNG)	+= samsung_usb_phy.o
> +obj-$(CONFIG_USB_DWC3_STI)		+= dwc3-generic-sti.o
> diff --git a/drivers/usb/dwc3/dwc3-generic-sti.c b/drivers/usb/dwc3/dwc3-generic-sti.c
> new file mode 100644
> index 00000000000..2ff640cede4
> --- /dev/null
> +++ b/drivers/usb/dwc3/dwc3-generic-sti.c
> @@ -0,0 +1,132 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
> +/*
> + * STi specific glue layer for DWC3
> + *
> + * Copyright (C) 2025, STMicroelectronics - All Rights Reserved
> + */
> +
> +#include <reset.h>
> +#include <regmap.h>
> +#include <syscon.h>
> +#include <asm/io.h>
> +#include <dm/device.h>
> +#include <dm/device_compat.h>
> +#include <dm/read.h>
> +#include <linux/usb/otg.h>
> +#include "dwc3-generic.h"
> +
> +/* glue registers */
> +#define CLKRST_CTRL		0x00
> +#define AUX_CLK_EN		BIT(0)
> +#define SW_PIPEW_RESET_N	BIT(4)
> +#define EXT_CFG_RESET_N		BIT(8)
> +
> +#define XHCI_REVISION		BIT(12)
> +
> +#define USB2_VBUS_MNGMNT_SEL1	0x2C
> +#define USB2_VBUS_UTMIOTG	0x1
> +
> +#define SEL_OVERRIDE_VBUSVALID(n)	((n) << 0)
> +#define SEL_OVERRIDE_POWERPRESENT(n)	((n) << 4)
> +#define SEL_OVERRIDE_BVALID(n)		((n) << 8)
> +
> +/* Static DRD configuration */
> +#define USB3_CONTROL_MASK		0xf77
> +
> +#define USB3_DEVICE_NOT_HOST		BIT(0)
> +#define USB3_FORCE_VBUSVALID		BIT(1)
> +#define USB3_DELAY_VBUSVALID		BIT(2)
> +#define USB3_SEL_FORCE_OPMODE		BIT(4)
> +#define USB3_FORCE_OPMODE(n)		((n) << 5)
> +#define USB3_SEL_FORCE_DPPULLDOWN2	BIT(8)
> +#define USB3_FORCE_DPPULLDOWN2		BIT(9)
> +#define USB3_SEL_FORCE_DMPULLDOWN2	BIT(10)
> +#define USB3_FORCE_DMPULLDOWN2		BIT(11)
> +
> +static void dwc3_stih407_glue_configure(struct udevice *dev, int index,
> +					enum usb_dr_mode mode)
> +{
> +	struct dwc3_glue_data *glue = dev_get_plat(dev);
> +	struct regmap *regmap;
> +	ulong syscfg_base;
> +	ulong syscfg_offset;
> +	ulong glue_base;
> +	int ret;
> +
> +	/* deassert both powerdown and softreset */
> +	ret = reset_deassert_bulk(&glue->resets);
> +	if (ret) {
> +		dev_err(dev, "reset_deassert_bulk error: %d\n", ret);
> +		return;
> +	}
> +
> +	regmap = syscon_regmap_lookup_by_phandle(dev, "st,syscfg");
> +	if (IS_ERR(regmap)) {
> +		dev_err(dev, "unable to get st,syscfg, dev %s\n", dev->name);
> +		return;
> +	}
> +
> +	syscfg_base = regmap->ranges[0].start;
> +	glue_base = dev_read_addr_index(dev, 0);
> +	syscfg_offset = dev_read_addr_index(dev, 1);
> +
> +	clrbits_le32(syscfg_base + syscfg_offset, USB3_CONTROL_MASK);
> +
> +	/* glue drd init */
> +	switch (mode) {
> +	case USB_DR_MODE_PERIPHERAL:
> +		clrbits_le32(syscfg_base + syscfg_offset,
> +			     USB3_DELAY_VBUSVALID | USB3_SEL_FORCE_OPMODE |
> +			     USB3_FORCE_OPMODE(0x3) | USB3_SEL_FORCE_DPPULLDOWN2 |
> +			     USB3_FORCE_DPPULLDOWN2 | USB3_SEL_FORCE_DMPULLDOWN2 |
> +			     USB3_FORCE_DMPULLDOWN2);
> +
> +		setbits_le32(syscfg_base + syscfg_offset,
> +			     USB3_DEVICE_NOT_HOST | USB3_FORCE_VBUSVALID);
> +		break;
> +
> +	case USB_DR_MODE_HOST:
> +		clrbits_le32(syscfg_base + syscfg_offset,
> +			     USB3_DEVICE_NOT_HOST | USB3_FORCE_VBUSVALID |
> +			     USB3_SEL_FORCE_OPMODE | USB3_FORCE_OPMODE(0x3) |
> +			     USB3_SEL_FORCE_DPPULLDOWN2 | USB3_FORCE_DPPULLDOWN2 |
> +			     USB3_SEL_FORCE_DMPULLDOWN2 | USB3_FORCE_DMPULLDOWN2);
> +
> +		setbits_le32(syscfg_base + syscfg_offset, USB3_DELAY_VBUSVALID);
> +		break;
> +
> +	default:
> +		dev_err(dev, "Unsupported mode of operation %d\n", mode);
> +		return;
> +	}
> +
> +	/* glue init */
> +	setbits_le32(glue_base + CLKRST_CTRL, AUX_CLK_EN | EXT_CFG_RESET_N | XHCI_REVISION);
> +	clrbits_le32(glue_base + CLKRST_CTRL, SW_PIPEW_RESET_N);
> +
> +	/* configure mux for vbus, powerpresent and bvalid signals */
> +	setbits_le32(glue_base + USB2_VBUS_MNGMNT_SEL1,
> +		     SEL_OVERRIDE_VBUSVALID(USB2_VBUS_UTMIOTG) |
> +		     SEL_OVERRIDE_POWERPRESENT(USB2_VBUS_UTMIOTG) |
> +		     SEL_OVERRIDE_BVALID(USB2_VBUS_UTMIOTG));
> +	setbits_le32(glue_base + CLKRST_CTRL, SW_PIPEW_RESET_N);
> +};
> +
> +struct dwc3_glue_ops stih407_ops = {
> +	.glue_configure = dwc3_stih407_glue_configure,
> +};
> +
> +static const struct udevice_id dwc3_sti_match[] = {
> +	{ .compatible = "st,stih407-dwc3", .data = (ulong)&stih407_ops},
> +	{ /* sentinel */ }
> +};
> +
> +U_BOOT_DRIVER(dwc3_sti_wrapper) = {
> +	.name = "dwc3-sti",
> +	.id = UCLASS_SIMPLE_BUS,
> +	.of_match = dwc3_sti_match,
> +	.bind = dwc3_glue_bind,
> +	.probe = dwc3_glue_probe,
> +	.remove = dwc3_glue_remove,
> +	.plat_auto = sizeof(struct dwc3_glue_data),
> +};
> -- 
> 2.25.1
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
