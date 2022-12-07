Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE0C645E50
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Dec 2022 17:02:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 893F6C6411C;
	Wed,  7 Dec 2022 16:02:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 487DBC01E99
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Dec 2022 16:02:36 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B7DPUdH031188; Wed, 7 Dec 2022 17:02:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=x2eYX3/x6IaDqJtfvXi8NoATpNspd4MALAmbKpQa2pg=;
 b=T3KwRhUKQvkhRb9PoH8bsE2Io17lScyoBxLWDXn5Te2aaQyazsXSczMHLRpcBBn5Wqra
 OhNAw9GvggjhB+AetIfEtw78m93Tpc1ZDby7EGZM2wNymjq+as2L/noMZCCOaHmFDH7+
 1Y+kXOwZlUxX8suuuL8tc1EmIi1TflnReT0YaJ6t3PCLri4CYNJZbtzgoELwbDs6Oqiu
 6fDROYHXGAqA5a7ErbUyzY7a4A+1SH0lZ8SUywGT5WsHAnxWYnUfhWtHyolUFs5yO0Cb
 FkQ+pOCoG8rjoOUofoNzbwFTeVfKuyL9loBeK32G3n3Nwr3c/cT2So1+QgFb6clCnzSQ 5w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3m7xp78vtj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 17:02:30 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6C13D100034;
 Wed,  7 Dec 2022 17:02:25 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6267223D3F3;
 Wed,  7 Dec 2022 17:02:25 +0100 (CET)
Received: from [10.201.20.130] (10.201.20.130) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 7 Dec
 2022 17:02:24 +0100
Message-ID: <46590108-15a0-a158-f352-875ae38bbce0@foss.st.com>
Date: Wed, 7 Dec 2022 17:02:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Yann Gautier <yann.gautier@foss.st.com>, <u-boot@lists.denx.de>
References: <20221102135349.102615-1-yann.gautier@foss.st.com>
 <cf75807b-51c0-83f4-1122-97df2ff57281@foss.st.com>
In-Reply-To: <cf75807b-51c0-83f4-1122-97df2ff57281@foss.st.com>
X-Originating-IP: [10.201.20.130]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_08,2022-12-07_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] ARM: dts: stm32: add sdmmc cd-gpios
 for STM32MP135F-DK
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



On 11/3/22 08:45, Patrice CHOTARD wrote:
> 
> 
> On 11/2/22 14:53, Yann Gautier wrote:
>> On STM32MP135F-DK, the SD card detect GPIO is GPIOH4.
>> Backport of the Linux patch:
>> https://lore.kernel.org/linux-arm-kernel/20220921160334.3227138-1-yann.gautier@foss.st.com/
>>
>> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
>> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
>> ---
>>
>>  arch/arm/dts/stm32mp135f-dk.dts | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/dts/stm32mp135f-dk.dts b/arch/arm/dts/stm32mp135f-dk.dts
>> index e6b8ffd332..52f86596ce 100644
>> --- a/arch/arm/dts/stm32mp135f-dk.dts
>> +++ b/arch/arm/dts/stm32mp135f-dk.dts
>> @@ -82,7 +82,7 @@
>>  	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_clk_pins_a>;
>>  	pinctrl-1 = <&sdmmc1_b4_od_pins_a &sdmmc1_clk_pins_a>;
>>  	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
>> -	broken-cd;
>> +	cd-gpios = <&gpioh 4 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
>>  	disable-wp;
>>  	st,neg-edge;
>>  	bus-width = <4>;
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
Applied to u-boot-stm/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
