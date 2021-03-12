Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB63338D09
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Mar 2021 13:27:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C812C57196;
	Fri, 12 Mar 2021 12:27:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E87D9C57192
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 12:27:17 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12CCN8eW029590; Fri, 12 Mar 2021 13:27:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=i6sJutgl21XIBZNVAhtiXjRQTjRZ9TfVSXA3hgfEXLM=;
 b=hkFUAks5j4SaDnruVEQ1nESFNQwLdRPv7wiwgKG1WwPwemivKKycN03A5RiFLDbdpE4q
 ZcLGEqf52/Qu7cVLxO4dAfvfIFJa4fUHlaKXxljC/mZAoxay28BS+dddT+G+7k0TDU/1
 ZDYa+BgGxJynXjzHmusEokcEpSlzP0jYP5cQQeOgyMv8W7+NVgfMs7B2ikiM0vOkHnMc
 G/S8Vs3C8g8FrZBFmfqUv81bNEo4WFTwSEj8dygyC2WwH8TNVMy0xbIlvUbWhu4knuBW
 JvL1sXKmAyBhjvGj1jOXl4/dJRsxUYm0JBUOIr+iknSSx6guJIptZonF1cfWxIkZsmbJ fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 373yrf5t63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Mar 2021 13:27:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CB9BB10002A;
 Fri, 12 Mar 2021 13:27:15 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C004323C79E;
 Fri, 12 Mar 2021 13:27:15 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Mar
 2021 13:27:14 +0100
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210225114917.1.If8dd5ef8c9f53bfc56498a9c7c8f23ea05588829@changeid>
 <4aaafac9-40a4-bcda-ce19-66ef52bdfce0@foss.st.com>
Message-ID: <2c222667-94d4-1dba-8707-fa329c133850@foss.st.com>
Date: Fri, 12 Mar 2021 13:27:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4aaafac9-40a4-bcda-ce19-66ef52bdfce0@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-12_03:2021-03-10,
 2021-03-12 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH] board: st: remove the nand MTD
 configuration for NOR boot in stm32mp1 board
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

Hi

On 3/9/21 2:06 PM, Patrice CHOTARD wrote:
> Hi Patrick
> 
> On 2/25/21 11:49 AM, Patrick Delaunay wrote:
>> Since commit d5d726d3cc47 ("configs: stm32mp1: only support SD card after
>> NOR in bootcmd_stm32mp"), the stm32mp1 boards only support SD card after
>> NOR boot device, so the MTD partitions for nand0 or spi-nand0 are useless
>> (no need of "UBI" partition in nand0 or spi-nand0).
>>
>> This patch removes these nand MTD update for nor boot and simplify nand0
>> and spi-nand0 support (remove the mtd_boot variable).
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>  board/st/common/stm32mp_mtdparts.c | 16 +++++-----------
>>  1 file changed, 5 insertions(+), 11 deletions(-)
>>
>> diff --git a/board/st/common/stm32mp_mtdparts.c b/board/st/common/stm32mp_mtdparts.c
>> index 69eb10844d..f074fc189d 100644
>> --- a/board/st/common/stm32mp_mtdparts.c
>> +++ b/board/st/common/stm32mp_mtdparts.c
>> @@ -122,28 +122,24 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
>>  		log_debug("mtd device = %s\n", dev->name);
>>  	}
>>  
>> -	if (nor || nand) {
>> +	if (nand) {
>>  		mtd = get_mtd_device_nm("nand0");
>>  		if (!IS_ERR_OR_NULL(mtd)) {
>> -			const char *mtd_boot = CONFIG_MTDPARTS_NAND0_BOOT;
>>  			const char *mtd_tee = CONFIG_MTDPARTS_NAND0_TEE;
>> -
>>  			board_set_mtdparts("nand0", ids, parts,
>> -					   !nor ? mtd_boot : NULL,
>> +					   CONFIG_MTDPARTS_NAND0_BOOT,
>>  					   !nor && tee ? mtd_tee : NULL,
>>  					   "-(UBI)");
>>  			put_mtd_device(mtd);
>>  		}
>>  	}
>>  
>> -	if (nor || spinand) {
>> +	if (spinand) {
>>  		mtd = get_mtd_device_nm("spi-nand0");
>>  		if (!IS_ERR_OR_NULL(mtd)) {
>> -			const char *mtd_boot = CONFIG_MTDPARTS_SPINAND0_BOOT;
>>  			const char *mtd_tee = CONFIG_MTDPARTS_SPINAND0_TEE;
>> -
>>  			board_set_mtdparts("spi-nand0", ids, parts,
>> -					   !nor ? mtd_boot : NULL,
>> +					   CONFIG_MTDPARTS_SPINAND0_BOOT,
>>  					   !nor && tee ? mtd_tee : NULL,
>>  					   "-(UBI)");
>>  			put_mtd_device(mtd);
>> @@ -152,11 +148,9 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
>>  
>>  	if (nor) {
>>  		if (!uclass_get_device(UCLASS_SPI_FLASH, 0, &dev)) {
>> -			const char *mtd_boot = CONFIG_MTDPARTS_NOR0_BOOT;
>>  			const char *mtd_tee = CONFIG_MTDPARTS_NOR0_TEE;
>> -
>>  			board_set_mtdparts("nor0", ids, parts,
>> -					   mtd_boot,
>> +					   CONFIG_MTDPARTS_NOR0_BOOT,
>>  					   tee ? mtd_tee : NULL,
>>  					   "-(nor_user)");
>>  		}
>>
> 
> 
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
> 
Applied to u-boot-stm/next

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
