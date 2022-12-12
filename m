Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6079D64A016
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Dec 2022 14:19:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3804C65047;
	Mon, 12 Dec 2022 13:19:51 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2966FC035BC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Dec 2022 13:19:50 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 365C1838DB;
 Mon, 12 Dec 2022 14:19:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1670851189;
 bh=uh32mogpwhGVhSW6scv8Ifso5CPYrZlF/nkdHD9Fqws=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dYIsZk8ABqDPC4OhUIERQF4zdCIMJ1peChblDXh4dvA5IHM4vIV8dNk7gMf4z/clw
 LoI7c7Ge+S8AKA+B2AhXjkH+AwVsrGQIudl0Ln58kGZXw4ZYThPy16X6LnEu8vKxLh
 Ff4Bvvs7T/67MyAHyQWdWdwWmsOn6KGTvBccEzh4hNFQ/voaqwxQ261tGUTjohIubb
 3upVoK0vbyFSYNl38VosDvfHbQGmsMGa8J2MbesIv6MxbjdSp8fyAFk51tmCnpfG4W
 dQK2110sBhlVykTS6t4f7MSlF5/wqYbHV2fsI2HD0kbuGpMXsIM79kAxTZgwZ1z2on
 121yajstNIKsg==
Message-ID: <78cd07dc-3a80-2dbe-9295-4594520f84b8@denx.de>
Date: Mon, 12 Dec 2022 14:19:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, u-boot@lists.denx.de
References: <20221212104437.15838-1-fabrice.gasnier@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221212104437.15838-1-fabrice.gasnier@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Tom Rini <trini@konsulko.com>, Thomas Huth <thuth@redhat.com>,
 Sean Anderson <sean.anderson@seco.com>, Simon Glass <sjg@chromium.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Ovidiu Panait <ovidiu.panait@windriver.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 0/3] Add support for USB onboard HUB,
	used on stm32 boards
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

On 12/12/22 11:44, Fabrice Gasnier wrote:
> This series adds a driver to support USB onboard HUB, inspired by Linux
> onboard hub driver.
> 
> Purpose is to manage the power supply regulator on STM32 boards, for
> low power use case in Linux. U-boot driver allows to benefit of the
> device tree part to supply the HUB when need, instead using an
> always-on regulator.
> 
> It aligns the relevant DT part from emerging Linux v6.2. It also adds the
> relevant default configuration on stm32mp15.
> 
> 
> Fabrice Gasnier (3):
>    usb: onboard-hub: add driver to manage onboard hub supplies
>    configs: stm32: enable USB onboard HUB driver
>    ARM: dts: stm32: add support for USB2514B onboard hub on
>      stm32mp157c-ev1
> 
>   arch/arm/dts/stm32mp157c-ev1.dts    |  8 ++++
>   common/Makefile                     |  1 +
>   common/usb_onboard_hub.c            | 62 +++++++++++++++++++++++++++++
>   configs/stm32mp15_basic_defconfig   |  1 +
>   configs/stm32mp15_defconfig         |  1 +
>   configs/stm32mp15_trusted_defconfig |  1 +
>   drivers/usb/Kconfig                 | 10 +++++
>   drivers/usb/host/usb-uclass.c       | 16 +++++---
>   8 files changed, 94 insertions(+), 6 deletions(-)
>   create mode 100644 common/usb_onboard_hub.c

+CC Michal
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
