Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D35C6E748C
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Apr 2023 10:01:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0AE03C6B460;
	Wed, 19 Apr 2023 08:01:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73F62C6B456
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Apr 2023 08:01:02 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33J3RQ2W001546; Wed, 19 Apr 2023 10:01:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=4kwoH6bTPmXsP9fLTjfbJRixMrI+3ORWuk0ON44jZWM=;
 b=mjch26T6zn4uZIlXeFurWUBz6c5yTME9vzPFWEYmmpR3ngwJOWoES/eI+5L2QDzz1Bao
 nDX5gXNBety0GZtpLqPtbr8H/L2N/iug7tQSWURx6vf/XCZPKeEOwlh0t19RFwVRrr+a
 +Z6+Y0823cm0T4i/7e7O88YHIqN7flQ9Jfwhf69JN+pnQAkxxi3rm9aVupYymIoO+wt8
 ZZ+Vf4n8W4G17kWEq2bu2DznMFF+YnuG2FaIdIuRiez0wUB2Z20SEFWPkVnHhuI2153q
 JxhoRVSegIeeqGVmQ/qfoncXaMlYaxNbWPgcfmsO16iAQFFN3b8uqzh6+cR8YP+C+pWp HQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3q1rq2eqss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Apr 2023 10:01:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2385B100038;
 Wed, 19 Apr 2023 10:00:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 191E4211F3B;
 Wed, 19 Apr 2023 10:00:59 +0200 (CEST)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 19 Apr
 2023 10:00:58 +0200
Message-ID: <81cce913-f3a5-9f6d-fa5b-72c571ed649a@foss.st.com>
Date: Wed, 19 Apr 2023 10:00:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>, <u-boot@lists.denx.de>
References: <20230330092618.351308-1-christophe.kerello@foss.st.com>
 <aeb10e8a-4738-ebc5-863c-a9f5c6846145@foss.st.com>
In-Reply-To: <aeb10e8a-4738-ebc5-863c-a9f5c6846145@foss.st.com>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_04,2023-04-18_01,2023-02-09_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: add FMC support on
	STM32MP13x SoC family
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



On 4/11/23 08:53, Patrice CHOTARD wrote:
> Hi Christophe
> 
> On 3/30/23 11:26, Christophe Kerello wrote:
>> Add FMC support on STM32MP13x SoC family.
>>
>> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
>> ---
>>
>>  arch/arm/dts/stm32mp131.dtsi | 33 +++++++++++++++++++++++++++++++++
>>  1 file changed, 33 insertions(+)
>>
>> diff --git a/arch/arm/dts/stm32mp131.dtsi b/arch/arm/dts/stm32mp131.dtsi
>> index 3cf51f09bcb..cf1171bc9bb 100644
>> --- a/arch/arm/dts/stm32mp131.dtsi
>> +++ b/arch/arm/dts/stm32mp131.dtsi
>> @@ -191,6 +191,39 @@
>>  			dma-requests = <48>;
>>  		};
>>  
>> +		fmc: memory-controller@58002000 {
>> +			compatible = "st,stm32mp1-fmc2-ebi";
>> +			reg = <0x58002000 0x1000>;
>> +			ranges = <0 0 0x60000000 0x04000000>, /* EBI CS 1 */
>> +				 <1 0 0x64000000 0x04000000>, /* EBI CS 2 */
>> +				 <2 0 0x68000000 0x04000000>, /* EBI CS 3 */
>> +				 <3 0 0x6c000000 0x04000000>, /* EBI CS 4 */
>> +				 <4 0 0x80000000 0x10000000>; /* NAND */
>> +			#address-cells = <2>;
>> +			#size-cells = <1>;
>> +			clocks = <&rcc FMC_K>;
>> +			resets = <&rcc FMC_R>;
>> +			status = "disabled";
>> +
>> +			nand-controller@4,0 {
>> +				compatible = "st,stm32mp1-fmc2-nfc";
>> +				reg = <4 0x00000000 0x1000>,
>> +				      <4 0x08010000 0x1000>,
>> +				      <4 0x08020000 0x1000>,
>> +				      <4 0x01000000 0x1000>,
>> +				      <4 0x09010000 0x1000>,
>> +				      <4 0x09020000 0x1000>;
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
>> +				dmas = <&mdma 24 0x2 0x12000a02 0x0 0x0>,
>> +				       <&mdma 24 0x2 0x12000a08 0x0 0x0>,
>> +				       <&mdma 25 0x2 0x12000a0a 0x0 0x0>;
>> +				dma-names = "tx", "rx", "ecc";
>> +				status = "disabled";
>> +			};
>> +		};
>> +
>>  		sdmmc1: mmc@58005000 {
>>  			compatible = "st,stm32-sdmmc2", "arm,pl18x", "arm,primecell";
>>  			arm,primecell-periphid = <0x20253180>;
> 
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice


Applied on u-boot-stm/master, thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
