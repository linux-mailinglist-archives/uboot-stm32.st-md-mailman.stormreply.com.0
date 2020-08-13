Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF9024380F
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 11:56:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 591D8C36B24
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 09:56:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0913FC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Aug 2020 09:56:33 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07D8LH2V022636; Thu, 13 Aug 2020 11:56:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=VCErPJ70HDFww1RSXJRTULSC3no6kKbcGGCQ6kfZxz4=;
 b=lU3ty3RBJi4sMsNSbZ9eZFV8ba7ig5oj8KaBYSrc9R6FS0Q9a3SM01yqGSYy6SklzfFZ
 LWVeYEBkF9o7Y2k8OQt8wAVkOdnXgZrm6Tr8dfoG821K/vF2dtHIZ8cn3JaGt4LlrMiI
 JiXnlJAoUSLckxKFaawajrawjIQslPpCM0mhcJ1CpK4bgyy5xXOuEVXE6qC9MUd1RZWp
 kX0FLhm3sp31cUztn3h3Bin9rIGxkxLsEBDCvFp3FSngLFBV2r7KmVZCDnwbymArftDa
 Ie+tsLCivTY1PR/WNtYjXJQzhqLfxwvhxqglXyn2cnQDLwFNgUyRw7XpBZSLsnn01jZr tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32uj533kkb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 11:56:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B097810002A;
 Thu, 13 Aug 2020 11:56:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A78CF2AB711;
 Thu, 13 Aug 2020 11:56:31 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Aug
 2020 11:56:30 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 13 Aug 2020 11:56:30 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Christophe KERELLO <christophe.kerello@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 01/11] mtd: rawnand: stm32_fmc2: fix a buffer overflow
Thread-Index: AQHWZw/czQiqemPmKEm0gBVJ1nUiq6k1lriAgAApqgA=
Date: Thu, 13 Aug 2020 09:56:30 +0000
Message-ID: <933b961c-68b6-5ef1-b6da-399cdda2ea17@st.com>
References: <1596182024-18181-1-git-send-email-christophe.kerello@st.com>
 <1596182024-18181-2-git-send-email-christophe.kerello@st.com>
 <ab6dc6b3-f0d4-a606-bcba-74808911baec@st.com>
In-Reply-To: <ab6dc6b3-f0d4-a606-bcba-74808911baec@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <6C08BBCC8135FD478D88F3EBF452A18E@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_02:2020-08-11,
 2020-08-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 01/11] mtd: rawnand: stm32_fmc2: fix a
	buffer overflow
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


On 8/13/20 9:27 AM, Patrice CHOTARD wrote:
> Hi Christpohe
>
> On 7/31/20 9:53 AM, Christophe Kerello wrote:
>> The chip select defined in the device tree could only be 0 or 1.
>>
>> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
>> ---
>>
>>  drivers/mtd/nand/raw/stm32_fmc2_nand.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied on u-boot-stm/master

Thanks

>>
>> diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
>> index 3306bd8..2929acf 100644
>> --- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
>> +++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
>> @@ -846,7 +846,7 @@ static int stm32_fmc2_parse_child(struct stm32_fmc2_nfc *fmc2,
>>  	}
>>  
>>  	for (i = 0; i < nand->ncs; i++) {
>> -		if (cs[i] > FMC2_MAX_CE) {
>> +		if (cs[i] >= FMC2_MAX_CE) {
>>  			pr_err("Invalid reg value: %d\n",
>>  			       nand->cs_used[i]);
>>  			return -EINVAL;
> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
>
> Thanks
>
> Patrice
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
