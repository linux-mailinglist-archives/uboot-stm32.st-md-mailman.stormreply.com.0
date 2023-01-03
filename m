Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A548865C3F4
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Jan 2023 17:34:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CB3CC65048;
	Tue,  3 Jan 2023 16:34:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14EB4C03FCB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jan 2023 16:34:07 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 303ERXXq022737; Tue, 3 Jan 2023 17:34:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=iGuElrPjj3uShhzHnD6lX7DDHaKtqGqmeqYDsILo7xM=;
 b=WdxUK1gOLussDMsBlWacd6wm1E0/e7H5zgP5WamGWve5+gf1Cgqj5dDOc3O2x4OGyzkq
 tAolNJ7Jkg0jdD9e6a0YJ2Nb3c1q8nv5s9OMSJPLhgXLd2gjvEr+KeweQztRtfooi5rd
 hKf2Qb7rcjO6XxGgEnPUgTZ6x0icsamusH5jEE4QI20Xjn5nMjdYoGToj3VNb6+40IDL
 YBRu3bVVfqsPEy0ftriTVo7iHm9o3vn786WSHZeT6XirKJKRIw1yP0lubVI8xLQINTgi
 Y3V4WIyTJNOmuq23W5t/XTOLX+cSOMNxpocsAwFUu0xkTyzHOVFBCbJ6tLH1QaepcPAy qA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mtda65xfb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Jan 2023 17:34:01 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A8A4610002A;
 Tue,  3 Jan 2023 17:34:00 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A12AD22A6F9;
 Tue,  3 Jan 2023 17:34:00 +0100 (CET)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 3 Jan
 2023 17:34:00 +0100
Message-ID: <813b84fb-7c38-7768-07dd-3e9d1737608f@foss.st.com>
Date: Tue, 3 Jan 2023 17:33:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, <u-boot@lists.denx.de>
References: <20221212104437.15838-1-fabrice.gasnier@foss.st.com>
 <20221212104437.15838-2-fabrice.gasnier@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20221212104437.15838-2-fabrice.gasnier@foss.st.com>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-03_05,2023-01-03_02,2022-06-22_01
Cc: Marek Vasut <marex@denx.de>, Thomas Huth <thuth@redhat.com>,
 Sean Anderson <sean.anderson@seco.com>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/3] usb: onboard-hub: add driver to
 manage onboard hub supplies
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

Hi Fabrice

