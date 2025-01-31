Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 858BEA239D8
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jan 2025 08:16:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1BAA8C7128F;
	Fri, 31 Jan 2025 07:16:41 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6053BC71280
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2025 07:16:34 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43634b570c1so11540225e9.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2025 23:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738307794; x=1738912594;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=W0hWIToZaEe3/cmeC2S7Nrx2q+LT/9E1XE5w0H6ZUng=;
 b=ax4Q1jylAPBDnbq3QUvRXqgUacgR5zft8OG0HnQfF0ZRh4t4zL/5e7/VzPQ0tUfg2n
 aq9IMPTJAcWtG8iqq9k+bVULujvlEqMdVRuRQ4C2Zc+CKB4seEycoh/xwiTUyy5EMhkl
 9D4pIFOznurLnP4xl2dsq2FvaDQoLiOktaTTpkcHb4NbNCDy2UKxs7RmjFWMUQtCgclP
 jTk0jXEPQRomb3md+KFnXlAptb3a1VgNTpg8odfe2qwM1FJvaS73guB6u4LX1Y7MCaKN
 izWfTS27ey4cHH9hP6IaT8wlnnLIsJ3F4pjOTBUV0vzvD7R80zl/SEEgRyanf6Ho4mru
 7wsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738307794; x=1738912594;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W0hWIToZaEe3/cmeC2S7Nrx2q+LT/9E1XE5w0H6ZUng=;
 b=dHjFSuErLTe48XGwBLxQ+lVGua358wPxV7xXa/cKTSgZvSXkmq01cEnYseN/KGZ7eg
 rpYd8wFhyn3YkS+CpvEg9jk5eLUkwCSA4joIqREVm+u+yX+6TI3WD3PIPCRDynhNtovm
 3BDbqxSqTd9NraUFQ7umEWGqe695CnHMJKqSzaG6dkJg6HEEJjGFu12eB9kD41yLOGT3
 84IhUFp/NKT99UMUtuaQ7AmiGEy3Zsnlm+/1GJ5ay96ziQgxZqr2fFIjCFlSAEvGcZzJ
 J27tzR39neWTMR0307XHAzSndIip1f62xhKD28TaT3SfdssFs5f0YtCoYAOh313GbX0c
 aNwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAJy0NFhLySHRRSNWicOPM11oXBux3RWRF7ikn/d/mClObI5Fph1McDHA+D4OYI6Zq5SP9sNcztFxUWg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxjhz5ndHVteOduGKNYEtod9AtmDdwASwQbCmXKEBxYUNQz53A+
 Y2pt5Zx3rgpSB03j6Ol2JNFVnf7wTxEGf6in5vIlUF0jtWNQCMCfSwU9K4G+tk8=
X-Gm-Gg: ASbGncuaEkmsg0Jm4HfGTG2HQLuSz12pQMebV8eEMbb7ht5vz07Yvj24WTsEVyvPk2z
 GK3vpDtWvuXR6uHZejIzSDI43s6AMUEbsxO7i+Pfdhzus67Al2b6cwto2RK1qKh74UgW2belVsS
 CbJg9YhB6mm87Dw+c07EIbEhI+O5XpM2JLjyz2J1XHjShNyo/aEnE4fe8kTvm7vCSs1vW00n5Ys
 gBX9wIBsPCcLSqgbvlw96I/HONnV3KwiQm2LaoGkXh7uVBABEe4YebhU5xpLSgZGdcqTbXotqJN
 Lp0yNvsZegMU8DWLbOyb1S/d
X-Google-Smtp-Source: AGHT+IH0rS1rIP0gmyz/piA7EO6NOg7EhiaksCaDnBjXOnDxNsGPlVwFBtyFCxwepbhCSdP4z0XVTA==
X-Received: by 2002:a05:600c:1d07:b0:436:aaf:7eb9 with SMTP id
 5b1f17b1804b1-438dc3fc344mr82641575e9.20.1738307793596; 
 Thu, 30 Jan 2025 23:16:33 -0800 (PST)
