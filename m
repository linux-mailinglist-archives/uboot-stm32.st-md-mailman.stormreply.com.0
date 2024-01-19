Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC62F832AFF
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jan 2024 15:11:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DBEBC6DD73;
	Fri, 19 Jan 2024 14:11:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6EFEBC6B442
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jan 2024 14:11:06 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40JDZc9g030565
 for <uboot-stm32@st-md-mailman.stormreply.com>; Fri, 19 Jan 2024 15:11:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=fTjkVNs64R/T2J6i5mSeM16Etga+FvjpWti99u4bP8w=; b=76
 EkeeXFaJuSXsSqQVucCxD20jAVDSmAnCX703gd/G3H2Pl97j2vqhxr6mUswtG7cD
 bE8Zxe9BDbq3yTqhQOvO9LI8bU1igWXKEKxCY/ej+8wK2TdgmtxwCUub0MGvyV3f
 ngs8mLbBXgaYfThPkaRuokOeInB0ulEtR1mSgW6up5oFSFxmn8R+XGTTTcdtmodY
 pcoFFsoGs45XSF8FXMp9hQHQr2780Nmo0TooVXeL2/7NZq/NI6CKQvZwQsL8o6nz
 Zg5UIiagF0SjQx4KjM/JFfzdCm3bIet+wmM8GF4uDwxp1fxRPCKNJfCSwJnpPWBJ
 1GM1UxFeZxLcqFIGVEDA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vm4y5c0xc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jan 2024 15:11:05 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1A1AF100081
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jan 2024 15:11:05 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 145BA23BE12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jan 2024 15:11:05 +0100 (CET)
Received: from [10.252.4.250] (10.252.4.250) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Jan
 2024 15:11:04 +0100
Message-ID: <871636ba-a59a-43a4-afbc-b8760c99e627@foss.st.com>
Date: Fri, 19 Jan 2024 15:11:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: <uboot-stm32@st-md-mailman.stormreply.com>
References: <20240115143048.1.I808ca7780ec7f1ca146b47adae52ef1060a276c9@changeid>
 <1c7597c1-0da7-42bd-b728-da088d02a2f5@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <1c7597c1-0da7-42bd-b728-da088d02a2f5@foss.st.com>
X-Originating-IP: [10.252.4.250]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_08,2024-01-19_02,2023-05-22_02
Subject: Re: [Uboot-stm32] [PATCH] smt32mp: Add dependencies on CMDLINE for
 command stm32key
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



On 1/15/24 16:45, Patrice CHOTARD wrote:
> 
> 
> On 1/15/24 14:30, Patrick Delaunay wrote:
>> We cannot use stm32key commands without CONFIG_CMDLINE so add the
>> required condition.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>  arch/arm/mach-stm32mp/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
>> index 5fc92d07fe6d..c6c89883f2b0 100644
>> --- a/arch/arm/mach-stm32mp/Kconfig
>> +++ b/arch/arm/mach-stm32mp/Kconfig
>> @@ -144,6 +144,7 @@ config STM32_ECDSA_VERIFY
>>  
>>  config CMD_STM32KEY
>>  	bool "command stm32key to fuse public key hash"
>> +	depends on CMDLINE
>>  	help
>>  		fuse public key hash in corresponding fuse used to authenticate
>>  		binary.
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32


I fixed the title typo "smt32mp" before applying this patch


Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
