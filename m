Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4293ED311
	for <lists+uboot-stm32@lfdr.de>; Mon, 16 Aug 2021 13:29:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00825C57B60;
	Mon, 16 Aug 2021 11:29:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B012C5719E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Aug 2021 11:29:45 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17GBDsZY001652; Mon, 16 Aug 2021 13:29:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Sdu5NvQoIB9m+zb2483EpPJMEf8CepRwdQBwDe2HhT8=;
 b=MFRJ8jvs9cJH8IKPrWJorG2psqC5Mk5VKbsg/FJ+rKjVy3wDKRfLG+d+dol/91rONY6K
 hnFMLZe+WxZ0SUYeczs2WJJVl3HQehPMCAGuaHagdP2D4+Sdtt18wSGbLVU363IUIeRN
 h0vdmKAT++OSYVy6AsWaMdM4LHXhXtma8c6tmDc/UPaTBVhuftqVhY13q/Vgc8aOzSda
 tEJeruU3I6mo7fkmrrmAktuxwthTYA5UEdxDHtyOyMSHStqCBlLQlTxaDyYrXIeS3o7D
 tdhdGWSJIWY6XPM4ZrLLqB0VkEZjViRe5M68yr+gBZWQNzDm7QtWJ113LN7xm/ThW899 9Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3afhp5hxxy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Aug 2021 13:29:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 904C110002A;
 Mon, 16 Aug 2021 13:29:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 858BD2309C5;
 Mon, 16 Aug 2021 13:29:35 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 16 Aug
 2021 13:29:35 +0200
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210726115518.1.I199b974cdcfac6b770c164eef50f53ea8ad02bc5@changeid>
 <70dc2611-5591-f2ba-043b-00b49e65e8e3@foss.st.com>
Message-ID: <386591ba-0374-c3ab-c410-112eec3cfddc@foss.st.com>
Date: Mon, 16 Aug 2021 13:29:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <70dc2611-5591-f2ba-043b-00b49e65e8e3@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-16_04:2021-08-16,
 2021-08-16 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Alexander Graf <agraf@csgraf.de>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp: correctly handle
 board_get_usable_ram_top(0)
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

On 8/16/21 9:26 AM, Patrice CHOTARD wrote:
> Hi Patrick
> 
> On 7/26/21 11:55 AM, Patrick Delaunay wrote:
>> The function board_get_usable_ram_top can to called after relocation
>> with total_size = 0 to get the uppermost pointer that is valid to access
>> in U-Boot.
>>
>> When total_size = 0, the reserved memory should be not take in account
>> with lmb library and 'gd->ram_base + gd->ram_size' can be used.
>>
>> It is the case today in lib/efi_loader/efi_memory.c:efi_add_known_memory()
>> and this patch avoids that the reserved memory for OP-TEE is not part of
>> the EFI available memory regions.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>> Patch to correct the UEFI support for STM32MP platform
>> after Heinrich's remark on patch [1].
>>
>> [1] efi_loader: replace board_get_usable_ram_top by gd->ram_top
>> http://patchwork.ozlabs.org/project/uboot/patch/20210709124630.1.I212e7cd96724368b8272300c59c2a1c1f227ed67@changeid/
>>
>>  arch/arm/mach-stm32mp/dram_init.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/arm/mach-stm32mp/dram_init.c b/arch/arm/mach-stm32mp/dram_init.c
>> index 3c097029bd..94f25f34e0 100644
>> --- a/arch/arm/mach-stm32mp/dram_init.c
>> +++ b/arch/arm/mach-stm32mp/dram_init.c
>> @@ -46,6 +46,9 @@ ulong board_get_usable_ram_top(ulong total_size)
>>  	phys_addr_t reg;
>>  	struct lmb lmb;
>>  
>> +	if (!total_size)
>> +		return gd->ram_base + gd->ram_size;
>> +
>>  	/* found enough not-reserved memory to relocated U-Boot */
>>  	lmb_init(&lmb);
>>  	lmb_add(&lmb, gd->ram_base, gd->ram_size);
>>
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
> 
Applied to u-boot-stm/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
