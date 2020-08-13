Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A52B243524
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 09:45:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D163C36B24
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 07:45:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2802C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Aug 2020 07:45:28 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07D2Mrwl022529; Thu, 13 Aug 2020 09:45:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=DnORvLRPWC68Ds1uB22XVijoDdrSA9CtjSPhuS4Cwh8=;
 b=EkqxFyZpc4gS1UCXZmZ/jAqOLwCzoV+WaHS3+kvsVPpphBAoM+dWfSLGjfoS9WEyG46O
 6XN+f83uXqPxFZs1XraLxtJ5jDP4HyEaW0M7exW8MuuuJH9EZvKZVG4ZYbfpJ86+iZfl
 tNJcrMTn1fkvw3NbaIcoI7bbg9iIsP7gfn1ZOr7J+G+mz8DcMfSLHLDpUvSoufLkwzg1
 NX4+u+D9H46Usz7n55vHhi+HeqyUJB08assElQZ2fFMlt+ijdT5H4TpIXnzfTw0RIqNO
 CVPwfIXh02fdH1FoX4t/MtU9Eo0qEbQoFnUgWzwGb9uKAdwkZbIaBg7aRSSK3h72VuwF cA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32uj5330y7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 09:45:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 323C610002A;
 Thu, 13 Aug 2020 09:45:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 27F8821FEB0;
 Thu, 13 Aug 2020 09:45:27 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Aug
 2020 09:45:26 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 13 Aug 2020 09:45:26 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH] board: stm32mp1: remove board.c
Thread-Index: AQHWZmijyhIs9bVofU+8WNGgNVREjqk1nREA
Date: Thu, 13 Aug 2020 07:45:26 +0000
Message-ID: <7552830a-3c16-79df-0a3d-73b6e4b127e4@st.com>
References: <20200730115735.2063-1-patrick.delaunay@st.com>
In-Reply-To: <20200730115735.2063-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <D3EE523633960046A01F836D3D33CA90@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_02:2020-08-11,
 2020-08-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] board: stm32mp1: remove board.c
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

On 7/30/20 1:57 PM, Patrick Delaunay wrote:
> Remove the file board/st/stm32mp1/board.c which is not more
> compiled since commit 156732cc8939 ("board: stm32mp1: move the
> function board_debug_uart_init in spl.c")
>
> Fixes: 156732cc8939 ("board: stm32mp1: move the function board_debug_uart_init in spl.c")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> Issue when initial patch [1] was applied:
>
> diff --git a/board/st/stm32mp1/board.c b/board/st/stm32mp1/board.c
> deleted file mode 100644
>
> [1] http://patchwork.ozlabs.org/project/uboot/patch/20200525101949.15944-10-patrick.delaunay@st.com/
>
>
>  board/st/stm32mp1/board.c | 36 ------------------------------------
>  1 file changed, 36 deletions(-)
>  delete mode 100644 board/st/stm32mp1/board.c
>
> diff --git a/board/st/stm32mp1/board.c b/board/st/stm32mp1/board.c
> deleted file mode 100644
> index 00c61c2886..0000000000
> --- a/board/st/stm32mp1/board.c
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
> -/*
> - * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
> - */
> -
> -#include <common.h>
> -#include <asm/io.h>
> -#include <linux/bitops.h>
> -#include <linux/delay.h>
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

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
