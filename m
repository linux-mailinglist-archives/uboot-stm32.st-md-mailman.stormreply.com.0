Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E647F5E7AD8
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 Sep 2022 14:33:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7FA5C0D2C2;
	Fri, 23 Sep 2022 12:33:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05623C03FD6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Sep 2022 12:33:34 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28N9a1vK019845;
 Fri, 23 Sep 2022 14:33:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=AZoTKhrCHKGWjUPDYGGEJTme8TailOqfyM7ahYkeIcw=;
 b=8CBNx64MOseMEqx5W8e1dsQbZ29HZzIYgKgNqAayBYx0baVGt/CLEI1WUtFfA3y4OhOq
 1euetkmIdIbi8afBXj3KbghQxmc8TaS3LaUQ+783+JKP0CPdc14N9KYBDHCcI7AVtvNs
 awgAVB0vP8DCICPKYOCFEqvEpysoKYGNDknx+4wecFgHNeb/075xcdWUM6l2Jrtr7Hfl
 FoebSJs6urFFPuV06eOzMcmuO6McEZziymw9bncnUgR1A0DyszrAGlAB9SXBjbiYbhAH
 RfJ7XrN1sZRBbkDbjCDLUz/47zrIsaIW9eY1VtQ+V5PaSHBhzWKHyt0ZH6A/qq21a+Up pA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jsaaf8yd8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Sep 2022 14:33:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5FCD210002A;
 Fri, 23 Sep 2022 14:33:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5AE582291CD;
 Fri, 23 Sep 2022 14:33:33 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.120) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Fri, 23 Sep
 2022 14:33:33 +0200
Message-ID: <74ee192d-b42f-214d-bb8f-167df95fd8d7@foss.st.com>
Date: Fri, 23 Sep 2022 14:33:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220916165244.1.I22e7aeac596c03aca2236b69fd3cdf41a1f11339@changeid>
 <9f4dd203-a66f-a7c1-8aac-0da3e2a00b59@foss.st.com>
In-Reply-To: <9f4dd203-a66f-a7c1-8aac-0da3e2a00b59@foss.st.com>
X-Originating-IP: [10.75.127.120]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-23_04,2022-09-22_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32mp1: cleanup config file
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

On 9/19/22 08:42, Patrice CHOTARD wrote:
> Hi PAtrick
> 
> On 9/16/22 16:52, Patrick Delaunay wrote:
>> Remove the unnecessary comment after the CONFIG_SYS_BOOTM_LEN
>> migration to Kconfig.
>>
>> Fixes: c45568cc4e51 ("Convert CONFIG_SYS_BOOTM_LEN to Kconfig")
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>  include/configs/stm32mp13_common.h | 2 --
>>  include/configs/stm32mp15_common.h | 2 --
>>  2 files changed, 4 deletions(-)
>>
>> diff --git a/include/configs/stm32mp13_common.h b/include/configs/stm32mp13_common.h
>> index 3ca65ea2a37..78089b965ae 100644
>> --- a/include/configs/stm32mp13_common.h
>> +++ b/include/configs/stm32mp13_common.h
>> @@ -21,8 +21,6 @@
>>   */
>>  #define CONFIG_SYS_BOOTMAPSZ		SZ_256M
>>  
>> -/* Extend size of kernel image for uncompression */
>> -
>>  /*MMC SD*/
>>  #define CONFIG_SYS_MMC_MAX_DEVICE	2
>>  
>> diff --git a/include/configs/stm32mp15_common.h b/include/configs/stm32mp15_common.h
>> index c5412ffeb31..bd8e16bc1b9 100644
>> --- a/include/configs/stm32mp15_common.h
>> +++ b/include/configs/stm32mp15_common.h
>> @@ -21,8 +21,6 @@
>>   */
>>  #define CONFIG_SYS_BOOTMAPSZ		SZ_256M
>>  
>> -/* Extend size of kernel image for uncompression */
>> -
>>  /*MMC SD*/
>>  #define CONFIG_SYS_MMC_MAX_DEVICE	3
>>  
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
applied on u-boot-stm32/next

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
