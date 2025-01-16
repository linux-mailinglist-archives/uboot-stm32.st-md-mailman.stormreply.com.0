Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 116D3A137C0
	for <lists+uboot-stm32@lfdr.de>; Thu, 16 Jan 2025 11:24:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5BEFC78F73;
	Thu, 16 Jan 2025 10:24:42 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C869C78F6D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2025 10:24:35 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-385e0e224cbso361292f8f.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2025 02:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737023074; x=1737627874;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=jrbh09noBsgvE3SaF+kxL2mY6exU1v6bOBGXytwzGv4=;
 b=ZYW5xm2IldnMlLvDoZJl8f7s+B3GYcI7mXHKOKrMQFOo35qC8kAN2u1ByNbQEMdAmH
 aSJ7nxkqnpVNQIb2/642fQ/6zURzigkwZf/9GHlrxN3gm1ak09lQmNGLFrpaIEZ82Uqa
 RvlKk8L0KCHCWdG7E9pieOGYtU1hO0UPUEMWfEujJ2UdJ4Uy0WW4nLqrFMSh8NP7QDmk
 TCHLnBsa7zoNcJFgf4VFw/1NgpLqaZjZuPTqTU4+2fGyIuC9ePnSNlMQhKAVdRZ3yfjW
 V/lhX4b90C0Odn079jjp9HnM8EFdmK0gKkCgMmllKardFI0I7hU5Nuw0H+8eH0OpKIG6
 0DEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737023074; x=1737627874;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jrbh09noBsgvE3SaF+kxL2mY6exU1v6bOBGXytwzGv4=;
 b=BFkKOfttSMrtJLJnbbGWYdJqAaoX2DQRBKigeZEjWLIEBpQDhHhjMhXoezVd0UHqxJ
 8Vp8SipHJn86W2xkd7gNum2+mghq91qLV4HW2YP+Hg+PZ5576FqkjdP/m1HGQR1JyZFy
 VwC714Izrf/rGUJrd7GKXu+mOpILBBG8Q/qAAx2+7UFqYiEZ8Ugw7vSNIWNjFmDbk0em
 pejIQeh6Jei/7y04n02GC/u7OILvJJwXzVDks159c9i8+6wApnacsGearb7S029Gzlwx
 HBY9i9z0YSYfN1F+dp++rNMoWiXGTF9qYyZ4QnD5Agn5Waey1fxbwftlu97wcXeTVDSb
 ExRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFbaXupG2jycBuivhexiWnqaUCBuw7BHNjN7X9IP6OOMVm4/DpP0JSfq2JCuElB/r3sNLGkXsyCJAFrQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxytE1O7JmnjSVE40vXTB/LKE/Pkx31AO9bP30v2L8b4uiXsfEn
 OziNJ/ogdP9k7GHHlsUr5lWtKRSW9hmH/s59u2GDpOGanIA7oBv2bxaO7ZG4QIQ=
X-Gm-Gg: ASbGnct//DAsYRuDGpRi3EOhgh2QAaSv41VcXTxy1oyFJGfeRNYb/8hSP6pj4XI9tuy
 OpCt7NMnGuwocTeH1shNlEKZYhk5y+uBm1cjpvmVmIER/0kPVeYzZSlaoTEorrGwkZqmUNI9rd+
 nDyhyedLS1x7U4LiXHrUHnzAYjnRuIySgBQincTdymX7TgmVrTKGCxjc6fnUytXmlZxo7VvkIqa
 HGEF4e3iIQefB6YADLuvwMafpyBAhH/bp7fF4wDCLfH0PCedAt9i/yFZJYN/KCNAQ==
X-Google-Smtp-Source: AGHT+IFeMNLlTb85xnreknwKXTjqxkQ8KbqzzdjdBqzGesx90z2i/FXLfXqG1Yi2Pky+znippJjQew==
X-Received: by 2002:a05:6000:710:b0:385:e0d6:fb73 with SMTP id
 ffacd0b85a97d-38a872da4ccmr27402272f8f.15.1737023074403; 
 Thu, 16 Jan 2025 02:24:34 -0800 (PST)
Received: from localhost ([2a01:cb19:95ba:5000:d6dd:417f:52ac:335b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c74f9ccasm53618035e9.39.2025.01.16.02.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 02:24:34 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
In-Reply-To: <20250116081738.2511223-5-patrice.chotard@foss.st.com>
References: <20250116081738.2511223-1-patrice.chotard@foss.st.com>
 <20250116081738.2511223-5-patrice.chotard@foss.st.com>
Date: Thu, 16 Jan 2025 11:24:33 +0100
Message-ID: <871px383a6.fsf@baylibre.com>
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Sumit Garg <sumit.garg@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Tom Rini <trini@konsulko.com>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>, Simon Glass <sjg@chromium.org>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sjoerd Simons <sjoerd@collabora.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Robert Marko <robert.marko@sartura.hr>,
 Sam Protsenko <semen.protsenko@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v2 4/9] usb: dwc3-generic: Add STih407
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

On jeu., janv. 16, 2025 at 09:17, Patrice Chotard <patrice.chotard@foss.st.com> wrote:

> Add STi glue logic to manage the DWC3 HC on STiH407
> SoC family. It configures the internal glue logic and
> syscfg registers.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Marek Vasut <marex@denx.de>
>
> ---
>
> Changes in v2:
>   - add dwc3-sti.c DWC3 wrapper as done for dwc3-am62.c
>
>  MAINTAINERS                         |   1 +
>  drivers/usb/dwc3/Kconfig            |   6 ++
>  drivers/usb/dwc3/Makefile           |   1 +
>  drivers/usb/dwc3/dwc3-generic-sti.c | 127 ++++++++++++++++++++++++++++
>  4 files changed, 135 insertions(+)
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
> index 00000000000..e316e88d2f8
> --- /dev/null
> +++ b/drivers/usb/dwc3/dwc3-generic-sti.c
> @@ -0,0 +1,127 @@
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
> +		debug("reset_deassert_bulk error: %d\n", ret);

Maybe promote this to a warning message? debug() seems a little too low
priority for an error like this.

> +		return;
> +	}
> +
> +	regmap = syscon_regmap_lookup_by_phandle(dev, "st,syscfg");

syscon_regmap_lookup_by_phandle() can fail, in that case, error handling
should be done with IS_ERR(regmap). Can we add that, please?

Otherwise we might do PTR_ERR->ranges[0].start the line below.

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
> +		debug("Unsupported mode of operation %d\n", mode);
> +		return;

Nitpick, I think that mode being an enum (with a finite number of values
possibles), we not necessarily have to check if the value is invalid.
But it's okay for me if this stays the same.

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
