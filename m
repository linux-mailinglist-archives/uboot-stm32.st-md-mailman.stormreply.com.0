Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFFD78FBE3
	for <lists+uboot-stm32@lfdr.de>; Fri,  1 Sep 2023 12:48:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 769E5C6B44C;
	Fri,  1 Sep 2023 10:48:29 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FA7CC6A613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Sep 2023 10:48:28 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7DFD18074B;
 Fri,  1 Sep 2023 12:48:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1693565307;
 bh=ozR27wZwYllD4wrrIzh+oIOYHqZPmL4RxK7TGYR0tVA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hW7F0hjOLNp8/YUtasfObVDwZgsd/gY5UO9noDblfBxqBzRgUI08L8z/4qFanAv7F
 Bc3swx3x12k3Q05PFNtNo9jG5oQ0KHGERGIUDPqoDKNueG57UPDiPq9jenROcfmCpf
 kQZoDq2qwYj6F0Ld9BcQSCcRA/hWHnuOTKwCGijY8Zuk2f+d0HtILBkw5mQTXn8Dly
 MZ2IW7QGXUx+02qDSjcm9b46YAxi72AsEl5F4ffA+dXVff6nHYyt+giokhrS6PMy6W
 6kkEOR+OEYxHMhtZfcC5Ba6fxEmoSmbIrhyFkqSuGKZbyWl+43unvl9q26CH8gJC9f
 PjSCYOnGjicRQ==
Message-ID: <29d44f7f-ffca-d8cd-ce88-5e2fb6103ff4@denx.de>
Date: Fri, 1 Sep 2023 12:48:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, u-boot@lists.denx.de
References: <20230901095201.3874129-1-fabrice.gasnier@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230901095201.3874129-1-fabrice.gasnier@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH v2] usb: check for companion controller in
	uclass
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

On 9/1/23 11:52, Fabrice Gasnier wrote:
> EHCI is usually used with companion controller (like OHCI) as companion
> controller. This information on the companion is missing currently in
> companion drivers.
> So, if the usb-uclass isn't aware, it may scan busses in any order: OHCI
> first, then EHCI.
> This is seen on STM32MP1 where DT probing makes the probe order to occur
> by increasing address (OHCI address < EHCI address).
> 
> When a low speed or full-speed device is plugged in, it's not detected as
> EHCI should first detect it, and give ownership (handover) to OHCI.
> 
> Current situation on STM32MP1 (with a low speed device plugged-in)
> STM32MP> usb start
> starting USB...
> Bus usb@5800c000: USB OHCI 1.0
> Bus usb@5800d000: USB EHCI 1.00
> scanning bus usb@5800c000 for devices... 1 USB Device(s) found
> scanning bus usb@5800d000 for devices... 1 USB Device(s) found
>     scanning usb for storage devices... 0 Storage Device(s) found
> 
> The "companion" property in the device tree allow to retrieve companion
> controller information, from the EHCI node. This allow marking the
> companion driver as such.
> 
> With this patch (same low speed device plugged in):
> STM32MP> usb start
> starting USB...
> Bus usb@5800c000: USB OHCI 1.0
> Bus usb@5800d000: USB EHCI 1.00
> scanning bus usb@5800d000 for devices... 1 USB Device(s) found
> scanning bus usb@5800c000 for devices... 2 USB Device(s) found
>     scanning usb for storage devices... 0 Storage Device(s) found
> STM32MP> usb tree
> USB device tree:
> 1  Hub (12 Mb/s, 0mA)
> |   U-Boot Root Hub
> |
> +-2  Human Interface (1.5 Mb/s, 100mA)
>     HP HP USB 1000dpi Laser Mouse
> 
> 1  Hub (480 Mb/s, 0mA)
>   u-boot EHCI Host Controller
> 
> This also optimize bus scan when a High speed device is plugged in, as
> the usb-uclass skips OHCI in this case:
> 
> STM32MP> usb reset
> resetting USB...
> Bus usb@5800c000: USB OHCI 1.0
> Bus usb@5800d000: USB EHCI 1.00
> scanning bus usb@5800d000 for devices... 2 USB Device(s) found
>     scanning usb for storage devices... 1 Storage Device(s) found
> STM32MP> usb tree
> USB device tree:
> 1  Hub (480 Mb/s, 0mA)
> |  u-boot EHCI Host Controller
> |
> +-2  Mass Storage (480 Mb/s, 200mA)
>     SanDisk Cruzer Blade 03003432021922011407
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> 
> Changes in v2:
> - move companion probing from generic ehci driver to usb-uclass, after
>    Marek's questions on design choice.
> - rename commit title to follow this change
> 
> ---
>   drivers/usb/host/usb-uclass.c | 36 +++++++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/usb/host/usb-uclass.c b/drivers/usb/host/usb-uclass.c
> index 02c0138a2065..e238eee8c84d 100644
> --- a/drivers/usb/host/usb-uclass.c
> +++ b/drivers/usb/host/usb-uclass.c
> @@ -249,6 +249,37 @@ static void remove_inactive_children(struct uclass *uc, struct udevice *bus)
>   	}
>   }
>   
> +static int usb_probe_companion(struct udevice *bus)
> +{
> +	struct udevice *companion_dev;
> +	int ret;
> +
> +	/*
> +	 * Enforce optional companion controller is marked as such in order to
> +	 * 1st scan the primary controller, before the companion controller
> +	 * (ownership is given to companion when low or full speed devices
> +	 * have been detected).
> +	 */
> +	ret = uclass_get_device_by_phandle(UCLASS_USB, bus, "companion", &companion_dev);
> +	if (!ret) {
> +		struct usb_bus_priv *companion_bus_priv;
> +
> +		debug("%s is the companion of %s\n", companion_dev->name, bus->name);
> +		companion_bus_priv = dev_get_uclass_priv(companion_dev);
> +		companion_bus_priv->companion = true;
> +	} else if (ret && ret != -ENOENT && ret != -ENODEV) {
> +		/*
> +		 * Treat everything else than no companion or disabled
> +		 * companion as an error. (It may not be enabled on boards
> +		 * that have a High-Speed HUB to handle FS and LS traffic).
> +		 */
> +		printf("Failed to get companion (ret=%d)\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>   int usb_init(void)
>   {
>   	int controllers_initialized = 0;
> @@ -299,6 +330,11 @@ int usb_init(void)
>   			printf("probe failed, error %d\n", ret);
>   			continue;
>   		}
> +
> +		ret = usb_probe_companion(bus);

Shouldn't this ^ be in separate uclass_foreach_dev(bus, uc) {} loop 
before this device_probe() loop , so that when the probe of the 
controller is called, its ->companion is already set ?

> +		if (ret)
> +			continue;
> +
>   		controllers_initialized++;
>   		usb_started = true;
>   	}

[...]
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
