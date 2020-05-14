Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F601D2B71
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 May 2020 11:30:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4398C36B10
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 May 2020 09:30:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11B2FC36B0E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 09:30:21 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04E9SQ9Z028045; Thu, 14 May 2020 11:30:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=nX6zHtJrg9wNo5o/tZWaJz9PVvzZZFmtjn0fsX4qEv0=;
 b=eJCXjzdTR5R8mgkfl3MIFQAU4SWDsqsKOxr2armr+PeCyUIHqfgYlizWeLpJnw2U2Yb9
 mjqXdQOXh0QOurMnEjDJ7QGmHFFJ286D9tKbObyyKZdepXKqVZsXSimctWH2x9dQ6LMm
 cH5RhUcB3Y5yqLxT23HIWx3klA3vqvj0bdCERtrbPpKx4jVOt9QqOcCXolM2x/B7hzEH
 uKXQZJQAlL5LMi9APaVMOsSPoEx1Jdv2aqtQKgVGjJWPZG8WdumyOb48VfOfwxD8pV75
 ELS6/XhX0N0Y/i7s7kksBcJoQxDjVFbZO4CtSR0M2C56vM3w66AA2783ZqMRHh8eT13J Cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3100vna3ag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 11:30:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9CE3E10002A;
 Thu, 14 May 2020 11:30:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 911812AEF1D;
 Thu, 14 May 2020 11:30:17 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 May
 2020 11:30:17 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 14 May 2020 11:30:17 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2 00/12] stm32mp1: several board and arch updates
Thread-Index: AQHWGKGmVxXSRbf4b0+LXCZAToDDVqincw7A
Date: Thu, 14 May 2020 09:30:16 +0000
Message-ID: <9d92f0ec666f45df980fde2c3dcd4cec@SFHDAG6NODE3.st.com>
References: <20200422122920.19340-1-patrick.delaunay@st.com>
In-Reply-To: <20200422122920.19340-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-14_02:2020-05-13,
 2020-05-14 signatures=0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>, Wolfgang Denk <wd@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 00/12] stm32mp1: several board and arch
	updates
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

Hi,

> From: Patrick DELAUNAY <patrick.delaunay@st.com>
> Sent: mercredi 22 avril 2020 14:29
> 
> 
> It is a V2 for the serie
> http://patchwork.ozlabs.org/project/uboot/list/?series=167872
> 
> Rebased on master branch and after the first reviews:
> 
> [01/16] arm: stm32mp: update dependency for STM32_ETZPC
>   is already accepted/merged
> 
> [03/16] arm: stm32mp: reset to default environment when serial# change [04/16]
> arm: stm32mp: detect U-Boot version used to save environment [11/16] board:
> stm32mp1: check env_get result in board_late_init
>   are dropped
> 
> [05/16] arm: stm32mp: spl: add bsec driver in SPL
>   this unrelated patch is moved in a separate serie:
>   "stm32mp1: use OPP information for PLL1 settings in SPL"
> 
> 
> Changes in v2:
> - minor commit message update
> - simplify patch after Wolfgang review, as console init alway failed when
>   drivers can't probe (remove printf after preloader_console_init call)
> - use CONFIG_IS_ENABLED(LED) everywhere
> - remove debug message and unused return of board_ev1_init
> - remove bootdelay configuration after Wolfgang's comment on dropped patch
>   [11/16] board: stm32mp1: check env_get result in board_late_init
> 
> Christophe Roullier (1):
>   configs: stm32mp1: activate Ethernet PHY Realtek
> 
> Patrice Chotard (1):
>   board: stm32mp1: Keep error led ON in case of low power detection
> 
> Patrick Delaunay (10):
>   arm: stm32mp: remove dependency for STM32KEY
>   arm: stm32mp: spl: update error management in board_init_f
>   board: stm32mp1: update management of boot-led
>   board: stm32mp1: gt9147 IRQ before reset on EV1
>   board: stm32mp1: set environment variable fdtfile
>   board: stm32mp1: remove bootdelay configuration for usb or serial boot
>   board: stm32mp1: add timeout for I/O compensation ready
>   gpio: stm32: support gpio ops in SPL
>   ARM: dts: stm32mp15: use DDR3 files generated by STM32CubeMX
>   configs: stm32mp1: activate CONFIG_ERRNO_STR
> 
>  .../dts/stm32mp15-ddr3-1x4Gb-1066-binG.dtsi   |  49 +++++----
>  .../dts/stm32mp15-ddr3-2x4Gb-1066-binG.dtsi   |  49 +++++----
>  arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi      |   4 -
>  arch/arm/dts/stm32mp157c-ed1-u-boot.dtsi      |   4 -
>  arch/arm/mach-stm32mp/Kconfig                 |   2 -
>  arch/arm/mach-stm32mp/spl.c                   |   6 +-
>  board/st/stm32mp1/stm32mp1.c                  | 102 +++++++++++++-----
>  configs/stm32mp15_basic_defconfig             |   2 +
>  configs/stm32mp15_trusted_defconfig           |   2 +
>  drivers/gpio/stm32_gpio.c                     |   7 +-
>  10 files changed, 130 insertions(+), 97 deletions(-)
> 
> --
> 2.17.1

For the serie applied to u-boot-stm/master, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
