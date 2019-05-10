Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F05F1A16F
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 May 2019 18:27:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 564EBCA8E7C
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 May 2019 16:27:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B74CCA8E7B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2019 16:27:06 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4AG6SFZ020371; Fri, 10 May 2019 18:18:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=eMm8eYoy1pzAeCbM3fc7GjsL6h7bwXX5xC7Jcbzbvck=;
 b=tGjRZ3L1YbWErbx3eUzcZlqp9ZTtl+5kbW8YYrTXk0KFkxR9EUNnyOUszDssQJgAKEgX
 mKAQtQX70PaZdIolDG6M8DXtHFCHcAQl4oPIIfmO+AuEyEzy7WB9ZjAwFMTfcQzH5zmo
 7+LjTWSI/RwdrvKMgEQpCKwuNRKNAoVKI01D4FTY/6LpLClphndhyMAmEiCgBrqzsIm5
 9EdiE7xkCCkU679/63I2FOOWbOfB61edrNxcVVc9LInWiNBbodrtflcR/Xw2MTJGoNH/
 KPLYpp7XfhYUjlqSEmztCvXNRouayxCQcwTL67rP+qlYL5yqb1dZTCRggMEFos92RLat Zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2scfv2squp-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 10 May 2019 18:18:46 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E411038;
 Fri, 10 May 2019 16:18:45 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 96CD52C3B;
 Fri, 10 May 2019 16:18:45 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 10 May
 2019 18:18:45 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1347.000; Fri, 10 May 2019 18:18:45 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 00/14] Add saveenv support for STM32MP1
Thread-Index: AQHVB0sJN7VR5trp4kyWEhX5WamkM6ZkZ/YA
Date: Fri, 10 May 2019 16:18:45 +0000
Message-ID: <c80bcc48-b822-359f-81bc-d597716551bb@st.com>
References: <1557504691-26188-1-git-send-email-patrice.chotard@st.com>
In-Reply-To: <1557504691-26188-1-git-send-email-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <2AFE76303EA3C44E8FDA254C0611A025@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
Cc: Baruch Siach <baruch@tkos.co.il>,
 Christophe KERELLO <christophe.kerello@st.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Chris Packham <judge.packham@gmail.com>,
 Vipul Kumar <vipul.kumar@xilinx.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Quentin Schulz <quentin.schulz@bootlin.com>, Jagan Teki <jagan@openedev.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Michal Simek <michal.simek@xilinx.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>, AKASHI
 Takahiro <takahiro.akashi@linaro.org>, Jean-Jacques Hiblot <jjhiblot@ti.com>,
 York Sun <york.sun@nxp.com>, Yaniv Levinsky <yaniv.levinsky@compulab.co.il>,
 Neil Stainton <nstainton@asl-control.co.uk>, Boris
 Brezillon <boris.brezillon@bootlin.com>,
 Igor Grinberg <grinberg@compulab.co.il>,
 Jagdish Gediya <jagdish.gediya@nxp.com>, Adam Ford <aford173@gmail.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>, Simon Glass <sjg@chromium.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Shyam Saini <mayhs11saini@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 00/14] Add saveenv support for STM32MP1
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

Sorry, i sent one useless patch, i will resend this series

Patrice

On 5/10/19 6:11 PM, Patrice Chotard wrote:
> 
> This series adds saveenv support for STM32MP1 on several boot
> devices. STM32MP1 is able to boot on eMMC, sdcard and NOR
> (NAND support is not fully supported).
> 
> On eMMC and sdcard, environment is saved in EXT4 partition
> On NOR, environment is saved in a dedicated partition
> On NAND, environment is saved in a UBI volume.
> 
> This series:
>   - enables NAND and NOR support on ev1 board
>   - enables ENV_IS_IN_SPI_FLASH, ENV_IS_IN_UBI, ENV_IS_IN_EXT4
>     flags
>   - fixes get_mtdparts()
>   - allows to override interface, device and partition for ext4
>     environment
>   - updates rule to set ENV_IS_NOWHERE value
>   - introduce ENV_IS_IN_DEVICE
> 
> 
> Patrice Chotard (10):
>   stm32mp1: support dynamic MTDPARTS
>   env: ext4: Allow overriding interface, device and partition
>   board: stm32mp1: Add env_ext4_get_dev_part() and env_ext4_get_intf()
>   env: allow ENV_IS_NOWHERE with other storage target
>   stm32mp1: Add env_get_location()
>   mtd: Fix get_mtdparts()
>   stm32mp1: Move ENV_SIZE to Kconfig
>   configs: stm32mp15: Enable ENV_IS_IN_UBI
>   configs: stm32mp15: Enable ENV_IS_SPI_FLASH
>   stm32mp1: Update env_get_location for NOR support
> 
> Patrick Delaunay (3):
>   stm32mp1: activate NAND and NOR support on EV1
>   env: enable saveenv command when one CONFIG_ENV_IS_IN is activated
>   configs: stm32mp15: Enable ENV_IS_IN_EXT4 and all relative flags
> 
> Tom Rini (1):
>   Prepare v2019.07-rc1
> 
>  Makefile                             |   4 +-
>  arch/arm/dts/stm32mp157-pinctrl.dtsi |  44 ++++++++++++
>  arch/arm/dts/stm32mp157c-ev1.dts     |  16 +++++
>  arch/arm/dts/stm32mp157c.dtsi        |  15 ++++
>  arch/arm/mach-stm32mp/Kconfig        |   3 +
>  board/st/stm32mp1/stm32mp1.c         | 136 +++++++++++++++++++++++++++++++++++
>  cmd/nvedit.c                         |  36 ++++++----
>  configs/stm32mp15_basic_defconfig    |  27 +++++++
>  configs/stm32mp15_trusted_defconfig  |  27 +++++++
>  drivers/mtd/mtd_uboot.c              |   5 +-
>  env/Kconfig                          |  20 ++----
>  env/ext4.c                           |  34 +++++----
>  include/configs/stm32mp1.h           |  24 +++++--
>  13 files changed, 340 insertions(+), 51 deletions(-)
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
