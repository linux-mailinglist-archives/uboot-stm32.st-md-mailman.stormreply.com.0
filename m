Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABDA243804
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 11:53:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1455DC36B24
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 09:53:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1365BC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Aug 2020 09:53:54 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07D8H3Di022532; Thu, 13 Aug 2020 11:53:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=8k5tvAjiM5mZS9gBQmmPOSccu8NJ85DX4j9IkDFcoZQ=;
 b=ye8lgy9hSIYdxHuZoH+R+lMVZc+OonhG3vk/dFVUeNZ0bP18W6zgWgz+vess7KB7WLdn
 05PMg0EHekiEimuzBMUXv7TLJu/5Vq9UcGmoOijYMkuqfxzq15UgTyhpgHjqs2rGUpH6
 fA3TlHEO7GsDkhW1nZ1VwA3ofttXeKzrkYyrYeYDL8gNuHaj9WhbMF4TadG+qFhShuOM
 df9/oHoI+FVlssEPT8yULPY8IBOrI0g/vPRHw1a2/NK9maYexPXVZHLv8oxSiLiyYkae
 IL38Hfo4KxUG4wSjdv/a0YsYOkYlvAg7HFW4MRVRQ/e3aNqcRFK1DR/zXJHxkmPH3rw/ SA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32uj533k8n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 11:53:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 07E1310002A;
 Thu, 13 Aug 2020 11:53:53 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F366F2AB700;
 Thu, 13 Aug 2020 11:53:52 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Aug
 2020 11:53:52 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 13 Aug 2020 11:53:52 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 09/11] board: stm32mp1: use IS_ENABLED to
 prevent ifdef in ft_board_setup
Thread-Index: AQHWcULNbPiLfk5xFEetlc6144sYv6k1qz8A
Date: Thu, 13 Aug 2020 09:53:52 +0000
Message-ID: <17b4c355-1b56-4ecc-8217-7d38c655a425@st.com>
References: <20200731143152.8812-1-patrick.delaunay@st.com>
 <20200731143152.8812-9-patrick.delaunay@st.com>
 <9012ee45-824e-3cb3-b4a0-cde347e7185e@st.com>
In-Reply-To: <9012ee45-824e-3cb3-b4a0-cde347e7185e@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <6F319E8E528EA04894F1FF62942B3E89@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_02:2020-08-11,
 2020-08-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 09/11] board: stm32mp1: use IS_ENABLED to
 prevent ifdef in ft_board_setup
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


On 8/13/20 9:24 AM, Patrice CHOTARD wrote:
> Hi Patrick
>
> On 7/31/20 4:31 PM, Patrick Delaunay wrote:
>> Use IS_ENABLED to prevent ifdef in ft_board_setup.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>> ---
>>
>>  board/st/stm32mp1/stm32mp1.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)


Applied on u-boot-stm/master

Thanks

>> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
>> index 08d18b6da8..4d26738a24 100644
>> --- a/board/st/stm32mp1/stm32mp1.c
>> +++ b/board/st/stm32mp1/stm32mp1.c
>> @@ -842,14 +842,14 @@ int mmc_get_env_dev(void)
>>  #if defined(CONFIG_OF_BOARD_SETUP)
>>  int ft_board_setup(void *blob, struct bd_info *bd)
>>  {
>> -#ifdef CONFIG_FDT_FIXUP_PARTITIONS
>>  	struct node_info nodes[] = {
>>  		{ "st,stm32f469-qspi",		MTD_DEV_TYPE_NOR,  },
>>  		{ "st,stm32f469-qspi",		MTD_DEV_TYPE_SPINAND},
>>  		{ "st,stm32mp15-fmc2",		MTD_DEV_TYPE_NAND, },
>>  	};
>> -	fdt_fixup_mtdparts(blob, nodes, ARRAY_SIZE(nodes));
>> -#endif
>> +
>> +	if (IS_ENABLED(CONFIG_FDT_FIXUP_PARTITIONS))
>> +		fdt_fixup_mtdparts(blob, nodes, ARRAY_SIZE(nodes));
>>  
>>  	return 0;
>>  }
> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
>
> Thanks
>
> Patrice
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
