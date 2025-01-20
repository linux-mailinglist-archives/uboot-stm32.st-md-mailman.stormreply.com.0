Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFFAA1675F
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Jan 2025 08:31:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 832F7C6C83D;
	Mon, 20 Jan 2025 07:31:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82CB2C640E5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jan 2025 07:31:24 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50JM3vho022868;
 Mon, 20 Jan 2025 08:31:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 e9HgyYfdF4nt2MixTqhKTtQ85G0Iz9PWsaV/boxegc8=; b=ZgCV1QKeSCck7zeP
 ybhHTdEnLNZan+RHBf/U2s2bks0AYWp8emc2Kc7SgWH04Fu3EKy/3LI6Z1dzKB5j
 bxbBnWaF6HjeWfTl0m88hh4nTy5U+VAXudgoKsqnuvtnCiBYw3RedN2NO3Fz/pHv
 3NsdgfzqZlIkj71UifnHnMqN0FZWqfnck1wR5KeCVitw7oyWAKgcZ1mC/T9gsizq
 2gwZCnFmGsP+CWguvQV2lr0hVbHJm/+uVRE2j24oJfUWdMhAk8+XzESZC9DFgDzv
 neIfj9mDS0gn43//OAOYQ/1ZEPgCHq17ARnuVdHyWT133j2dWeRt1ZW8gcFuRqr1
 exaoEA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4482a851tv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jan 2025 08:31:03 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3EE9240046;
 Mon, 20 Jan 2025 08:29:36 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0EE7926DC7D;
 Mon, 20 Jan 2025 08:28:41 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 20 Jan
 2025 08:28:40 +0100
Message-ID: <d5af55b9-fd22-4bb3-af50-22bfd3dd72a0@foss.st.com>
Date: Mon, 20 Jan 2025 08:28:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>, <u-boot@lists.denx.de>
References: <20250116081738.2511223-1-patrice.chotard@foss.st.com>
 <20250116081738.2511223-5-patrice.chotard@foss.st.com>
 <871px383a6.fsf@baylibre.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <871px383a6.fsf@baylibre.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_01,2025-01-20_01,2024-11-22_01
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



