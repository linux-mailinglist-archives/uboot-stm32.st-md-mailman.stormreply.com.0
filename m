Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A5A2435BF
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 10:08:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 233F6C36B24
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 08:08:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F003C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Aug 2020 08:08:42 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07D2NIaq022636; Thu, 13 Aug 2020 10:08:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=OW6hoYq9b5278RyFnlOV3f3DNoLcQ3pjpZEAHMTJ3R4=;
 b=U8vuZ1C7eCJz5nxozHn2Pli5cuyUG/AAY+4p3aYV8iW9UA86FvNId21RRAm0mxfyN0u9
 BtACRjO63pWkpTcYUPaXltFjQkw5a5YKdalZJNCFJNl66q3bnd94djK6k4sHSic7h0UZ
 7ypgqYxonpxywi7ghudnISTm/TVukns09VmtPuWOvdOFJW1NiZ5IryvZ+BGWt8ZRtUQ0
 +sXtfDf5ucxv5QrRSFsyg2WzE6UZ/dIcmuKDUQmbMjdjPTXyxyFTtl61fuYeH1C2VjeF
 GxNWiESC2JBSOzrYghXKzjDw53NNAnngHwilUF5SgRdb78YEmHBbs2J3ez8scLF3BQtc bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32uj5334c9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 10:08:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5E09C100034;
 Thu, 13 Aug 2020 10:08:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3E2432A4D61;
 Thu, 13 Aug 2020 10:08:40 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Aug
 2020 10:08:39 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 13 Aug 2020 10:08:39 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH] board: stm32mp1: remove board.c
Thread-Index: AQHWZmijyhIs9bVofU+8WNGgNVREjqk1nREAgAAGfAA=
Date: Thu, 13 Aug 2020 08:08:39 +0000
Message-ID: <e8a14df1-ca46-9b38-9346-93ffdb47381d@st.com>
References: <20200730115735.2063-1-patrick.delaunay@st.com>
 <7552830a-3c16-79df-0a3d-73b6e4b127e4@st.com>
In-Reply-To: <7552830a-3c16-79df-0a3d-73b6e4b127e4@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <6D03BD14C2286647AEA32E8E03B578C9@st.com>
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

This patch doesn't apply correctly and the sha1 was not the correct one. Nevertheless i update it and applied it on u-boot-stm/master

Thanks

patrice

On 8/13/20 9:45 AM, Patrice CHOTARD wrote:
> Hi Patrick
>
> On 7/30/20 1:57 PM, Patrick Delaunay wrote:
>> Remove the file board/st/stm32mp1/board.c which is not more
>> compiled since commit 156732cc8939 ("board: stm32mp1: move the
>> function board_debug_uart_init in spl.c")
>>
>> Fixes: 156732cc8939 ("board: stm32mp1: move the function board_debug_uart_init in spl.c")
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>> ---
>> Issue when initial patch [1] was applied:
>>
>> diff --git a/board/st/stm32mp1/board.c b/board/st/stm32mp1/board.c
>> deleted file mode 100644
>>
>> [1] http://patchwork.ozlabs.org/project/uboot/patch/20200525101949.15944-10-patrick.delaunay@st.com/
>>
>>
>>  board/st/stm32mp1/board.c | 36 ------------------------------------
>>  1 file changed, 36 deletions(-)
>>  delete mode 100644 board/st/stm32mp1/board.c
>>
>> diff --git a/board/st/stm32mp1/board.c b/board/st/stm32mp1/board.c
>> deleted file mode 100644
>> index 00c61c2886..0000000000
>> --- a/board/st/stm32mp1/board.c
>> +++ /dev/null
>> @@ -1,36 +0,0 @@
>> -// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
>> -/*
>> - * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
>> - */
>> -
>> -#include <common.h>
>> -#include <asm/io.h>
>> -#include <linux/bitops.h>
>> -#include <linux/delay.h>
>> -
>> -#ifdef CONFIG_DEBUG_UART_BOARD_INIT
>> -void board_debug_uart_init(void)
>> -{
>> -#if (CONFIG_DEBUG_UART_BASE == STM32_UART4_BASE)
>> -
>> -#define RCC_MP_APB1ENSETR (STM32_RCC_BASE + 0x0A00)
>> -#define RCC_MP_AHB4ENSETR (STM32_RCC_BASE + 0x0A28)
>> -
>> -	/* UART4 clock enable */
>> -	setbits_le32(RCC_MP_APB1ENSETR, BIT(16));
>> -
>> -#define GPIOG_BASE 0x50008000
>> -	/* GPIOG clock enable */
>> -	writel(BIT(6), RCC_MP_AHB4ENSETR);
>> -	/* GPIO configuration for EVAL board
>> -	 * => Uart4 TX = G11
>> -	 */
>> -	writel(0xffbfffff, GPIOG_BASE + 0x00);
>> -	writel(0x00006000, GPIOG_BASE + 0x24);
>> -#else
>> -
>> -#error("CONFIG_DEBUG_UART_BASE: not supported value")
>> -
>> -#endif
>> -}
>> -#endif
> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
>
> Thanks
>
> Patrice
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
