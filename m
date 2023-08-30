Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF31578D6D5
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Aug 2023 17:12:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75174C6B444;
	Wed, 30 Aug 2023 15:12:09 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF523C6B442
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Aug 2023 15:12:07 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id F145C863DD;
 Wed, 30 Aug 2023 17:12:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1693408327;
 bh=G/0T1qtXjoNvpqFqoL1+ZXJP1T6eY7OF3aAgDa9WhJs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=z0K2KY1+wl2EDEGptq9X00akNJfGWLkGAhjv4YhSFWr+ivArCP12x2bLDlkeexp/P
 lFdiaoCmqLPwt6GH+OZ2DPMimXV7K8ChIQ1SLnq/M8uhPBlaiRyyJmWlXgjM9TGwHZ
 w2KYkeTn12tlLgaMq0Wc8hrHlvoRSs/ck7ipfwxrDzKZm4Ml9ISSTAmwZawX9eao2L
 ds3ykvLhfLZB5xN+yYVp7qyaQvuiAgulKufJLVKfvde0PHGThOHpYZJ8x397+thrAV
 AjITfZvtSFmH1ko2qvpRBhtCZQScbAobKryQnzkSo9rtvWIdz/kEiKDI/PrbFEFE4E
 /QJywBqaBkp/w==
Message-ID: <4e4f480f-8f97-cf8a-fb55-8d1ebaffb993@denx.de>
Date: Wed, 30 Aug 2023 17:12:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, u-boot@lists.denx.de
References: <20230830080008.455157-1-fabrice.gasnier@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230830080008.455157-1-fabrice.gasnier@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] usb: host: ehci-generic: check for
	companion controller
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

On 8/30/23 10:00, Fabrice Gasnier wrote:
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
>         scanning usb for storage devices... 0 Storage Device(s) found
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
>         scanning usb for storage devices... 0 Storage Device(s) found
> STM32MP> usb tree
> USB device tree:
>    1  Hub (12 Mb/s, 0mA)
>    |   U-Boot Root Hub
>    |
>    +-2  Human Interface (1.5 Mb/s, 100mA)
>         HP HP USB 1000dpi Laser Mouse
> 
>    1  Hub (480 Mb/s, 0mA)
>       u-boot EHCI Host Controller
> 
> This also optimize bus scan when a High speed device is plugged in, as
> the usb-uclass skips OHCI in this case:
> 
> STM32MP> usb reset
> resetting USB...
> Bus usb@5800c000: USB OHCI 1.0
> Bus usb@5800d000: USB EHCI 1.00
> scanning bus usb@5800d000 for devices... 2 USB Device(s) found
>         scanning usb for storage devices... 1 Storage Device(s) found
> STM32MP> usb tree
> USB device tree:
>    1  Hub (480 Mb/s, 0mA)
>    |  u-boot EHCI Host Controller
>    |
>    +-2  Mass Storage (480 Mb/s, 200mA)
>         SanDisk Cruzer Blade 03003432021922011407
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> 
>   drivers/usb/host/ehci-generic.c | 24 ++++++++++++++++++++++++

More of a design question -- shouldn't the usb-uclass handle this 
property ad manipulate with private data of "remote" devices instead ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
