Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C374DA590F5
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Mar 2025 11:20:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72FBEC7A821;
	Mon, 10 Mar 2025 10:20:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00509C7A820
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 10:20:31 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52AAIpYL032034;
 Mon, 10 Mar 2025 11:20:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 5Zc1etY5wkNs7CqK+O4ymjbFDgDspLO8/eU3ztWFgrM=; b=5laL/cM5VXFlU9KW
 l/XaS/fEBIEQMolBbXtVY5Y2dRV40ol9RGTnDNGT95h+GdTwNn5unHVDt0hyURCd
 qeTOpyNFjObnqshZcf4MrQAZh3Ere8fhujg7dpLUjmA+FLWShiK1pzWQPj2egttv
 ftwEHg4ksTqFSS5x+/aF3glJj3jKWSa79Yrl/8vOcdAXkjdP6Pk5Ou9YTRlBIf78
 hKzeQIEkD/XECnjQ+I7eWCTxDw3Uz17q82rpjs5C+oQSEQ8LSONg8AKOKCoIt7uQ
 bQjyD9U4VR87h9bjUygdKMAuKJ7aneynploA4X/xig8Kez8Q4cJtiuZu8GqWayGx
 crdv8Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 458f57243x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Mar 2025 11:20:29 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1518B40078;
 Mon, 10 Mar 2025 11:18:52 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9F58D55FD12;
 Mon, 10 Mar 2025 11:15:23 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 11:15:23 +0100
Message-ID: <3d0803b5-2404-40b5-93bc-e2fa2ffe4cc0@foss.st.com>
Date: Mon, 10 Mar 2025 11:15:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Vikas Manocha
 <vikas.manocha@st.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>
References: <20250211-stm32f769-uart-fix-v1-1-8d0eaf0b193a@linaro.org>
 <98995b05-aacc-477f-b1f6-a9b2d307c0ea@foss.st.com>
Content-Language: en-US
In-Reply-To: <98995b05-aacc-477f-b1f6-a9b2d307c0ea@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_04,2025-03-07_03,2024-11-22_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32f769-disco: Fix console
	cmdline
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



On 2/11/25 17:49, Patrice CHOTARD wrote:
> 
> 
> On 2/11/25 10:12, Linus Walleij wrote:
>> The Linux cmdline encoded in the defconfig is wrong, the
>> STM32 USART driver registers as ttySTM0 not ttyS0.
>>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>>  configs/stm32f769-disco_defconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/configs/stm32f769-disco_defconfig b/configs/stm32f769-disco_defconfig
>> index 5be221afd2facb0af4a3a3f8df0f24fb34eaf10d..9edda0e36b2e92c3dbe3298a3da04bd731dac452 100644
>> --- a/configs/stm32f769-disco_defconfig
>> +++ b/configs/stm32f769-disco_defconfig
>> @@ -18,7 +18,7 @@ CONFIG_AUTOBOOT_KEYED=y
>>  CONFIG_AUTOBOOT_PROMPT="Hit SPACE in %d seconds to stop autoboot.\n"
>>  CONFIG_AUTOBOOT_STOP_STR=" "
>>  CONFIG_USE_BOOTARGS=y
>> -CONFIG_BOOTARGS="console=ttyS0,115200 earlyprintk consoleblank=0 ignore_loglevel"
>> +CONFIG_BOOTARGS="console=ttySTM0,115200n8 earlyprintk consoleblank=0 ignore_loglevel"
>>  CONFIG_SYS_PBSIZE=1050
>>  # CONFIG_DISPLAY_CPUINFO is not set
>>  CONFIG_CYCLIC_MAX_CPU_TIME_US=8000
>>
>> ---
>> base-commit: cb3612dfe3fd9a702dc3657aae15b07974f9aa0b
>> change-id: 20250211-stm32f769-uart-fix-66650ddf9c80
>>
>> Best regards,
> 
> 
> Hi Linus
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
Applied to u-boot-stm32/next

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