On 12/12/22 11:44, Fabrice Gasnier wrote:
> The main issue the driver addresses is that a USB hub needs to be
> powered before it can be discovered. This is often solved by using
> "regulator-always-on".
> 
> This driver is inspired by the Linux v6.1 driver. It only enables (or
> disables) the hub vdd (3v3) supply, so it can be enumerated.
> Scanning of the device tree is done in a similar manner to the sandbox,
> by the usb-uclass. DT part looks like:
> 
> &usbh_ehci {
> 	...
> 	#address-cells = <1>;
> 	#size-cells = <0>;
> 	hub@1 {
> 		compatible = "usb424,2514";
> 		reg = <1>;
> 		vdd-supply = <&v3v3>;
> 	};
> };
> 
> When the bus gets probed, the driver is automatically probed/removed from
> the bus tree, as an example on stm32:
> STM32MP> usb start
> starting USB...
> STM32MP> dm tree
>  Class     Index  Probed  Driver                Name
> -----------------------------------------------------------
>  usb           0  [ + ]   ehci_generic          |   |-- usb@5800d000
>  usb_hub       0  [ + ]   usb_onboard_hub       |   |   `-- hub@1
>  usb_hub       1  [ + ]   usb_hub               |   |       `-- usb_hub
> 
> STM32MP> usb tree
> USB device tree:
>   1  Hub (480 Mb/s, 0mA)
>   |  u-boot EHCI Host Controller
>   |
>   +-2  Hub (480 Mb/s, 2mA)
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> 
>  common/Makefile               |  1 +
>  common/usb_onboard_hub.c      | 62 +++++++++++++++++++++++++++++++++++
>  drivers/usb/Kconfig           | 10 ++++++
>  drivers/usb/host/usb-uclass.c | 16 +++++----
>  4 files changed, 83 insertions(+), 6 deletions(-)
>  create mode 100644 common/usb_onboard_hub.c
> 
> diff --git a/common/Makefile b/common/Makefile
> index 20addfb244c2..7789aab484fd 100644
> --- a/common/Makefile
> +++ b/common/Makefile
> @@ -26,6 +26,7 @@ obj-$(CONFIG_PHYLIB) += miiphyutil.o
>  obj-$(CONFIG_USB_HOST) += usb.o usb_hub.o
>  obj-$(CONFIG_USB_GADGET) += usb.o usb_hub.o
>  obj-$(CONFIG_USB_STORAGE) += usb_storage.o
> +obj-$(CONFIG_USB_ONBOARD_HUB) += usb_onboard_hub.o
>  
>  # others
>  obj-$(CONFIG_CONSOLE_MUX) += iomux.o
> diff --git a/common/usb_onboard_hub.c b/common/usb_onboard_hub.c
> new file mode 100644
> index 000000000000..89e18a2ddad6
> --- /dev/null
> +++ b/common/usb_onboard_hub.c
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Driver for onboard USB hubs
> + *
> + * Copyright (C) 2022, STMicroelectronics - All Rights Reserved
> + *
> + * Mostly inspired by Linux kernel v6.1 onboard_usb_hub driver
> + */
> +
> +#include <common.h>
> +#include <dm.h>
> +#include <dm/device_compat.h>
> +#include <power/regulator.h>
> +
> +struct onboard_hub {
> +	struct udevice *vdd;
> +};
> +
> +static int usb_onboard_hub_probe(struct udevice *dev)
> +{
> +	struct onboard_hub *hub = dev_get_priv(dev);
> +	int ret;
> +
> +	ret = device_get_supply_regulator(dev, "vdd-supply", &hub->vdd);
> +	if (ret) {
> +		dev_err(dev, "can't get vdd-supply: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regulator_set_enable_if_allowed(hub->vdd, true);
> +	if (ret)
> +		dev_err(dev, "can't enable vdd-supply: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int usb_onboard_hub_remove(struct udevice *dev)
> +{
> +	struct onboard_hub *hub = dev_get_priv(dev);
> +	int ret;
> +
> +	ret = regulator_set_enable_if_allowed(hub->vdd, false);
> +	if (ret)
> +		dev_err(dev, "can't disable vdd-supply: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static const struct udevice_id usb_onboard_hub_ids[] = {
> +	/* Use generic usbVID,PID dt-bindings (usb-device.yaml) */
> +	{ .compatible = "usb424,2514" }, /* USB2514B USB 2.0 */
> +	{ }
> +};
> +
> +U_BOOT_DRIVER(usb_onboard_hub) = {
> +	.name	= "usb_onboard_hub",
> +	.id	= UCLASS_USB_HUB,
> +	.probe = usb_onboard_hub_probe,
> +	.remove = usb_onboard_hub_remove,
> +	.of_match = usb_onboard_hub_ids,
> +	.priv_auto = sizeof(struct onboard_hub),
> +};
> diff --git a/drivers/usb/Kconfig b/drivers/usb/Kconfig
> index 3afb45d5ccb2..d10ee6853d40 100644
> --- a/drivers/usb/Kconfig
> +++ b/drivers/usb/Kconfig
> @@ -106,6 +106,16 @@ config USB_KEYBOARD
>  	  Say Y here if you want to use a USB keyboard for U-Boot command line
>  	  input.
>  
> +config USB_ONBOARD_HUB
> +	bool "Onboard USB hub support"
> +	depends on DM_USB
> +	---help---
> +	  Say Y here if you want to support discrete onboard USB hubs that
> +	  don't require an additional control bus for initialization, but
> +	  need some non-trivial form of initialization, such as enabling a
> +	  power regulator. An example for such a hub is the Microchip
> +	  USB2514B.
> +
>  if USB_KEYBOARD
>  
>  config USB_KEYBOARD_FN_KEYS
> diff --git a/drivers/usb/host/usb-uclass.c b/drivers/usb/host/usb-uclass.c
> index 060f3441df0c..f5dc93ffee39 100644
> --- a/drivers/usb/host/usb-uclass.c
> +++ b/drivers/usb/host/usb-uclass.c
> @@ -271,19 +271,23 @@ int usb_init(void)
>  		/* init low_level USB */
>  		printf("Bus %s: ", bus->name);
>  
> -#ifdef CONFIG_SANDBOX
>  		/*
>  		 * For Sandbox, we need scan the device tree each time when we
>  		 * start the USB stack, in order to re-create the emulated USB
>  		 * devices and bind drivers for them before we actually do the
>  		 * driver probe.
> +		 *
> +		 * For USB onboard HUB, we need to do some non-trivial init
> +		 * like enabling a power regulator, before enumeration.
>  		 */
> -		ret = dm_scan_fdt_dev(bus);
> -		if (ret) {
> -			printf("Sandbox USB device scan failed (%d)\n", ret);
> -			continue;
> +		if (IS_ENABLED(CONFIG_SANDBOX) ||
> +		    IS_ENABLED(CONFIG_USB_ONBOARD_HUB)) {
> +			ret = dm_scan_fdt_dev(bus);
> +			if (ret) {
> +				printf("USB device scan from fdt failed (%d)", ret);
> +				continue;
> +			}
>  		}
> -#endif
>  
>  		ret = device_probe(bus);
>  		if (ret == -ENODEV) {	/* No such device. */

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
