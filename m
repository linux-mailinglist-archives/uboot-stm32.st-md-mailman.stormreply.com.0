Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 061131D2B69
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 May 2020 11:28:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0B95C36B10
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 May 2020 09:28:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73A17C36B0E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 09:28:23 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04E9OWAs006333; Thu, 14 May 2020 11:28:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=VpJx7nkugz3NHCkvel2ZOLsJpwxF/rSOVhhbwkIKbHo=;
 b=QQsVcbiks6wOICqjAsXJ+FplDspqP6JaEiw65bxiLFqJ9zA8EiMVg1KHkOL2WGpRrA3A
 HKQ5k4j6szKT2fwpcfTdbyYxGwS0/D692baXhf3CHnYjEHTE75S6OVXJZMYh1BoeVKtM
 WnE7GdsnUc9YFM/0RuqG6HJy3Y46GIoYIyoShSCi+DyCNi4j/mzAaFs3mNrg8gQO1hC4
 Bs1QOt7yQqkXT0h5PfT6+W1jak/8ULystW/iSUXjGFvkHpqp44F7QdUOZTFEWW4qflWM
 ZSBinfAKquoku4FFvTSeSbw0clMO43GJfH9ENyA87KLN+/9okNZ2dF4BGxXaeot+BAt5 iQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3100vqj3f4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 11:28:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 09D6510002A;
 Thu, 14 May 2020 11:28:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EE6E32AEF0C;
 Thu, 14 May 2020 11:28:14 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 May
 2020 11:28:14 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 14 May 2020 11:28:14 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 00/18] stm32mp1: add command stm32prog
Thread-Index: AQHV/P66ULjWNgKoEUqn4LASDjJ2NainqcMA
Date: Thu, 14 May 2020 09:28:14 +0000
Message-ID: <b7f253c10e3a43279eb06ac1cbb2ea82@SFHDAG6NODE3.st.com>
References: <20200318082503.8025-1-patrick.delaunay@st.com>
In-Reply-To: <20200318082503.8025-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-14_01:2020-05-13,
 2020-05-14 signatures=0
Cc: Marek Vasut <marex@denx.de>, Brad Campbell <bradjc5@gmail.com>,
 Patrice CHOTARD <patrice.chotard@st.com>, Lukasz Majewski <lukma@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [Uboot-stm32] [PATCH 00/18] stm32mp1: add command stm32prog
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
> Sent: mercredi 18 mars 2020 09:25
> 
> 
> Add a specific command stm32prog for STM32MP soc family witch allows to
> update the devices on the board with the STMicroelectronics tool
> STM32CubeProgrammer (http://www.st.com/STM32CubeProg).
> 
> This command use the same UART STM32 protocol than MCU STM32 with or
> USB with DFU protocol v1.1 (MCU ST extension are no supported).
> 
> The executed actions are based on a tab separated value file with a stm32 header
> (see https://wiki.st.com/stm32mpu/wiki/STM32CubeProgrammer_flashlayout).
> 
> This FlashLayout file is loaded in DDR by TF-A during during a serial boot or in a
> virtual device by stm32prog command and is parsed by U-Boot (see "AN5275:
> USB DFU/USART protocols used in STM32MP1 Series bootloaders" for details).
> 
> Regards
> Patrick
> 
> 
> 
> Patrick Delaunay (18):
>   usb: gadget: g_dnl: add function g_dnl_set_product
>   dfu: add prototype for dfu_transaction_initiate/cleanup
>   stm32mp: add function get_cpu_dev
>   stm32mp: add the command stm32prog
>   stm32mp: stm32prog: add flash layout parsing
>   stm32mp: stm32prog: add MMC device
>   stm32mp: stm32prog: add support of boot partition for eMMC device
>   stm32mp: stm32prog: add upport of partial update
>   stm32mp: stm32prog: add MTD devices support
>   stm32mp: stm32prog: adapt the MTD partitions
>   stm32mp: stm32prog: add support of ssbl copy
>   stm32mp: stm32prog: add support for delete option in flashlayout
>   stm32mp: stm32prog: add otp update support
>   stm32mp: stm32prog: add pmic NVM update support
>   stm32mp: stm32prog: add serial link support
>   stm32mp: stm32prog: enable videoconsole
>   stm32mp: stm32prog: support for script
>   stm32mp: stm32prog: add support of RAM target
> 
>  arch/arm/mach-stm32mp/Kconfig                 |   17 +
>  arch/arm/mach-stm32mp/Makefile                |    1 +
>  arch/arm/mach-stm32mp/cmd_stm32prog/Makefile  |    9 +
>  .../cmd_stm32prog/cmd_stm32prog.c             |  192 ++
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.c    | 1745 +++++++++++++++++
>  .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |  185 ++
>  .../cmd_stm32prog/stm32prog_serial.c          |  993 ++++++++++
>  .../cmd_stm32prog/stm32prog_usb.c             |  230 +++
>  arch/arm/mach-stm32mp/cpu.c                   |   11 +-
>  .../arm/mach-stm32mp/include/mach/stm32prog.h |   16 +
>  .../arm/mach-stm32mp/include/mach/sys_proto.h |    5 +
>  board/st/common/stm32mp_dfu.c                 |   20 +
>  board/st/common/stm32mp_mtdparts.c            |   14 +-
>  configs/stm32mp15_basic_defconfig             |    7 +-
>  configs/stm32mp15_trusted_defconfig           |    7 +-
>  drivers/usb/gadget/g_dnl.c                    |    8 +
>  include/dfu.h                                 |    3 +
>  include/g_dnl.h                               |    1 +
>  18 files changed, 3445 insertions(+), 19 deletions(-)  create mode 100644
> arch/arm/mach-stm32mp/cmd_stm32prog/Makefile
>  create mode 100644 arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
>  create mode 100644 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
>  create mode 100644 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
>  create mode 100644 arch/arm/mach-
> stm32mp/cmd_stm32prog/stm32prog_serial.c
>  create mode 100644 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
>  create mode 100644 arch/arm/mach-stm32mp/include/mach/stm32prog.h
> 
> --
> 2.17.1

For the serie: applied to u-boot-stm/master, thanks!

Regards

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
