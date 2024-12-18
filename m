Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2459F63A5
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2024 11:45:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A5DFC78018;
	Wed, 18 Dec 2024 10:45:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07F63C5E2D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 10:45:22 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI60KUl011158;
 Wed, 18 Dec 2024 11:45:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 lFDSQWFS0IjSoJz2iiQketPtlHDGr/swBFnxhFOFpoo=; b=gqJarCIlTpb9TCCH
 bno9aimTthi/A1mUmrT9UtSKxt2zLSYPFuNx395I8TnOU2l83xFe0LFYpfrLCiTa
 /Nn3179A8O+HsYuTjKmp9nZCtyQ+9nmfBbpVcVQ9YCAu/RDJhOaJBpe4/WpYPgSa
 +o8y2J77OuCbbAp2aKwddVSWEPiVSkfhIrNEJdclh6VwipvnkW7Ah4X5IX8F0duz
 mb+x5aep2N3CliHiwDcEOljVH3L1CpyAVgpN5wCotrUQe5KS+I/TLJe3+wAhyymE
 M4Sc3qONOHTy/ceDZck2poWmUvnniIphUaY4VhDQeEydM94An2mFPMJdmhvLe4VO
 t2y37g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43krrcs54n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2024 11:45:10 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B977040071;
 Wed, 18 Dec 2024 11:43:44 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 10C812698F6;
 Wed, 18 Dec 2024 11:41:49 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 18 Dec
 2024 11:41:48 +0100
Message-ID: <ad83c80a-261a-45ed-bd1d-1f4871d9a543@foss.st.com>
Date: Wed, 18 Dec 2024 11:41:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20241215233011.569287-1-marex@denx.de>
 <20241215233011.569287-3-marex@denx.de>
 <e88ac210-9f46-41c1-b007-494740603d07@foss.st.com>
 <3b50d9e8-89d7-4b2b-8187-17c69d6aa494@foss.st.com>
Content-Language: en-US
In-Reply-To: <3b50d9e8-89d7-4b2b-8187-17c69d6aa494@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com,
 Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Igor Opaniuk <igor.opaniuk@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 3/4] ARM: dts: stm32: Drop
 access-controllers from SPL DT on DH STM32MP15xx DHSOM
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



On 12/18/24 11:32, Patrice CHOTARD wrote:
> 
> 
> On 12/16/24 09:54, Patrice CHOTARD wrote:
>>
>>
>> On 12/16/24 00:29, Marek Vasut wrote:
>>> The access-controllers DT property is not useful in STM32MP15xx SPL,
>>> remove it to reduce SPL control DT size. No functional change.
>>>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> ---
>>> NOTE: For 2025.01
>>> ---
>>> Cc: Igor Opaniuk <igor.opaniuk@gmail.com>
>>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>>> Cc: Simon Glass <sjg@chromium.org>
>>> Cc: Tom Rini <trini@konsulko.com>
>>> Cc: u-boot@dh-electronics.com
>>> Cc: u-boot@lists.denx.de
>>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>>> ---
>>>  configs/stm32mp15_dhcom_basic_defconfig | 2 +-
>>>  configs/stm32mp15_dhcor_basic_defconfig | 2 +-
>>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/configs/stm32mp15_dhcom_basic_defconfig b/configs/stm32mp15_dhcom_basic_defconfig
>>> index b730bf76dca..5add66fb2f4 100644
>>> --- a/configs/stm32mp15_dhcom_basic_defconfig
>>> +++ b/configs/stm32mp15_dhcom_basic_defconfig
>>> @@ -7,5 +7,5 @@ CONFIG_SYS_MEMTEST_START=0xc0000000
>>>  CONFIG_SYS_MEMTEST_END=0xc4000000
>>>  CONFIG_SYS_I2C_EEPROM_BUS=3
>>>  CONFIG_OF_LIST="st/stm32mp157c-dhcom-pdk2 st/stm32mp153c-dhcom-drc02 st/stm32mp157c-dhcom-picoitx"
>>> -CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-names interrupts-extended interrupt-controller \\\#interrupt-cells interrupt-parent dmas dma-names assigned-clocks assigned-clock-rates assigned-clock-parents hwlocks"
>>> +CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-names interrupts-extended interrupt-controller \\\#interrupt-cells interrupt-parent dmas dma-names assigned-clocks assigned-clock-rates assigned-clock-parents hwlocks access-controllers"
>>>  CONFIG_SYS_I2C_EEPROM_ADDR=0x50
>>> diff --git a/configs/stm32mp15_dhcor_basic_defconfig b/configs/stm32mp15_dhcor_basic_defconfig
>>> index 42a596505ca..dd14db3b4c5 100644
>>> --- a/configs/stm32mp15_dhcor_basic_defconfig
>>> +++ b/configs/stm32mp15_dhcor_basic_defconfig
>>> @@ -5,7 +5,7 @@ CONFIG_ARCH_STM32MP=y
>>>  CONFIG_DEFAULT_DEVICE_TREE="st/stm32mp157a-dhcor-avenger96"
>>>  CONFIG_SYS_I2C_EEPROM_BUS=2
>>>  CONFIG_OF_LIST="st/stm32mp157a-dhcor-avenger96 st/stm32mp151a-dhcor-testbench st/stm32mp153c-dhcor-drc-compact"
>>> -CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-names interrupts-extended interrupt-controller \\\#interrupt-cells interrupt-parent dmas dma-names assigned-clocks assigned-clock-rates assigned-clock-parents hwlocks"
>>> +CONFIG_OF_SPL_REMOVE_PROPS="interrupts interrupt-names interrupts-extended interrupt-controller \\\#interrupt-cells interrupt-parent dmas dma-names assigned-clocks assigned-clock-rates assigned-clock-parents hwlocks access-controllers"
>>>  CONFIG_SYS_I2C_EEPROM_ADDR=0x53
>>>  CONFIG_PHY_MICREL=y
>>>  CONFIG_PHY_MICREL_KSZ90X1=y
>>
>> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> Thanks
>> Patrice
> Applied to u-boot-stm32/next
> 
> Thanks
> Patrice

Sorry, applied to u-boot-stm32/master

Thanks
Patrice

> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
