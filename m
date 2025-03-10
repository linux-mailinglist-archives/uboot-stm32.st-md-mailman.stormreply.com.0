Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB12A590B0
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Mar 2025 11:04:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2B6AC78F96;
	Mon, 10 Mar 2025 10:04:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06526CFAC42
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 10:04:34 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A97XuM016929;
 Mon, 10 Mar 2025 11:04:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 F7NCjLz/VD3or6lUC//e/UgHXtuNLqvVu1FryuProzQ=; b=WFcIdpax7XoISDos
 1A5+lFCHfFNJ+FT3/3Hk5lqxAI7Qx70NNVDCrH/0f72WrFYpLhw5KyTJ+hO7+xtj
 eyDMcXgr9H1xWShThif6kVB1ZxEUKJ0EcMpHMVgUhST2N9gLbfpNJSTqhrwJh7kA
 9b0040psCtP/5biwey1v43YPm1LLLEPX2gIrxDSj2aQuMZk68vqWP0Alt3bZ3yka
 qS02WhulrXARRjyabEJl95OH0zrDcRspUCYVMxpMvbyxV5A+GXqrDC1mlugNQTbZ
 qV2jivQXgrpdYqWyMD+4zbbqMESFkL5yZeru1ho+SVEdz+jOSbL/4JrQpA1F2iGn
 aG6MeQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4590b8ur3y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Mar 2025 11:04:24 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CCADA4007E;
 Mon, 10 Mar 2025 11:03:17 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B9A9C5883C1;
 Mon, 10 Mar 2025 11:02:11 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 11:02:11 +0100
Message-ID: <2aef33cd-5bf0-4256-ae2c-413470e3668e@foss.st.com>
Date: Mon, 10 Mar 2025 11:02:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20250302154429.65581-1-marex@denx.de>
 <8631f15e-2bba-4f0a-b4d4-eb5c540f7716@foss.st.com>
Content-Language: en-US
In-Reply-To: <8631f15e-2bba-4f0a-b4d4-eb5c540f7716@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_04,2025-03-07_03,2024-11-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: Add support for
 STM32MP13xx DHCOR SoM and DHSBC rev.200 board
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



On 3/3/25 09:35, Patrice CHOTARD wrote:
> 
> 
> On 3/2/25 16:43, Marek Vasut wrote:
>> LDO2 is expansion connector supply on STM32MP13xx DHCOR DHSBC rev.200.
>> LDO5 is carrier board supply on STM32MP13xx DHCOR DHSBC rev.200. Keep
>> both regulators always enabled to make sure both the carrier board and
>> the expansion connector is always powered on and supplied with correct
>> voltage.
>>
>> Describe ST33TPHF2XSPI TPM 2.0 chip reset lines.
>>
>> This is a port of Linux kernel patch posted at:
>> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250302152605.54792-1-marex@denx.de/
>> This change shall be removed when the Linux kernel DT change lands
>> and Linux kernel DTs get synchronized with U-Boot DTs.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: Tom Rini <trini@konsulko.com>
>> Cc: u-boot@dh-electronics.com
>> Cc: u-boot@lists.denx.de
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>  .../dts/stm32mp135f-dhcor-dhsbc-u-boot.dtsi   | 22 +++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>
>> diff --git a/arch/arm/dts/stm32mp135f-dhcor-dhsbc-u-boot.dtsi b/arch/arm/dts/stm32mp135f-dhcor-dhsbc-u-boot.dtsi
>> index d718aae16ca..eace94f5fa4 100644
>> --- a/arch/arm/dts/stm32mp135f-dhcor-dhsbc-u-boot.dtsi
>> +++ b/arch/arm/dts/stm32mp135f-dhcor-dhsbc-u-boot.dtsi
>> @@ -23,3 +23,25 @@
>>  &usbphyc {
>>  	bootph-all;
>>  };
>> +
>> +&st33htph {
>> +	reset-gpios = <&gpioe 12 GPIO_ACTIVE_LOW>;
>> +};
>> +
>> +/* LDO2 is expansion connector 3V3 supply on STM32MP13xx DHCOR DHSBC rev.200 */
>> +&vdd_ldo2 {
>> +	bootph-all;
>> +	regulator-always-on;
>> +	regulator-boot-on;
>> +	regulator-min-microvolt = <3300000>;
>> +	regulator-max-microvolt = <3300000>;
>> +};
>> +
>> +/* LDO5 is carrier board 3V3 supply on STM32MP13xx DHCOR DHSBC rev.200 */
>> +&vdd_sd {
>> +	bootph-all;
>> +	regulator-always-on;
>> +	regulator-boot-on;
>> +	regulator-min-microvolt = <3300000>;
>> +	regulator-max-microvolt = <3300000>;
>> +};
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
Applied to u-boot-stm32/next

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
