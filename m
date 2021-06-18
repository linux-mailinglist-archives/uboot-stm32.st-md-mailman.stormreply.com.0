Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 218D63AC57C
	for <lists+uboot-stm32@lfdr.de>; Fri, 18 Jun 2021 09:57:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC5FBC597B0;
	Fri, 18 Jun 2021 07:57:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B427CC597AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Jun 2021 07:57:19 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15I7ubM8028851; Fri, 18 Jun 2021 09:57:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=qFhe2KTnFiyP41iiJHCzPGrGGd1syDtu3q81gUQwIdw=;
 b=mrkDLAHiL2gzTdk8rZhWH8PPqeKSDB47wsaVgYcZkFwEPnS9FDsuWbTNKPLWNHGBYuH4
 18IxeUTCLeb01/iIHZrUGlqyVJ2gL+TMy6QVpMfF3yzH0VjL7qhwm5KeUbGUFNc6JstZ
 OzdrI0/TQtHXHKXPyaEglUPfH/I3nBRas92R6BMx/ETueeW0RS3GsaEeC2hTMRMzeHk2
 WRfviDSbLbOA+1LRcnEovWV1PuanHQuMgEGO2ndl1Hi+TOTqBnX0/rZ8fuJQs5pAb/zi
 MVj+hr18dd2g/gr57yVSgDLB6csFqg2x2hXvHbad/8U7BQNUE4IsFs99gUfadaG9eNWg Og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 398hn39rv2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 09:57:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A0CFC100034;
 Fri, 18 Jun 2021 09:57:08 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8DAE321A206;
 Fri, 18 Jun 2021 09:57:08 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 18 Jun
 2021 09:57:08 +0200
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210518131213.20343-1-patrick.delaunay@foss.st.com>
 <20210518151206.6.Id5ec1c084e307f296256a9764772f23492ee4766@changeid>
 <f3155f93-f2ba-de1f-da12-5cdb8926ff0c@foss.st.com>
Message-ID: <415c20e8-22b4-1fac-2c2c-32fa399704b8@foss.st.com>
Date: Fri, 18 Jun 2021 09:57:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f3155f93-f2ba-de1f-da12-5cdb8926ff0c@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_17:2021-06-15,
 2021-06-17 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 06/10] stm32mp: stm32prog: correctly
 handle DM_PMIC
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



On 5/28/21 2:54 PM, Patrice CHOTARD wrote:
> Hi Patrick
> 
> On 5/18/21 3:12 PM, Patrick Delaunay wrote:
>> Correctly handle number of alternate when DM_PMIC is not activated.
>> This patch remove the last UNKNOWN partition in this case.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
>> index ea69d5dd16..ab687c272d 100644
>> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
>> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
>> @@ -1150,7 +1150,10 @@ static int dfu_init_entities(struct stm32prog_data *data)
>>  	struct dfu_entity *dfu;
>>  	int alt_nb;
>>  
>> -	alt_nb = 3; /* number of virtual = CMD, OTP, PMIC*/
>> +	alt_nb = 2; /* number of virtual = CMD, OTP*/
>> +	if (CONFIG_IS_ENABLED(DM_PMIC))
>> +		alt_nb++; /* PMIC NVMEM*/
>> +
>>  	if (data->part_nb == 0)
>>  		alt_nb++;  /* +1 for FlashLayout */
>>  	else
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
Applied on u-boot-stm32/next

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