Received: from localhost ([2a01:cb1a:4074:4dd7:fefe:5ab4:19e5:2ed2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc12f28sm81153815e9.7.2025.01.30.23.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 23:16:33 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
In-Reply-To: <20250130163547.512990-6-patrice.chotard@foss.st.com>
References: <20250130163547.512990-1-patrice.chotard@foss.st.com>
 <20250130163547.512990-6-patrice.chotard@foss.st.com>
Date: Fri, 31 Jan 2025 08:16:27 +0100
Message-ID: <874j1f8nck.fsf@baylibre.com>
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
Subject: Re: [Uboot-stm32] [PATCH v5 5/9] usb: dwc3-generic: Add STih407
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

On jeu., janv. 30, 2025 at 17:35, Patrice Chotard <patrice.chotard@foss.st.com> wrote:

> Add STi glue logic to manage the DWC3 HC on STiH407
> SoC family. It configures the internal glue logic and
> syscfg registers.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Marek Vasut <marex@denx.de>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

>
> ---
>
> Changes in v5:
>   - reorder files entry for ARM STI in MAINTAINERS file
>   - add #define LOG_CATEGORY UCLASS_NOP
>   - use UCLASS_NOP instead of UCLASS_SIMPLE_BUS
>
> Changes in v4:
>   - Update Kconfig description
>
> Changes in v3:
>   - Replace debug() by dev_err()
>   - check return value of syscon_regmap_lookup_by_phandle()
>
> Changes in v2:
>   - add dwc3-sti.c DWC3 wrapper as done for dwc3-am62.c
>
>  MAINTAINERS                         |   1 +
>  drivers/usb/dwc3/Kconfig            |   8 ++
>  drivers/usb/dwc3/Makefile           |   1 +
>  drivers/usb/dwc3/dwc3-generic-sti.c | 134 ++++++++++++++++++++++++++++
>  4 files changed, 144 insertions(+)
>  create mode 100644 drivers/usb/dwc3/dwc3-generic-sti.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0e93f88c2aa..38501775890 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -657,6 +657,7 @@ F:	drivers/reset/sti-reset.c
>  F:	drivers/serial/serial_sti_asc.c
>  F:	drivers/sysreset/sysreset_sti.c
>  F:	drivers/timer/arm_global_timer.c
> +F:	drivers/usb/host/dwc3-sti.c
>  F:	include/dt-bindings/clock/stih407-clks.h
>  F:	include/dt-bindings/clock/stih410-clks.h
>  F:	include/dt-bindings/reset/stih407-resets.h
> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> index 0100723a68b..682a6910655 100644
> --- a/drivers/usb/dwc3/Kconfig
> +++ b/drivers/usb/dwc3/Kconfig
> @@ -87,6 +87,14 @@ config USB_DWC3_LAYERSCAPE
>  	  Host and Peripheral operation modes are supported. OTG is not
>  	  supported.
>  
> +config USB_DWC3_STI
> +	bool "STi USB wrapper"
> +	depends on DM_USB && USB_DWC3_GENERIC && SYSCON
> +	help
> +	  Enables support for the on-chip xHCI controller on STMicroelectronics
> +	  STiH407 family SoCs. This is a driver for the dwc3 to provide the
> +	  glue logic to configure the controller.
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
> index 00000000000..b34f5ceceac
> --- /dev/null
> +++ b/drivers/usb/dwc3/dwc3-generic-sti.c
> @@ -0,0 +1,134 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
> +/*
> + * STi specific glue layer for DWC3
> + *
> + * Copyright (C) 2025, STMicroelectronics - All Rights Reserved
> + */
> +
> +#define LOG_CATEGORY UCLASS_NOP
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
> +	.id = UCLASS_NOP,
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