On 1/16/25 11:24, Mattijs Korpershoek wrote:
> Hi Patrice,
> 
> Thank you for the patch.
> 
> On jeu., janv. 16, 2025 at 09:17, Patrice Chotard <patrice.chotard@foss.st.com> wrote:
> 
>> Add STi glue logic to manage the DWC3 HC on STiH407
>> SoC family. It configures the internal glue logic and
>> syscfg registers.
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Marek Vasut <marex@denx.de>
>>
>> ---
>>
>> Changes in v2:
>>   - add dwc3-sti.c DWC3 wrapper as done for dwc3-am62.c
>>
>>  MAINTAINERS                         |   1 +
>>  drivers/usb/dwc3/Kconfig            |   6 ++
>>  drivers/usb/dwc3/Makefile           |   1 +
>>  drivers/usb/dwc3/dwc3-generic-sti.c | 127 ++++++++++++++++++++++++++++
>>  4 files changed, 135 insertions(+)
>>  create mode 100644 drivers/usb/dwc3/dwc3-generic-sti.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 8c6c0c2a4bc..5d7e251e601 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -656,6 +656,7 @@ F:	drivers/mmc/sti_sdhci.c
>>  F:	drivers/reset/sti-reset.c
>>  F:	drivers/serial/serial_sti_asc.c
>>  F:	drivers/sysreset/sysreset_sti.c
>> +F:	drivers/usb/host/dwc3-sti.c
>>  F:	drivers/timer/arm_global_timer.c
>>  F:	drivers/usb/host/dwc3-sti-glue.c
>>  F:	include/dwc3-sti-glue.h
>> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
>> index 0100723a68b..7d58ae65fb6 100644
>> --- a/drivers/usb/dwc3/Kconfig
>> +++ b/drivers/usb/dwc3/Kconfig
>> @@ -87,6 +87,12 @@ config USB_DWC3_LAYERSCAPE
>>  	  Host and Peripheral operation modes are supported. OTG is not
>>  	  supported.
>>  
>> +config USB_DWC3_STI
>> +	bool "STi USB wrapper"
>> +	depends on DM_USB && USB_DWC3_GENERIC && SYSCON
>> +	help
>> +	  Select this for STi Platforms.
>> +
>>  menu "PHY Subsystem"
>>  
>>  config USB_DWC3_PHY_OMAP
>> diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
>> index a085c9d4628..985206eafe4 100644
>> --- a/drivers/usb/dwc3/Makefile
>> +++ b/drivers/usb/dwc3/Makefile
>> @@ -15,3 +15,4 @@ obj-$(CONFIG_USB_DWC3_UNIPHIER)		+= dwc3-uniphier.o
>>  obj-$(CONFIG_USB_DWC3_LAYERSCAPE)	+= dwc3-layerscape.o
>>  obj-$(CONFIG_USB_DWC3_PHY_OMAP)		+= ti_usb_phy.o
>>  obj-$(CONFIG_USB_DWC3_PHY_SAMSUNG)	+= samsung_usb_phy.o
>> +obj-$(CONFIG_USB_DWC3_STI)		+= dwc3-generic-sti.o
>> diff --git a/drivers/usb/dwc3/dwc3-generic-sti.c b/drivers/usb/dwc3/dwc3-generic-sti.c
>> new file mode 100644
>> index 00000000000..e316e88d2f8
>> --- /dev/null
>> +++ b/drivers/usb/dwc3/dwc3-generic-sti.c
>> @@ -0,0 +1,127 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
>> +/*
>> + * STi specific glue layer for DWC3
>> + *
>> + * Copyright (C) 2025, STMicroelectronics - All Rights Reserved
>> + */
>> +
>> +#include <reset.h>
>> +#include <regmap.h>
>> +#include <syscon.h>
>> +#include <asm/io.h>
>> +#include <dm/device.h>
>> +#include <dm/read.h>
>> +#include <linux/usb/otg.h>
>> +#include "dwc3-generic.h"
>> +
>> +/* glue registers */
>> +#define CLKRST_CTRL		0x00
>> +#define AUX_CLK_EN		BIT(0)
>> +#define SW_PIPEW_RESET_N	BIT(4)
>> +#define EXT_CFG_RESET_N		BIT(8)
>> +
>> +#define XHCI_REVISION		BIT(12)
>> +
>> +#define USB2_VBUS_MNGMNT_SEL1	0x2C
>> +#define USB2_VBUS_UTMIOTG	0x1
>> +
>> +#define SEL_OVERRIDE_VBUSVALID(n)	((n) << 0)
>> +#define SEL_OVERRIDE_POWERPRESENT(n)	((n) << 4)
>> +#define SEL_OVERRIDE_BVALID(n)		((n) << 8)
>> +
>> +/* Static DRD configuration */
>> +#define USB3_CONTROL_MASK		0xf77
>> +
>> +#define USB3_DEVICE_NOT_HOST		BIT(0)
>> +#define USB3_FORCE_VBUSVALID		BIT(1)
>> +#define USB3_DELAY_VBUSVALID		BIT(2)
>> +#define USB3_SEL_FORCE_OPMODE		BIT(4)
>> +#define USB3_FORCE_OPMODE(n)		((n) << 5)
>> +#define USB3_SEL_FORCE_DPPULLDOWN2	BIT(8)
>> +#define USB3_FORCE_DPPULLDOWN2		BIT(9)
>> +#define USB3_SEL_FORCE_DMPULLDOWN2	BIT(10)
>> +#define USB3_FORCE_DMPULLDOWN2		BIT(11)
>> +
>> +static void dwc3_stih407_glue_configure(struct udevice *dev, int index,
>> +					enum usb_dr_mode mode)
>> +{
>> +	struct dwc3_glue_data *glue = dev_get_plat(dev);
>> +	struct regmap *regmap;
>> +	ulong syscfg_base;
>> +	ulong syscfg_offset;
>> +	ulong glue_base;
>> +	int ret;
>> +
>> +	/* deassert both powerdown and softreset */
>> +	ret = reset_deassert_bulk(&glue->resets);
>> +	if (ret) {
>> +		debug("reset_deassert_bulk error: %d\n", ret);
> 
> Maybe promote this to a warning message? debug() seems a little too low
> priority for an error like this.

Right, i will add a dev_derr() instead.

> 
>> +		return;
>> +	}
>> +
>> +	regmap = syscon_regmap_lookup_by_phandle(dev, "st,syscfg");
> 
> syscon_regmap_lookup_by_phandle() can fail, in that case, error handling
> should be done with IS_ERR(regmap). Can we add that, please?
> 
> Otherwise we might do PTR_ERR->ranges[0].start the line below.

ok

> 
>> +
>> +	syscfg_base = regmap->ranges[0].start;
>> +	glue_base = dev_read_addr_index(dev, 0);
>> +	syscfg_offset = dev_read_addr_index(dev, 1);
>> +
>> +	clrbits_le32(syscfg_base + syscfg_offset, USB3_CONTROL_MASK);
>> +
>> +	/* glue drd init */
>> +	switch (mode) {
>> +	case USB_DR_MODE_PERIPHERAL:
>> +		clrbits_le32(syscfg_base + syscfg_offset,
>> +			     USB3_DELAY_VBUSVALID | USB3_SEL_FORCE_OPMODE |
>> +			     USB3_FORCE_OPMODE(0x3) | USB3_SEL_FORCE_DPPULLDOWN2 |
>> +			     USB3_FORCE_DPPULLDOWN2 | USB3_SEL_FORCE_DMPULLDOWN2 |
>> +			     USB3_FORCE_DMPULLDOWN2);
>> +
>> +		setbits_le32(syscfg_base + syscfg_offset,
>> +			     USB3_DEVICE_NOT_HOST | USB3_FORCE_VBUSVALID);
>> +		break;
>> +
>> +	case USB_DR_MODE_HOST:
>> +		clrbits_le32(syscfg_base + syscfg_offset,
>> +			     USB3_DEVICE_NOT_HOST | USB3_FORCE_VBUSVALID |
>> +			     USB3_SEL_FORCE_OPMODE | USB3_FORCE_OPMODE(0x3) |
>> +			     USB3_SEL_FORCE_DPPULLDOWN2 | USB3_FORCE_DPPULLDOWN2 |
>> +			     USB3_SEL_FORCE_DMPULLDOWN2 | USB3_FORCE_DMPULLDOWN2);
>> +
>> +		setbits_le32(syscfg_base + syscfg_offset, USB3_DELAY_VBUSVALID);
>> +		break;
>> +
>> +	default:
>> +		debug("Unsupported mode of operation %d\n", mode);
>> +		return;
> 
> Nitpick, I think that mode being an enum (with a finite number of values
> possibles), we not necessarily have to check if the value is invalid.
> But it's okay for me if this stays the same.

Nevertheless i will replace debug() by dev_err()

Thanks
Patrice

> 
>> +	}
>> +
>> +	/* glue init */
>> +	setbits_le32(glue_base + CLKRST_CTRL, AUX_CLK_EN | EXT_CFG_RESET_N | XHCI_REVISION);
>> +	clrbits_le32(glue_base + CLKRST_CTRL, SW_PIPEW_RESET_N);
>> +
>> +	/* configure mux for vbus, powerpresent and bvalid signals */
>> +	setbits_le32(glue_base + USB2_VBUS_MNGMNT_SEL1,
>> +		     SEL_OVERRIDE_VBUSVALID(USB2_VBUS_UTMIOTG) |
>> +		     SEL_OVERRIDE_POWERPRESENT(USB2_VBUS_UTMIOTG) |
>> +		     SEL_OVERRIDE_BVALID(USB2_VBUS_UTMIOTG));
>> +	setbits_le32(glue_base + CLKRST_CTRL, SW_PIPEW_RESET_N);
>> +};
>> +
>> +struct dwc3_glue_ops stih407_ops = {
>> +	.glue_configure = dwc3_stih407_glue_configure,
>> +};
>> +
>> +static const struct udevice_id dwc3_sti_match[] = {
>> +	{ .compatible = "st,stih407-dwc3", .data = (ulong)&stih407_ops},
>> +	{ /* sentinel */ }
>> +};
>> +
>> +U_BOOT_DRIVER(dwc3_sti_wrapper) = {
>> +	.name = "dwc3-sti",
>> +	.id = UCLASS_SIMPLE_BUS,
>> +	.of_match = dwc3_sti_match,
>> +	.bind = dwc3_glue_bind,
>> +	.probe = dwc3_glue_probe,
>> +	.remove = dwc3_glue_remove,
>> +	.plat_auto = sizeof(struct dwc3_glue_data),
>> +};
>> -- 
>> 2.25.1
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
