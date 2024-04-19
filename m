Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AA88AAE05
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 14:05:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4FBBC6DD72;
	Fri, 19 Apr 2024 12:05:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8715C69066
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 12:05:11 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43J9cZ0h032238; Fri, 19 Apr 2024 14:04:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:from:to:cc:references
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=yTXVGUXygzFQ6IRPSh2TtI37BE7ZulbXXscs2At43zY=; b=v9
 svG9oepCeSlxfNTkQzI7Ku3on21rQPR3R47AlNSi7uTGsyRE16SoC+Gg9V7ladSO
 XRK5NoBS0Pwi2y6Og6IWUVkWSdV3AyQmK1JJPiLqyIErrRbJ6Pyl614bofhqPYVw
 YYuWBfMr24bzWFoIX8niwwl6hl6EzCiJ9EWvLPBoBXwfdB++nkKcj9J0TQi7aHhH
 /vyCpdsQq4fFfIaVu+8cKN2U9/ZBF9FOtbpoVe8kcR/fh/FP+hS/GMd258N4WqHv
 I+fBtq+cXqkLFFo9XjCRv4JcJS8KKlTnuj6c2uKVta7b4KOkrTRGu/t/rFT3Z016
 /Wj6ucxc8jNWIv5IcAjA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xgecyr9vm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 14:04:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5BA4540045;
 Fri, 19 Apr 2024 14:04:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 93774218612;
 Fri, 19 Apr 2024 14:04:22 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 14:04:21 +0200
Message-ID: <668ef356-c5ed-46c7-9caa-ed27d5ca9252@foss.st.com>
Date: Fri, 19 Apr 2024 14:04:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240419035931.178840-1-marex@denx.de>
 <7d23a960-a864-4fbe-966d-e0bb304394ac@foss.st.com>
In-Reply-To: <7d23a960-a864-4fbe-966d-e0bb304394ac@foss.st.com>
X-Originating-IP: [10.252.13.94]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_08,2024-04-19_01,2023-05-22_02
Cc: Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com,
 Igor Opaniuk <igor.opaniuk@foundries.io>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH v3] ARM: stm32: Initialize TAMP_SMCR
 BKP..PROT fields on STM32MP15xx
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



On 4/19/24 11:36, Patrice CHOTARD wrote:
> 
> 
> On 4/19/24 05:59, Marek Vasut wrote:
>> In case of an OTP-CLOSED STM32MP15xx system, the CPU core 1 cannot be
>> released from endless loop in BootROM only by populating TAMP BKPxR 4
>> and 5 with magic and branch address and sending SGI0 interrupt from
>> core 0 to core 1 twice. TAMP_SMCR BKP..PROT fields must be initialized
>> as well to release the core 1 from endless loop during the second SGI0
>> handling on core 1. Initialize TAMP_SMCR to protect the first 32 backup
>> registers, the ones which contain the core 1 magic, branch address and
>> boot information.
>>
>> This requirement seems to be undocumented, therefore it was necessary
>> to trace and analyze the STM32MP15xx BootROM using OpenOCD and objdump.
>> Ultimately, it turns out that a certain BootROM function reads out the
>> TAMP_SMCR register and tests whether the BKP..PROT fields are non-zero.
>> If they are zero, the BootROM code again waits for SGI0 using WFI, else
>> the execution moves forward until it reaches handoff to the TAMP BKPxR 5
>> branch address.
>>
>> This fixes CPU core 1 release using U-Boot PSCI implementation on an
>> OTP-CLOSED system, i.e. system with fuse 0 bit 6 set.
>>
>> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Igor Opaniuk <igor.opaniuk@foundries.io>
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: Simon Glass <sjg@chromium.org
>> Cc: Simon Glass <sjg@chromium.org>
>> Cc: Tom Rini <trini@konsulko.com>
>> Cc: u-boot@dh-electronics.com
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>> V2: Fix up the BKPRWD/BKPWD mask typo
>> V3: - Update the allocation to 0x20/0x20
>>     - Update commit message
>>     - Add RB from Patrick
>> ---
>>  arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c b/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
>> index dd99150fbc2..d75ec99d6a1 100644
>> --- a/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
>> +++ b/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
>> @@ -14,6 +14,7 @@
>>  #include <asm/arch/sys_proto.h>
>>  #include <dm/device.h>
>>  #include <dm/uclass.h>
>> +#include <linux/bitfield.h>
>>  
>>  /* RCC register */
>>  #define RCC_TZCR		(STM32_RCC_BASE + 0x00)
>> @@ -41,6 +42,9 @@
>>  #define TZC_REGION_ID_ACCESS0	(STM32_TZC_BASE + 0x114)
>>  
>>  #define TAMP_CR1		(STM32_TAMP_BASE + 0x00)
>> +#define TAMP_SMCR		(STM32_TAMP_BASE + 0x20)
>> +#define TAMP_SMCR_BKPRWDPROT	GENMASK(7, 0)
>> +#define TAMP_SMCR_BKPWDPROT	GENMASK(23, 16)
>>  
>>  #define PWR_CR1			(STM32_PWR_BASE + 0x00)
>>  #define PWR_MCUCR		(STM32_PWR_BASE + 0x14)
>> @@ -136,6 +140,18 @@ static void security_init(void)
>>  	 */
>>  	writel(0x0, TAMP_CR1);
>>  
>> +	/*
>> +	 * TAMP: Configure non-zero secure protection settings. This is
>> +	 * checked by BootROM function 35ac on OTP-CLOSED device during
>> +	 * CPU core 1 release from endless loop. If secure protection
>> +	 * fields are zero, the core 1 is not released from endless
>> +	 * loop on second SGI0.
>> +	 */
>> +	clrsetbits_le32(TAMP_SMCR,
>> +			TAMP_SMCR_BKPRWDPROT | TAMP_SMCR_BKPWDPROT,
>> +			FIELD_PREP(TAMP_SMCR_BKPRWDPROT, 0x20) |
>> +			FIELD_PREP(TAMP_SMCR_BKPWDPROT, 0x20));
>> +
>>  	/* GPIOZ: deactivate the security */
>>  	writel(BIT(0), RCC_MP_AHB5ENSETR);
>>  	writel(0x0, GPIOZ_SECCFGR);
> Hi Marek
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Applied on u-boot-stm32/master 

> 
> Thanks
> Patrice
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
