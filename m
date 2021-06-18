Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 767043AC597
	for <lists+uboot-stm32@lfdr.de>; Fri, 18 Jun 2021 10:00:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40563C58D7A;
	Fri, 18 Jun 2021 08:00:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8649C3FADC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Jun 2021 08:00:28 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15I7ubNX028851; Fri, 18 Jun 2021 10:00:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=tYhRikMEuyMZhdcflQczD2RSYHIy57Cnvb0ENnrhAEQ=;
 b=i4CKqaO4gT7NUbuq3bYwmNYICWRFsNVc2FWUF52VDoBnEAkGqfw7wsW5lxay70xeiD5q
 7eW2nGmZ6XtczeqEmG/ULCugAweilwkjnL7zjUjmxUh//XvBgdHWY6135Tnp5qvabYIA
 OX4OCNAnhCbenv8ALUUFdDV93I3e34ajdVFSBfmDURkD9S28YA9fITuSq/qSYzHqaYrW
 ORJQ8lI53VLrzmRNaYnJoBKmxf/cWtzOMvHmoy+bOC7QzhmwOh8yliZK33eUbMKE/h+G
 XvpxwTNF36ZflZ25iWH08wcMQoE7Ux2RpJWBrET22E4iLLXKELgU92YZM3GFEHMGoSta qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 398hn39shs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 10:00:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DD20D10002A;
 Fri, 18 Jun 2021 10:00:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D152F21A20E;
 Fri, 18 Jun 2021 10:00:26 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 18 Jun
 2021 10:00:26 +0200
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>, Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>
References: <cover.1622651232.git.gszymaszek@short.pl>
 <bc5e2aaf93fab7d50203752d99279725c3c94ef5.1622651232.git.gszymaszek@short.pl>
 <c6a9132d-e23e-5b16-78ce-008dab5a00cb@foss.st.com>
Message-ID: <ec6e2d25-01cb-c439-8cae-021116e10937@foss.st.com>
Date: Fri, 18 Jun 2021 10:00:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c6a9132d-e23e-5b16-78ce-008dab5a00cb@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_17:2021-06-15,
 2021-06-17 signatures=0
Subject: Re: [Uboot-stm32] [PATCH v2 4/5] arm: dts: stm32mp157c-odyssey-som:
 enable the SDMMC2 eMMC HS DDR mode
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



On 6/3/21 9:35 AM, Patrice CHOTARD wrote:
> Hi Grzegorz
> 
> On 6/2/21 7:09 PM, Grzegorz Szymaszek wrote:
>> Enable the SDMMC2 eMMC high-speed DDR mode as it is done in the
>> corresponding Linux kernel device tree.
>>
>> Signed-off-by: Grzegorz Szymaszek <gszymaszek@short.pl>
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>> Changes for v2:
>>    - rebased on current master
>>    - added a short commit message body
>>
>>  arch/arm/dts/stm32mp157c-odyssey-som.dtsi | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/dts/stm32mp157c-odyssey-som.dtsi b/arch/arm/dts/stm32mp157c-odyssey-som.dtsi
>> index 583812f137..1510a5b364 100644
>> --- a/arch/arm/dts/stm32mp157c-odyssey-som.dtsi
>> +++ b/arch/arm/dts/stm32mp157c-odyssey-som.dtsi
>> @@ -274,6 +274,7 @@
>>  	bus-width = <8>;
>>  	vmmc-supply = <&v3v3>;
>>  	vqmmc-supply = <&vdd>;
>> +	mmc-ddr-3_3v;
>>  	status = "okay";
>>  };
>>  
>>
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
> 
Applied on u-boot-stm32/next

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
