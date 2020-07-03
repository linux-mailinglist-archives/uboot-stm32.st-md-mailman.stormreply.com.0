Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 778462134AB
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Jul 2020 09:09:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F57CC36B24
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Jul 2020 07:09:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F26BBC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jul 2020 07:09:24 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06379MEm027890; Fri, 3 Jul 2020 09:09:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ygFxsS2uPJ62Y/9VAcdIn7XGyrxdVRSOS7+T3yhusxQ=;
 b=PTMNi+v2kizbQKk0hpq22IZqj+cWZPpR5ETAlXtps6vrrKSU79gmFELOZeZE4RwoOYS7
 G6xn+mAXz32JXPDkCrlZvmxH6r3TAh45jmUevpCf6MLrR57KiJyCeHL7jDNfFh2SpSke
 3zdQMSotvMkmbjVc687ZG17XRwOOweAgrx+NAc0IWDSKipNoGxx9mee/HpjsAqeRHMAK
 zzd36utSFbTvAb5kK/cO/r9wZQRqOZUQ3d7AjqKwi+zKIixgqmbweJZyEHWyeIg0Ccak
 0SEQW5RFedE/SCifMhUOpLfDwT73SUWMdcdHQbh9flLfHGU5cOpXYPI3jJjeX3flxGQs ZQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wu8a5g83-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jul 2020 09:09:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C6DD810002A;
 Fri,  3 Jul 2020 09:09:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BD2F22AD2AB;
 Fri,  3 Jul 2020 09:09:16 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 3 Jul
 2020 09:09:15 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 3 Jul 2020 09:09:14 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH v2 9/9] board: stm32mp1: move the function
 board_debug_uart_init in spl.c
Thread-Index: AQHWUQjcrnA1bdKBxUiJ0QzByHOX1g==
Date: Fri, 3 Jul 2020 07:09:14 +0000
Message-ID: <a2ede6a6-8284-e5cf-c64c-316c1ac107a0@st.com>
References: <20200525101949.15944-1-patrick.delaunay@st.com>
 <20200525101949.15944-10-patrick.delaunay@st.com>
In-Reply-To: <20200525101949.15944-10-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <583E61473EB53E4791682E321D5095D4@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-03_02:2020-07-02,
 2020-07-03 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2 9/9] board: stm32mp1: move the function
 board_debug_uart_init in spl.c
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

On 5/25/20 12:19 PM, Patrick Delaunay wrote:
> Move the debug function board_debug_uart_init in spl.c
> as the debug_uart_init() function is called in arch_cpu_init()
> only for SPL and remove the board.c file.
>
> For TFABOOT, the UART TX pin configuration is done in TF-A.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> Changes in v2:
> - NEW: merge spl.c and board.c to avoid a file with only one function
>
>  board/st/stm32mp1/Makefile |  2 --
>  board/st/stm32mp1/board.c  | 34 ----------------------------------
>  board/st/stm32mp1/spl.c    | 26 ++++++++++++++++++++++++++
>  3 files changed, 26 insertions(+), 36 deletions(-)
>  delete mode 100644 board/st/stm32mp1/board.c
>
> diff --git a/board/st/stm32mp1/Makefile b/board/st/stm32mp1/Makefile
> index 8188075b1a..65560df290 100644
> --- a/board/st/stm32mp1/Makefile
> +++ b/board/st/stm32mp1/Makefile
> @@ -8,5 +8,3 @@ obj-y += spl.o
>  else
>  obj-y += stm32mp1.o
>  endif
> -
> -obj-y += board.o
> diff --git a/board/st/stm32mp1/board.c b/board/st/stm32mp1/board.c
> deleted file mode 100644
> index 1887941e57..0000000000
> --- a/board/st/stm32mp1/board.c
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
> -/*
> - * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
> - */
> -
> -#include <common.h>
> -#include <asm/io.h>
> -
> -#ifdef CONFIG_DEBUG_UART_BOARD_INIT
> -void board_debug_uart_init(void)
> -{
> -#if (CONFIG_DEBUG_UART_BASE == STM32_UART4_BASE)
> -
> -#define RCC_MP_APB1ENSETR (STM32_RCC_BASE + 0x0A00)
> -#define RCC_MP_AHB4ENSETR (STM32_RCC_BASE + 0x0A28)
> -
> -	/* UART4 clock enable */
> -	setbits_le32(RCC_MP_APB1ENSETR, BIT(16));
> -
> -#define GPIOG_BASE 0x50008000
> -	/* GPIOG clock enable */
> -	writel(BIT(6), RCC_MP_AHB4ENSETR);
> -	/* GPIO configuration for EVAL board
> -	 * => Uart4 TX = G11
> -	 */
> -	writel(0xffbfffff, GPIOG_BASE + 0x00);
> -	writel(0x00006000, GPIOG_BASE + 0x24);
> -#else
> -
> -#error("CONFIG_DEBUG_UART_BASE: not supported value")
> -
> -#endif
> -}
> -#endif
> diff --git a/board/st/stm32mp1/spl.c b/board/st/stm32mp1/spl.c
> index 96ab671169..977703f58a 100644
> --- a/board/st/stm32mp1/spl.c
> +++ b/board/st/stm32mp1/spl.c
> @@ -5,6 +5,7 @@
>  
>  #include <config.h>
>  #include <common.h>
> +#include <asm/io.h>
>  #include "../common/stpmic1.h"
>  
>  /* board early initialisation in board_f: need to use global variable */
> @@ -23,3 +24,28 @@ int board_early_init_f(void)
>  
>  	return 0;
>  }
> +
> +#ifdef CONFIG_DEBUG_UART_BOARD_INIT
> +void board_debug_uart_init(void)
> +{
> +#if (CONFIG_DEBUG_UART_BASE == STM32_UART4_BASE)
> +
> +#define RCC_MP_APB1ENSETR (STM32_RCC_BASE + 0x0A00)
> +#define RCC_MP_AHB4ENSETR (STM32_RCC_BASE + 0x0A28)
> +
> +	/* UART4 clock enable */
> +	setbits_le32(RCC_MP_APB1ENSETR, BIT(16));
> +
> +#define GPIOG_BASE 0x50008000
> +	/* GPIOG clock enable */
> +	writel(BIT(6), RCC_MP_AHB4ENSETR);
> +	/* GPIO configuration for ST boards: Uart4 TX = G11 */
> +	writel(0xffbfffff, GPIOG_BASE + 0x00);
> +	writel(0x00006000, GPIOG_BASE + 0x24);
> +#else
> +
> +#error("CONFIG_DEBUG_UART_BASE: not supported value")
> +
> +#endif
> +}
> +#endif

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
