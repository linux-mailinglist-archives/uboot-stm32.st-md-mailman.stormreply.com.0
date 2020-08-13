Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 000F124380D
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 11:56:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDDA2C36B24
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 09:56:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5AF0C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Aug 2020 09:56:09 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07D8KvrC022523; Thu, 13 Aug 2020 11:56:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=/+DfayVUWSuM1LgHlzAgp6EH76Yw+EcXGsIeUFpGrKI=;
 b=cYiSLSN8pGXzSeKyw5BIYeNaZz9bocQks59onYD+yz0+Eu7DYEQr0hxSWe9W9O3+wI6s
 U3pQm18S15rQzjn1aPTHCvZyFQDlIM4BeMrNJhZI9X+vMJZ0BeDj6ku75si0lHYLQd/N
 unNjmKLNqlYn3I8gZwOBDOgOrYAdXAp2wd3xd/jzjAPzNqU34RDtODv5USxAGS0d/q5F
 dZw1y2xDKapdZYu/sNPcTwYYJ06iV3BfWvOGDVdWdvshAEdMizu15T0O7P86goFLLb/V
 la5YtLuE2PwdV0TyDog30tP0tdk/cyTjDr1YeDBzeQvB7SahmIQfNyfw11+5HIB18lUq SA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32uj533khg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 11:56:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7A9F510002A;
 Thu, 13 Aug 2020 11:56:08 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 71F3B2AB70B;
 Thu, 13 Aug 2020 11:56:08 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Aug
 2020 11:56:08 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 13 Aug 2020 11:56:07 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH] board: stm32mp1: use const for struct
 node_info
Thread-Index: AQHWcUXoLiAnkLTXJ0WjpdIpLhf9Bak1q9qA
Date: Thu, 13 Aug 2020 09:56:07 +0000
Message-ID: <15534fad-fbf5-24e8-9850-96cf86c29e83@st.com>
References: <20200729112452.15812-1-patrick.delaunay@st.com>
 <646f04d2-a695-d73c-fb7c-912900dcf988@st.com>
In-Reply-To: <646f04d2-a695-d73c-fb7c-912900dcf988@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <8813656A2535F64E8B0C76BEB07F090B@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_02:2020-08-11,
 2020-08-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] board: stm32mp1: use const for struct
 node_info
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


On 8/13/20 9:46 AM, Patrice CHOTARD wrote:
> Hi Patrick
>
> On 7/29/20 1:24 PM, Patrick Delaunay wrote:
>> Use const for the variable nodes in ft_board_setup,
>> this patch follow fdt_fixup_mtdparts prototype and no more use stack.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>> ---
>>
>>  board/st/stm32mp1/stm32mp1.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied on u-boot-stm/master

Thanks

>>
>> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
>> index 1d274c3157..68c4a221da 100644
>> --- a/board/st/stm32mp1/stm32mp1.c
>> +++ b/board/st/stm32mp1/stm32mp1.c
>> @@ -847,7 +847,7 @@ int mmc_get_env_dev(void)
>>  int ft_board_setup(void *blob, struct bd_info *bd)
>>  {
>>  #ifdef CONFIG_FDT_FIXUP_PARTITIONS
>> -	struct node_info nodes[] = {
>> +	static const struct node_info nodes[] = {
>>  		{ "st,stm32f469-qspi",		MTD_DEV_TYPE_NOR,  },
>>  		{ "st,stm32f469-qspi",		MTD_DEV_TYPE_SPINAND},
>>  		{ "st,stm32mp15-fmc2",		MTD_DEV_TYPE_NAND, },
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
