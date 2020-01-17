Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FD41409E5
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Jan 2020 13:45:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E577C36B0E
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Jan 2020 12:45:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F456C36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jan 2020 12:45:13 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00HCbR2J012165; Fri, 17 Jan 2020 13:45:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=IFClIfrGIaV7n2KVgHWuGdzvKbbn2lp7kiS5cL6EhSI=;
 b=LJt84vC5iqMjxztNELACK6ExuBUe6dOw0t+wld68+miGSFTuPnTdTzVOwcHvMh7ivxJA
 wZQS4MqFS08Sd+wwby9gsuyPw9kJS2lWLJ7SWccvBYDQsvEYGXVjWQaeBo2bu0Uxlpdw
 GZ4jBiGgHABsgk+Z9pSJWGMM2R32Td4Aiyoh8XcCYpZxDiZ1OVRW8cx2A9403HxkD5x+
 2DmUU6O509/yXMoG1LrZFvpLG+SUmfPnoyt1f2xP2eOdJQ0zXjsdvp4sm1CWnu1hlvh7
 UNalHE3KBeXQBo21fkxaxcHZ47CL50O9gpFy7jPvvGmf86iM+Y40SDSTk0OokXx+iyh3 VA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xk0r7bkgg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2020 13:45:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9F5EF10002A;
 Fri, 17 Jan 2020 13:45:08 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9679D2B7739;
 Fri, 17 Jan 2020 13:45:08 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 17 Jan
 2020 13:45:08 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 17 Jan 2020 13:45:07 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 1/3] stm32mp1: move stboard command in
 board/st/common directory
Thread-Index: AQHVzTPyiEH6+ey/AkGkCbkCAij3TA==
Date: Fri, 17 Jan 2020 12:45:07 +0000
Message-ID: <ad66b011-dbb9-e42d-a3f4-43a7d9ff13f7@st.com>
References: <20200113141742.28182-1-patrick.delaunay@st.com>
 <20200113141742.28182-2-patrick.delaunay@st.com>
In-Reply-To: <20200113141742.28182-2-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <FCEF6C7513B5A641B25CAEE1FF354008@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_03:2020-01-16,
 2020-01-17 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] stm32mp1: move stboard command in
 board/st/common directory
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

Hi Patrick

On 1/13/20 3:17 PM, Patrick Delaunay wrote:
> Move the ST command in board/st/common, as this command is only used
> by ST board. Prepare the support in U-Boot of boards with STM32MP15x
> SOC but not STMicroelectronics.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  board/st/common/Kconfig                     | 6 ++++++
>  board/st/common/MAINTAINERS                 | 6 ++++++
>  board/st/common/Makefile                    | 6 ++++++
>  board/st/{stm32mp1 => common}/cmd_stboard.c | 3 +++
>  board/st/stm32mp1/Kconfig                   | 9 ++-------
>  board/st/stm32mp1/Makefile                  | 1 -
>  6 files changed, 23 insertions(+), 8 deletions(-)
>  create mode 100644 board/st/common/Kconfig
>  create mode 100644 board/st/common/MAINTAINERS
>  create mode 100644 board/st/common/Makefile
>  rename board/st/{stm32mp1 => common}/cmd_stboard.c (98%)
>
> diff --git a/board/st/common/Kconfig b/board/st/common/Kconfig
> new file mode 100644
> index 0000000000..1824087afc
> --- /dev/null
> +++ b/board/st/common/Kconfig
> @@ -0,0 +1,6 @@
> +config CMD_STBOARD
> +	bool "stboard - command for OTP board information"
> +	default y
> +	help
> +	  This compile the stboard command to
> +	  read and write the board in the OTP.
> diff --git a/board/st/common/MAINTAINERS b/board/st/common/MAINTAINERS
> new file mode 100644
> index 0000000000..3b02f4ab98
> --- /dev/null
> +++ b/board/st/common/MAINTAINERS
> @@ -0,0 +1,6 @@
> +ST BOARDS
> +M:	Patrick Delaunay <patrick.delaunay@st.com>
> +L:	uboot-stm32@st-md-mailman.stormreply.com (moderated for non-subscribers)
> +T:	git https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
> +S:	Maintained
> +F:	board/st/common/
> diff --git a/board/st/common/Makefile b/board/st/common/Makefile
> new file mode 100644
> index 0000000000..8553606b90
> --- /dev/null
> +++ b/board/st/common/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
> +#
> +# Copyright (C) 2020, STMicroelectronics - All Rights Reserved
> +#
> +
> +obj-$(CONFIG_CMD_STBOARD) += cmd_stboard.o
> diff --git a/board/st/stm32mp1/cmd_stboard.c b/board/st/common/cmd_stboard.c
> similarity index 98%
> rename from board/st/stm32mp1/cmd_stboard.c
> rename to board/st/common/cmd_stboard.c
> index 04352ae8ed..e994a88e71 100644
> --- a/board/st/stm32mp1/cmd_stboard.c
> +++ b/board/st/common/cmd_stboard.c
> @@ -3,6 +3,7 @@
>   * Copyright (C) 2019, STMicroelectronics - All Rights Reserved
>   */
>  
> +#ifndef CONFIG_SPL_BUILD
>  #include <common.h>
>  #include <console.h>
>  #include <misc.h>
> @@ -143,3 +144,5 @@ U_BOOT_CMD(stboard, 6, 0, do_stboard,
>  	   "  - Variant: 1 ... 15\n"
>  	   "  - Revision: A...O\n"
>  	   "  - BOM: 1...15\n");
> +
> +#endif
> diff --git a/board/st/stm32mp1/Kconfig b/board/st/stm32mp1/Kconfig
> index 4fa2360b4f..9f985e5775 100644
> --- a/board/st/stm32mp1/Kconfig
> +++ b/board/st/stm32mp1/Kconfig
> @@ -15,15 +15,10 @@ config ENV_SECT_SIZE
>  config ENV_OFFSET
>  	default 0x280000 if ENV_IS_IN_SPI_FLASH
>  
> -config CMD_STBOARD
> -	bool "stboard - command for OTP board information"
> -	default y
> -	help
> -	  This compile the stboard command to
> -	  read and write the board in the OTP.
> -
>  config TARGET_STM32MP157C_DK2
>  	bool "support of STMicroelectronics STM32MP157C-DK2 Discovery Board"
>  	default y
>  
> +source "board/st/common/Kconfig"
> +
>  endif
> diff --git a/board/st/stm32mp1/Makefile b/board/st/stm32mp1/Makefile
> index 3c6c035b11..8188075b1a 100644
> --- a/board/st/stm32mp1/Makefile
> +++ b/board/st/stm32mp1/Makefile
> @@ -7,7 +7,6 @@ ifdef CONFIG_SPL_BUILD
>  obj-y += spl.o
>  else
>  obj-y += stm32mp1.o
> -obj-$(CONFIG_CMD_STBOARD) += cmd_stboard.o
>  endif
>  
>  obj-y += board.o

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
