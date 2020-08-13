Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B62FD243812
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 11:57:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D53EC36B24
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 09:57:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1E2FC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Aug 2020 09:57:28 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07D8RkSa022529; Thu, 13 Aug 2020 11:57:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=xZOm9Yv6YApj+kPwZ4LDVaAkBbsYqlW8GHXz0Xm6PcI=;
 b=KF+7MgbeeoB41DMksXWC+bztDEvsXTnGepNQ5b8abts7NZfj0ZvD68RrqB3/VuH5ujcH
 AA1vIZLSVVczM1AMbT5LltyQl+XRsk445/0OH+T1C8PHyDU1oUJR7pgdszbJ+mj9XlFs
 dRDPY2dWvet+TExLcQ6CnHkyIJ3XQRp1dcXU3zgBOgUOVTzqO0QNcC389J4u8GbEGW31
 Nn0C6Qrbltm+bQH2Qd5dDGKw4Jn15SOcv9yJdZub8Xzo28JupvRaPROaF1Qtug/U4bSi
 7yrd4l2yUZp1p6efo1JDS2GSLek00e6IhS/lQ1pSqsWN0BAfPbstvbMn+3KhMqK6PItJ SQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32uj533kqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 11:57:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B096810002A;
 Thu, 13 Aug 2020 11:57:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A896F2AAC1D;
 Thu, 13 Aug 2020 11:57:27 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Aug
 2020 11:57:26 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 13 Aug 2020 11:57:26 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Christophe KERELLO <christophe.kerello@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 03/11] mtd: rawnand: stm32_fmc2: use FMC2_TIMEOUT_5S for
 timeouts
Thread-Index: AQHWZw/fvr4SfUFs3U6RV/7Y4qCpdak1lzAAgAApdoA=
Date: Thu, 13 Aug 2020 09:57:26 +0000
Message-ID: <5a525dee-85c3-337c-0523-1bb99612dc67@st.com>
References: <1596182024-18181-1-git-send-email-christophe.kerello@st.com>
 <1596182024-18181-4-git-send-email-christophe.kerello@st.com>
 <e8ae4689-4eaa-4594-fad1-85b0ea23893a@st.com>
In-Reply-To: <e8ae4689-4eaa-4594-fad1-85b0ea23893a@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <77652301D9BBBF4DBCAFE1CC563B1626@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_02:2020-08-11,
 2020-08-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 03/11] mtd: rawnand: stm32_fmc2: use
 FMC2_TIMEOUT_5S for timeouts
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


On 8/13/20 9:29 AM, Patrice CHOTARD wrote:
> Hi Christophe
>
> On 7/31/20 9:53 AM, Christophe Kerello wrote:
>> FMC2_TIMEOUT_5S will be used each time that we need to wait.
>> It was seen, during stress tests in an overloaded system,
>> that we could be close to 1 second, even if we never met this
>> value. To be safe, FMC2_TIMEOUT_MS is set to 5 seconds.
>>
>> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
>> ---
>>
>>  drivers/mtd/nand/raw/stm32_fmc2_nand.c | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)

Applied on u-boot-stm/master

Thanks

>>
>> diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
>> index f43e3ec..2e947a3 100644
>> --- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
>> +++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
>> @@ -131,6 +131,8 @@
>>  
>>  #define FMC2_NSEC_PER_SEC		1000000000L
>>  
>> +#define FMC2_TIMEOUT_5S			5000000
>> +
>>  enum stm32_fmc2_ecc {
>>  	FMC2_ECC_HAM = 1,
>>  	FMC2_ECC_BCH4 = 4,
>> @@ -339,7 +341,7 @@ static int stm32_fmc2_ham_calculate(struct mtd_info *mtd, const u8 *data,
>>  	int ret;
>>  
>>  	ret = readl_poll_timeout(fmc2->io_base + FMC2_SR, sr,
>> -				 sr & FMC2_SR_NWRF, 10000);
>> +				 sr & FMC2_SR_NWRF, FMC2_TIMEOUT_5S);
>>  	if (ret < 0) {
>>  		pr_err("Ham timeout\n");
>>  		return ret;
>> @@ -424,7 +426,7 @@ static int stm32_fmc2_bch_calculate(struct mtd_info *mtd, const u8 *data,
>>  
>>  	/* Wait until the BCH code is ready */
>>  	ret = readl_poll_timeout(fmc2->io_base + FMC2_BCHISR, bchisr,
>> -				 bchisr & FMC2_BCHISR_EPBRF, 10000);
>> +				 bchisr & FMC2_BCHISR_EPBRF, FMC2_TIMEOUT_5S);
>>  	if (ret < 0) {
>>  		pr_err("Bch timeout\n");
>>  		return ret;
>> @@ -472,7 +474,7 @@ static int stm32_fmc2_bch_correct(struct mtd_info *mtd, u8 *dat,
>>  
>>  	/* Wait until the decoding error is ready */
>>  	ret = readl_poll_timeout(fmc2->io_base + FMC2_BCHISR, bchisr,
>> -				 bchisr & FMC2_BCHISR_DERF, 10000);
>> +				 bchisr & FMC2_BCHISR_DERF, FMC2_TIMEOUT_5S);
>>  	if (ret < 0) {
>>  		pr_err("Bch timeout\n");
>>  		return ret;
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
