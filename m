Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B44520EC4
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 May 2022 09:38:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B686C0D2BC;
	Tue, 10 May 2022 07:38:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06ED3C0D2BB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 May 2022 07:38:27 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A2NPlX023055;
 Tue, 10 May 2022 09:38:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=pXiA3LmBy20XpW1d0pyorDWgL/X2mY5aFbXnuqwg2EE=;
 b=PEJSpuPmu1RPiOcTSQqn1xCKzkSPkLp1UMrm7aHyi9VGjfb2b12k3v8si6RpNTilF6x9
 BPt8zX2705sl/z/BOWNyIZUcneMKdSpgsvHvgO6wQWaf2kY2Po/xd3hoHpRjYBrATHE5
 b3KTVp2PeClUJ1nNAPyijeNrvUCH9BKI9XenuAHYMl7OSFV1C1JkCg9xfPW2E2xDJ+2S
 1vJmlwSzMSc0CuRRWG0Nj1WMy+idMHAbT17hYjZ4GBLhfn7sgyN9KyURsduWEs/LkOBX
 mgUKKOZ8jmLar+WbAwLItAgoOnDKzvXGO/TTG2vZUSsCg28pr+651ussb/ZhvaPsvXcM aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwg40x6y2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 09:38:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 986BC100034;
 Tue, 10 May 2022 09:38:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8B4F12128BB;
 Tue, 10 May 2022 09:38:25 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.49) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 10 May
 2022 09:38:25 +0200
Message-ID: <664ece1e-b2cc-922d-8d58-94f70d2d1c3f@foss.st.com>
Date: Tue, 10 May 2022 09:38:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220415144321.1.Ic7fcf7558ba1c08e031b54acd7b9f3544addb1d8@changeid>
 <834cd6d1-6ee4-9a11-ddc5-ef498dc33b58@foss.st.com>
In-Reply-To: <834cd6d1-6ee4-9a11-ddc5-ef498dc33b58@foss.st.com>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_01,2022-05-09_02,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32mp: skip ft_system_setup when
 the soc node is absent
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

I will fix the typo when applying this patch to u-boot-stm32 branch

Patrice

On 4/22/22 09:47, Patrice CHOTARD wrote:
> 
> 
> On 4/15/22 14:43, Patrick Delaunay wrote:
>> The function ft_system_setup should don't return an error when the
> 
> s/should don't/shouldn't
> with this fix you can had my reviewed-by
> 
> Thanks
> 
>> /soc node is absent in the provided device tree but just skip the
>> updates.
>>
>> This patch solves an issue when the U-Boot pytest is executed on board.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>  arch/arm/mach-stm32mp/fdt.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/arm/mach-stm32mp/fdt.c b/arch/arm/mach-stm32mp/fdt.c
>> index 91330a68a4..b1a4b76566 100644
>> --- a/arch/arm/mach-stm32mp/fdt.c
>> +++ b/arch/arm/mach-stm32mp/fdt.c
>> @@ -260,6 +260,9 @@ int ft_system_setup(void *blob, struct bd_info *bd)
>>  	char name[SOC_NAME_SIZE];
>>  
>>  	soc = fdt_path_offset(blob, "/soc");
>> +	/* when absent, nothing to do */
>> +	if (soc == -FDT_ERR_NOTFOUND)
>> +		return 0;
>>  	if (soc < 0)
>>  		return soc;
>>  
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
