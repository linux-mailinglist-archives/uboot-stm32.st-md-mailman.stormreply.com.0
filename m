Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C63A23A4F
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jan 2025 08:50:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E5B0C78002;
	Fri, 31 Jan 2025 07:50:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3670C71292
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2025 07:49:57 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50V7kDHO012967;
 Fri, 31 Jan 2025 08:49:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 ckBSP0sGujBJEtn7F+ix03KpeXNKzbQQpbAf9rCmVhw=; b=GZd3DViW7G2kBHfK
 m3aYEnJw2SP64HdQc93kTa3VyXhEB9iFXwEW7paVmT0fiUZgtedSQCGmPHWfSK1C
 2iiCoaqy/jCrZ3+KmtTlALSWjMMUWkAX1xRhwDTFYjDvTY360NZY9SvdaTOohHDE
 rcgOfViP8NqHRZMtu7MuSVe6txQ8h4WzMnDSwnt7QiaHcjXtOnHdrjf+HgLnfTmH
 mIGAAXZaQRFo7xJtWgpNhlv7W2dPeR0ETofrLRCV0b+2j3JWSnBq/za/NZSkVd2a
 jTj4avOeGTihbU6Fqx3pydwivVTm15cro8WDHOeGcb+kZfa/6v8kfWRCMXB+ixrf
 RFZFDw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44gf7dsrmt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jan 2025 08:49:44 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7866140050;
 Fri, 31 Jan 2025 08:48:50 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E052427692F;
 Fri, 31 Jan 2025 08:46:22 +0100 (CET)
Received: from [10.252.27.7] (10.252.27.7) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 31 Jan
 2025 08:46:22 +0100
Message-ID: <0375be8a-7a88-4a37-b1f0-2fbe20270311@foss.st.com>
Date: Fri, 31 Jan 2025 08:46:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20241127172239.1.I7b5a4d95ba28bd08aa07ab3e8112988a5ec7e8e5@changeid>
 <9976c295-05b4-48a7-8c90-887909bcbec9@foss.st.com>
Content-Language: en-US
In-Reply-To: <9976c295-05b4-48a7-8c90-887909bcbec9@foss.st.com>
X-Originating-IP: [10.252.27.7]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_03,2025-01-30_01,2024-11-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32: remove dt-binding headers that are
 available upstream
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



