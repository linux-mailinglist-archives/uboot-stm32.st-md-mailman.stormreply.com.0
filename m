Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCA45E7ADD
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 Sep 2022 14:35:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D571EC03FD6;
	Fri, 23 Sep 2022 12:35:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05901C57B6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Sep 2022 12:35:21 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28NA9IGT018867;
 Fri, 23 Sep 2022 14:35:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=1GmzuXMuE4mvHZldbJ7yhvEwnYBzjJGWRtqnoQjPZ/Y=;
 b=YdX6aEwUz1M4T7ohpNIGJbRFZ+z5xhWSTYqom0nVG9LFG/wHroVF5aNZ8ie92fLzip+U
 J4xukPYpGzSxzhKoROerMIZbwp6ATRjaZae3i5YjQNGEBExsgHcT0dPbrR/xnjzNM7P1
 gs449jlQF04vZWVSsO58b3EPQTP7KdUIG7BeTZdpMtbHENwzrVeB/0zjPUVBVf0MjHd0
 aEc9a+jvh2slYijtp3nMMk6rFXgQXI3LoTg1+/956/IfLv3lnmC3JOaAVGEQ+L2IGtHN
 xvRnmr4WKWTYb4LW8CHRabbWiNSUhcpfwzBT1YNpyOUX9m4l4Cq56SVoPxrtkxYQSUx+ KA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jr11xfn0s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Sep 2022 14:35:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7CF5C10002A;
 Fri, 23 Sep 2022 14:35:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 78FDB2291D5;
 Fri, 23 Sep 2022 14:35:20 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.51) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Fri, 23 Sep
 2022 14:35:20 +0200
Message-ID: <66bafd40-4aa1-a925-2bd1-56e044e54148@foss.st.com>
Date: Fri, 23 Sep 2022 14:35:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220921093711.1.I1dd8baddc1f804ccab03ffa99bb5b33c924ab07a@changeid>
 <170f149d-0a32-1c1f-bbfd-f8562444dd1c@foss.st.com>
In-Reply-To: <170f149d-0a32-1c1f-bbfd-f8562444dd1c@foss.st.com>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-23_04,2022-09-22_02,2022-06-22_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32mp15: update DDR node
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

On 9/23/22 13:40, Patrice CHOTARD wrote:
> Hi Patrick
> 
> On 9/21/22 09:37, Patrick Delaunay wrote:
>> Remove the unnecessary nodes for TFABOOT and keep the mandatory part
>> in SOC dtsi, only the DDRCTRL and DDRPHY addresses.
>> This patch allows to manage the DDR configuration setting in U-Boot
>> device tree only if it is needed, when CONFIG_SPL is defined.
>>
>> With TFABOOT, the DDR configuration is done in TF-A BL2 and the DDR size
>> is dynamically computed in U-Boot since commit d72e7bbe7c28 ("ram:
>> stm32mp1: compute DDR size from DDRCTL registers").
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>  arch/arm/dts/stm32mp15-ddr.dtsi               | 16 ++++++++++++++++
>>  arch/arm/dts/stm32mp15-u-boot.dtsi            | 14 --------------
>>  arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi |  1 -
>>  arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi |  1 -
>>  4 files changed, 16 insertions(+), 16 deletions(-)
>>
>> diff --git a/arch/arm/dts/stm32mp15-ddr.dtsi b/arch/arm/dts/stm32mp15-ddr.dtsi
>> index 0aac9131a60..d02f79dac66 100644
>> --- a/arch/arm/dts/stm32mp15-ddr.dtsi
>> +++ b/arch/arm/dts/stm32mp15-ddr.dtsi
>> @@ -4,7 +4,22 @@
>>   */
>>  #include <linux/stringify.h>
>>  
>> +#ifdef CONFIG_SPL
>>  &ddr {
>> +	clocks = <&rcc AXIDCG>,
>> +		 <&rcc DDRC1>,
>> +		 <&rcc DDRC2>,
>> +		 <&rcc DDRPHYC>,
>> +		 <&rcc DDRCAPB>,
>> +		 <&rcc DDRPHYCAPB>;
>> +
>> +	clock-names = "axidcg",
>> +		      "ddrc1",
>> +		      "ddrc2",
>> +		      "ddrphyc",
>> +		      "ddrcapb",
>> +		      "ddrphycapb";
>> +
>>  	config-DDR_MEM_COMPATIBLE {
>>  		u-boot,dm-pre-reloc;
>>  
>> @@ -119,6 +134,7 @@
>>  		status = "okay";
>>  	};
>>  };
>> +#endif
>>  
>>  #undef DDR_MEM_COMPATIBLE
>>  #undef DDR_MEM_NAME
>> diff --git a/arch/arm/dts/stm32mp15-u-boot.dtsi b/arch/arm/dts/stm32mp15-u-boot.dtsi
>> index d9d04743ac8..d5c87d29d88 100644
>> --- a/arch/arm/dts/stm32mp15-u-boot.dtsi
>> +++ b/arch/arm/dts/stm32mp15-u-boot.dtsi
>> @@ -53,20 +53,6 @@
>>  			reg = <0x5a003000 0x550
>>  			       0x5a004000 0x234>;
>>  
>> -			clocks = <&rcc AXIDCG>,
>> -				 <&rcc DDRC1>,
>> -				 <&rcc DDRC2>,
>> -				 <&rcc DDRPHYC>,
>> -				 <&rcc DDRCAPB>,
>> -				 <&rcc DDRPHYCAPB>;
>> -
>> -			clock-names = "axidcg",
>> -				      "ddrc1",
>> -				      "ddrc2",
>> -				      "ddrphyc",
>> -				      "ddrcapb",
>> -				      "ddrphycapb";
>> -
>>  			status = "okay";
>>  		};
>>  	};
>> diff --git a/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi
>> index 2db045e7cec..1209dfe009c 100644
>> --- a/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi
>> +++ b/arch/arm/dts/stm32mp157a-dk1-scmi-u-boot.dtsi
>> @@ -5,7 +5,6 @@
>>  
>>  #include <dt-bindings/clock/stm32mp1-clksrc.h>
>>  #include "stm32mp15-scmi-u-boot.dtsi"
>> -#include "stm32mp15-ddr3-1x4Gb-1066-binG.dtsi"
>>  
>>  / {
>>  	aliases {
>> diff --git a/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi
>> index 54662f7e290..c265745ff10 100644
>> --- a/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi
>> +++ b/arch/arm/dts/stm32mp157c-ed1-scmi-u-boot.dtsi
>> @@ -5,7 +5,6 @@
>>  
>>  #include <dt-bindings/clock/stm32mp1-clksrc.h>
>>  #include "stm32mp15-scmi-u-boot.dtsi"
>> -#include "stm32mp15-ddr3-2x4Gb-1066-binG.dtsi"
>>  
>>  / {
>>  	aliases {
> 
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
Applied on u-boot-stm32/next

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
