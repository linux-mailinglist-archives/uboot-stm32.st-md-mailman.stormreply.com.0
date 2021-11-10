Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B76C144C4C2
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Nov 2021 17:01:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80D21C5EC71;
	Wed, 10 Nov 2021 16:01:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05B91C5EC70
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Nov 2021 16:01:36 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AAFDEEn002986;
 Wed, 10 Nov 2021 17:01:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=37mNuihWEZaHUqh6hvR4Fg0iYWBsfHKmbuXcUqEhJQc=;
 b=c0io8hysiXqFbVydNR6NIQOj1FJRpIWPVRItrvy0aDQ2ZUdc61cM8TfM2xc9OuHNLd46
 6YCu5HTnLuXucjdV1fpezNrLIOOtHdfkjn0aZC/6vILGbq2X6y+QhO51Gr1vzGUPhTI6
 BZf++oCJfUpcFosmG+lAI/cPDoO+LHZSXd3EBJXQkfsi3NICWDWtPXA2LW+Hai7wyDOQ
 MoccIwk+zfIDsQ42/hY3eZ9kutRfM0ceVu1yGh/PV9uGx/5HSEq4rt/apicUIysnMLLx
 qhasCbkNZXJekkuZIVdtbgzWPntrgdOM0RoCuYJ+3Zv5RBOVdiRNdDn7eK5aYfOo4Yuo oQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c87vsmkdt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Nov 2021 17:01:34 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C833A10002A;
 Wed, 10 Nov 2021 17:01:33 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B98CA20A77B;
 Wed, 10 Nov 2021 17:01:33 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 10 Nov
 2021 17:01:33 +0100
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20211021115403.1.I74f77fe0ac99dd20cbf08dee326bc81e814b86c6@changeid>
 <ffc9c68a-7aed-7d90-eb81-0ed58788bed6@foss.st.com>
Message-ID: <f8ce339e-7685-b926-188b-dbd875293773@foss.st.com>
Date: Wed, 10 Nov 2021 17:01:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ffc9c68a-7aed-7d90-eb81-0ed58788bed6@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-10_06,2021-11-08_02,2020-04-07_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] arm: dts: stm32mp15: alignment with
 v5.15-rc6
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

On 10/26/21 9:05 AM, Patrice CHOTARD wrote:
> Hi Patrick
> 
> On 10/21/21 11:54 AM, Patrick Delaunay wrote:
>> Device tree alignment with Linux kernel v5.15-rc6
>> - Set {bitclock,frame}-master phandles on ST DKx
>> - Add coprocessor detach mbox on stm32mp15x-dkx boards
>> - Add coprocessor detach mbox on stm32mp157c-ed1 board
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>  arch/arm/dts/stm32mp157c-ed1.dts  |  4 ++--
>>  arch/arm/dts/stm32mp15xx-dkx.dtsi | 12 ++++++------
>>  2 files changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm/dts/stm32mp157c-ed1.dts b/arch/arm/dts/stm32mp157c-ed1.dts
>> index 6e89f88a17..f62b46b8dd 100644
>> --- a/arch/arm/dts/stm32mp157c-ed1.dts
>> +++ b/arch/arm/dts/stm32mp157c-ed1.dts
>> @@ -321,8 +321,8 @@
>>  &m4_rproc {
>>  	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
>>  			<&vdev0vring1>, <&vdev0buffer>;
>> -	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
>> -	mbox-names = "vq0", "vq1", "shutdown";
>> +	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
>> +	mbox-names = "vq0", "vq1", "shutdown", "detach";
>>  	interrupt-parent = <&exti>;
>>  	interrupts = <68 1>;
>>  	status = "okay";
>> diff --git a/arch/arm/dts/stm32mp15xx-dkx.dtsi b/arch/arm/dts/stm32mp15xx-dkx.dtsi
>> index 68987f64c5..8fc93b0f94 100644
>> --- a/arch/arm/dts/stm32mp15xx-dkx.dtsi
>> +++ b/arch/arm/dts/stm32mp15xx-dkx.dtsi
>> @@ -228,15 +228,15 @@
>>  			cs42l51_tx_endpoint: endpoint@0 {
>>  				reg = <0>;
>>  				remote-endpoint = <&sai2a_endpoint>;
>> -				frame-master;
>> -				bitclock-master;
>> +				frame-master = <&cs42l51_tx_endpoint>;
>> +				bitclock-master = <&cs42l51_tx_endpoint>;
>>  			};
>>  
>>  			cs42l51_rx_endpoint: endpoint@1 {
>>  				reg = <1>;
>>  				remote-endpoint = <&sai2b_endpoint>;
>> -				frame-master;
>> -				bitclock-master;
>> +				frame-master = <&cs42l51_rx_endpoint>;
>> +				bitclock-master = <&cs42l51_rx_endpoint>;
>>  			};
>>  		};
>>  	};
>> @@ -478,8 +478,8 @@
>>  &m4_rproc {
>>  	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
>>  			<&vdev0vring1>, <&vdev0buffer>;
>> -	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
>> -	mbox-names = "vq0", "vq1", "shutdown";
>> +	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
>> +	mbox-names = "vq0", "vq1", "shutdown", "detach";
>>  	interrupt-parent = <&exti>;
>>  	interrupts = <68 1>;
>>  	status = "okay";
>>
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Thanks
> Patrice
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
> 
Applied on u-boot-stm/master 
Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
