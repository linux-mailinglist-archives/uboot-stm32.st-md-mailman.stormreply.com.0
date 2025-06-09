Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D21AD1A14
	for <lists+uboot-stm32@lfdr.de>; Mon,  9 Jun 2025 10:55:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A4E9C3F93A;
	Mon,  9 Jun 2025 08:55:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4974C3F939
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Jun 2025 08:55:28 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5597m3O1000334;
 Mon, 9 Jun 2025 10:55:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 QWES8ZJX4nVZAWr6I8CtYqgwiCnkZUFmrdj8awBGO2g=; b=Hu4HlbpbxCQF8def
 UDewbF9OYSN6GQt0n7r6LmdwzjzbNkXffJ8j+UDOTiPjZP6V5/y5hDCu4JHzUM42
 SQFZDfVR46qxuoheX5SsdG3HPp/E25GFGZ6C2jsS6vwfwXcEqdbQ1yBqGvOQ8Hrq
 qV/usXcD+lxZ4Vt6DoRov2rlAr9fxOReim/MAmCL8Rvhg6gEDH5wKYwfuXBiUv86
 kn82z8XoopMUjVBA9bfEL+E7Pqg1j2XNQqrCcSRQbD7lU4uS/WYxBWpq8bcImvSF
 /gJBEIpNmJklTe01r5UJXQytfNhRx9dLYutGWMMy2uhscVwsI1LMAiMtC7JfXYxd
 s5L00Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474aum6yys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jun 2025 10:55:17 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 07F5E40045;
 Mon,  9 Jun 2025 10:54:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 867FDB7DFF3;
 Mon,  9 Jun 2025 10:54:03 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 10:54:03 +0200
Message-ID: <005053a8-4345-481c-83d3-11d10ff124aa@foss.st.com>
Date: Mon, 9 Jun 2025 10:54:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20250512161146.146658-1-marek.vasut@mailbox.org>
 <131f183e-8cf2-4669-91d2-d191156b8153@foss.st.com>
Content-Language: en-US
In-Reply-To: <131f183e-8cf2-4669-91d2-d191156b8153@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_03,2025-06-05_01,2025-03-28_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Drop unnecessary space
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



On 5/21/25 15:47, Patrice CHOTARD wrote:
> 
> 
> On 5/12/25 18:11, Marek Vasut wrote:
>> Drop a space after tab, no functional change.
>>
>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>> ---
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: Simon Glass <sjg@chromium.org>
>> Cc: Tom Rini <trini@konsulko.com>
>> Cc: u-boot@lists.denx.de
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>  arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c b/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
>> index 4f1d783649b..caeeeca863c 100644
>> --- a/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
>> +++ b/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
>> @@ -67,7 +67,7 @@
>>  #define BOOTROM_PARAM_ADDR	0x2FFC0078
>>  #define BOOTROM_MODE_MASK	GENMASK(15, 0)
>>  #define BOOTROM_MODE_SHIFT	0
>> -#define BOOTROM_INSTANCE_MASK	 GENMASK(31, 16)
>> +#define BOOTROM_INSTANCE_MASK	GENMASK(31, 16)
>>  #define BOOTROM_INSTANCE_SHIFT	16
>>  
>>  /* Device Part Number (RPN) = OTP_DATA1 lower 8 bits */
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
