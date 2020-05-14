Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ED91D2B56
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 May 2020 11:26:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5415AC36B10
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 May 2020 09:26:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00C1FC36B0E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 09:26:26 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04E9HOCs013020; Thu, 14 May 2020 11:26:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=H+wVJJeLjdn1FfK/SInTLLMPywDlVeE9j0Wq32tgJ/U=;
 b=gHxwwA8GJf++vBVvkeXBkCuHRCzb8iEwVQUorhv2oixlMDocEOobBCUlmzNNSR6En2WR
 ugGyAJV+MN8dpQi2LuCkU7R1OQwfR1sEXjKToDdf7FOsnZgmnC6/oqCC7ikBrnb6vIR0
 LYm2A8LGr/HWis3p0wel7vQxq5WRCcwwMmAZOcwmUGwY18W1iVyQZHhQjYkGC8HPLH+L
 1yrNIyRtPS8+RTadf7aiB1D1ybIUjk8UGGRo3r1CKZn2EUtlGxZoYaaTArQVPqVPuFs1
 bVahIaJiuJnpD1jdv9Z3a+Mu1G6l9tQIsCJ8jkwjHXaynJYdNNcMiekPoeB8vrWLkNzm 0A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3100vyj7vq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 11:26:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 692AD10002A;
 Thu, 14 May 2020 11:26:18 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 513632AEF18;
 Thu, 14 May 2020 11:26:18 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 14 May
 2020 11:26:17 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 14 May 2020 11:26:17 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 00/11] stm32mp1: migrate MTD and DFU configuration in
 Kconfig
Thread-Index: AQHV/P5tBJkklWyop0mQmVRFo2UI+qinqOQA
Date: Thu, 14 May 2020 09:26:17 +0000
Message-ID: <b997f59a04144c269b9ddbc8d99f723e@SFHDAG6NODE3.st.com>
References: <20200318082254.7522-1-patrick.delaunay@st.com>
In-Reply-To: <20200318082254.7522-1-patrick.delaunay@st.com>
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
Cc: Marek Vasut <marex@denx.de>, Boris Brezillon <bbrezillon@kernel.org>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Fabien DESSENNE <fabien.dessenne@st.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 00/11] stm32mp1: migrate MTD and DFU
 configuration in Kconfig
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
> Sent: mercredi 18 mars 2020 09:23
> 
> 
> This serie migrate the dynamically build MTD
> (CONFIG_SYS_MTDPARTS_RUNTIME) and the DFU configuration
> (CONFIG_SET_DFU_ALT_INFO) previously based on ENV variables to
> CONFIG_.
> 
> These patches reduce the size of the environment and allow to tune for each
> target with a specific defconfig file.
> 
> This serie also removes the TEE deconfig, replaced by a dynamic detection
> based on op-tee driver probe.
> 
> This serie depends on previous CONFIG migration proposed in
> http://patchwork.ozlabs.org/project/uboot/list/?series=160899
> - configs: migrate CONFIG_SET_DFU_ALT_INFO to defconfigs
> - configs: migrate CONFIG_SYS_MTDPARTS_RUNTIME to defconfigs
> 
> 
> 
> Patrick Delaunay (11):
>   board: stm32mp1: move board_get_mtdparts in st common directory
>   board: stm32mp1: move set_dfu_alt_info in st common directory
>   stm32mp1: dynamically build DFU_ALT_INFO
>   stm32mp1: move MTDPART configuration in Kconfig
>   board: stm32mp1: reserve memory for OP-TEE in device tree
>   stm32mp1: dynamically detect op-tee presence
>   board: stm32mp1: use FDT address provided by TF-A at boot time
>   configs: stm32mp1: remove optee defconfig
>   board: stm32mp1: support boot from spi-nand
>   board: stm32mp1: adapt MTD partition for BOOT from NOR or NAND
>   doc: stm32mp1: update DFU support example
> 
>  arch/arm/dts/stm32mp157a-dk1.dts           |   5 +
>  arch/arm/dts/stm32mp157c-ed1.dts           |   5 +
>  arch/arm/mach-stm32mp/Kconfig              |  10 -
>  arch/arm/mach-stm32mp/Makefile             |   1 +
>  arch/arm/mach-stm32mp/boot_params.c        |  45 ++++
>  arch/arm/mach-stm32mp/cpu.c                |   4 +
>  arch/arm/mach-stm32mp/dram_init.c          |  18 ++
>  arch/arm/mach-stm32mp/fdt.c                |  25 ++
>  arch/arm/mach-stm32mp/include/mach/stm32.h |   3 +
>  arch/arm/mach-stm32mp/spl.c                |   2 +
>  board/dhelectronics/dh_stm32mp1/Kconfig    |   1 +
>  board/dhelectronics/dh_stm32mp1/Makefile   |   3 +
>  board/dhelectronics/dh_stm32mp1/board.c    | 143 +-----------
>  board/st/common/Kconfig                    |  64 ++++++
>  board/st/common/Makefile                   |   5 +
>  board/st/common/stm32mp_dfu.c              | 225 ++++++++++++++++++
>  board/st/common/stm32mp_mtdparts.c         | 157 +++++++++++++
>  board/st/stm32mp1/MAINTAINERS              |   1 -
>  board/st/stm32mp1/stm32mp1.c               | 253 +--------------------
>  configs/stm32mp15_optee_defconfig          | 132 -----------
>  configs/stm32mp15_trusted_defconfig        |   3 +
>  doc/board/st/stm32mp1.rst                  | 147 +++++-------
>  include/configs/stm32mp1.h                 |  64 +-----
>  23 files changed, 634 insertions(+), 682 deletions(-)  create mode 100644
> arch/arm/mach-stm32mp/boot_params.c
>  create mode 100644 board/st/common/stm32mp_dfu.c  create mode 100644
> board/st/common/stm32mp_mtdparts.c
>  delete mode 100644 configs/stm32mp15_optee_defconfig
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