On 12/16/24 11:08, Patrice CHOTARD wrote:
> 
> 
> On 11/27/24 17:23, Patrick Delaunay wrote:
>> Some dt-binding headers mask the upstream ones which can lead to build
>> failures, or worse: super weird bugs, if they get out of sync.
>>
>> Remove these headers so our devicetree and binding headers will both be
>> in sync with upstream.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>  drivers/clk/stm32/clk-stm32h7.c               |   3 +
>>  include/dt-bindings/clock/stm32fx-clock.h     |  63 ----
>>  include/dt-bindings/clock/stm32h7-clks.h      | 167 -----------
>>  include/dt-bindings/clock/stm32mp1-clks.h     | 274 ------------------
>>  include/dt-bindings/clock/stm32mp13-clks.h    | 229 ---------------
>>  include/dt-bindings/mfd/stm32f4-rcc.h         | 108 -------
>>  include/dt-bindings/mfd/stm32f7-rcc.h         | 115 --------
>>  include/dt-bindings/mfd/stm32h7-rcc.h         | 138 ---------
>>  include/dt-bindings/pinctrl/stm32-pinfunc.h   |  45 ---
>>  .../regulator/st,stm32mp13-regulator.h        |  42 ---
>>  include/dt-bindings/reset/stm32mp1-resets.h   | 123 --------
>>  include/dt-bindings/reset/stm32mp13-resets.h  | 100 -------
>>  12 files changed, 3 insertions(+), 1404 deletions(-)
>>  delete mode 100644 include/dt-bindings/clock/stm32fx-clock.h
>>  delete mode 100644 include/dt-bindings/clock/stm32h7-clks.h
>>  delete mode 100644 include/dt-bindings/clock/stm32mp1-clks.h
>>  delete mode 100644 include/dt-bindings/clock/stm32mp13-clks.h
>>  delete mode 100644 include/dt-bindings/mfd/stm32f4-rcc.h
>>  delete mode 100644 include/dt-bindings/mfd/stm32f7-rcc.h
>>  delete mode 100644 include/dt-bindings/mfd/stm32h7-rcc.h
>>  delete mode 100644 include/dt-bindings/pinctrl/stm32-pinfunc.h
>>  delete mode 100644 include/dt-bindings/regulator/st,stm32mp13-regulator.h
>>  delete mode 100644 include/dt-bindings/reset/stm32mp1-resets.h
>>  delete mode 100644 include/dt-bindings/reset/stm32mp13-resets.h
>>
>> diff --git a/drivers/clk/stm32/clk-stm32h7.c b/drivers/clk/stm32/clk-stm32h7.c
>> index a554eda504de..6acf2ff0a8fb 100644
>> --- a/drivers/clk/stm32/clk-stm32h7.c
>> +++ b/drivers/clk/stm32/clk-stm32h7.c
>> @@ -18,6 +18,9 @@
>>  
>>  #include <dt-bindings/clock/stm32h7-clks.h>
>>  
>> +/* must be equal to last peripheral clock index */
>> +#define LAST_PERIF_BANK SYSCFG_CK
>> +
>>  /* RCC CR specific definitions */
>>  #define RCC_CR_HSION			BIT(0)
>>  #define RCC_CR_HSIRDY			BIT(2)
>> diff --git a/include/dt-bindings/clock/stm32fx-clock.h b/include/dt-bindings/clock/stm32fx-clock.h
>> deleted file mode 100644
>> index e5dad050d518..000000000000
>> --- a/include/dt-bindings/clock/stm32fx-clock.h
>> +++ /dev/null
>> @@ -1,63 +0,0 @@
>> -/* SPDX-License-Identifier: GPL-2.0-only */
>> -/*
>> - * stm32fx-clock.h
>> - *
>> - * Copyright (C) 2016 STMicroelectronics
>> - * Author: Gabriel Fernandez for STMicroelectronics.
>> - */
>> -
>> -/*
>> - * List of clocks which are not derived from system clock (SYSCLOCK)
>> - *
>> - * The index of these clocks is the secondary index of DT bindings

[...]

>> -#define GPIOA_R		14080
>> -#define GPIOB_R		14081
>> -#define GPIOC_R		14082
>> -#define GPIOD_R		14083
>> -#define GPIOE_R		14084
>> -#define GPIOF_R		14085
>> -#define GPIOG_R		14086
>> -#define GPIOH_R		14087
>> -#define GPIOI_R		14088
>> -#define TSC_R		14095
>> -#define PKA_R		14146
>> -#define SAES_R		14147
>> -#define CRYP1_R		14148
>> -#define HASH1_R		14149
>> -#define RNG1_R		14150
>> -#define AXIMC_R		14160
>> -#define MDMA_R		14208
>> -#define MCE_R		14209
>> -#define ETH1MAC_R	14218
>> -#define FMC_R		14220
>> -#define QSPI_R		14222
>> -#define SDMMC1_R	14224
>> -#define SDMMC2_R	14225
>> -#define CRC1_R		14228
>> -#define USBH_R		14232
>> -#define ETH2MAC_R	14238
>> -
>> -/* SCMI reset domain identifiers */
>> -#define RST_SCMI_LTDC		0
>> -#define RST_SCMI_MDMA		1
>> -
>> -#endif /* _DT_BINDINGS_STM32MP13_RESET_H_ */
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Applied to u-boot-stm32/master

Thanks
Patrice

> 
> Thanks
> PAtrice
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
