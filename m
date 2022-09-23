Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 687F45E7AB0
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 Sep 2022 14:26:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26F4EC0D2C2;
	Fri, 23 Sep 2022 12:26:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 691C6C0D2C1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Sep 2022 12:26:03 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28NA0cgO007386;
 Fri, 23 Sep 2022 14:26:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=zk+MGBt6VhfauRtwdBhP5nmv/7U12T7+IFTWgOIYWvg=;
 b=BMpi/XCU6aKxfYLO3PF+OK4mVl5TS7i/Eto/Zhgv3ETEEqvXUMMOXT82wBBaYjnPLOHE
 BMNBMHkAaZjjLuvkkTLDkVJWg527Fbx8hvuxgONq8cJTA9KsgzEA/KkK++5bU2PgS7BQ
 JlckDP2hMCyev1UhjHpEq0Lj5p31ax7jTZkgqqwHxLqyad7pEIl11HwG7mVJkqrNrwMd
 6IoO1S2+Kua092RYfG2s3cTxuohrjx9S7EAH5DStEe3OzoHmPk7PZwKsU51jRyNuv1RH
 Wgr4vno8iQAeNb4QEOooh5pB+JpZ5dJiAoOgRUMt4TpyWHyKE4ZLRkEUcI7H9RJK0LWi Gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jrkmx958n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Sep 2022 14:26:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C497D10002A;
 Fri, 23 Sep 2022 14:26:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BE533228A58;
 Fri, 23 Sep 2022 14:26:01 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.51) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Fri, 23 Sep
 2022 14:26:01 +0200
Message-ID: <26e8fed7-03d6-7cf5-b993-f867cdc45363@foss.st.com>
Date: Fri, 23 Sep 2022 14:26:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220909172212.1.I257345934e82f832c20e7c5792f7c0186949e93b@changeid>
 <a1abf03c-d0a6-4161-09e2-c2c53359cc31@foss.st.com>
In-Reply-To: <a1abf03c-d0a6-4161-09e2-c2c53359cc31@foss.st.com>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-23_04,2022-09-22_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp: stm32prog: improve the
 partitioning trace
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

HI Patrick

On 9/12/22 08:43, Patrice CHOTARD wrote:
> Hi Patrick
> 
> On 9/9/22 17:22, Patrick Delaunay wrote:
>> Improve the partitioning trace done in command stm32prog:
>> - remove the trace "partition: Done" when the GPT partitioning is not done
>> - indicate the mmc instance used for each 'gpt write' command
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
>> index c391b6c7abb..7ee4590ef26 100644
>> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
>> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
>> @@ -1090,7 +1090,6 @@ static int create_gpt_partitions(struct stm32prog_data *data)
>>  	if (!buf)
>>  		return -ENOMEM;
>>  
>> -	puts("partitions : ");
>>  	/* initialize the selected device */
>>  	for (i = 0; i < data->dev_nb; i++) {
>>  		/* create gpt partition support only for full update on MMC */
>> @@ -1098,6 +1097,7 @@ static int create_gpt_partitions(struct stm32prog_data *data)
>>  		    !data->dev[i].full_update)
>>  			continue;
>>  
>> +		printf("partitions on mmc%d: ", data->dev[i].dev_id);
>>  		offset = 0;
>>  		rootfs_found = false;
>>  		memset(buf, 0, buflen);
>> @@ -1197,8 +1197,8 @@ static int create_gpt_partitions(struct stm32prog_data *data)
>>  		sprintf(buf, "part list mmc %d", data->dev[i].dev_id);
>>  		run_command(buf, 0);
>>  #endif
>> +		puts("done\n");
>>  	}
>> -	puts("done\n");
>>  
>>  #ifdef DEBUG
>>  	run_command("mtd list", 0);
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Applied on u-boot-stm32/next

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
