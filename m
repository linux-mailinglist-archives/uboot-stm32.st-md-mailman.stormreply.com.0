Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF157832A66
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jan 2024 14:27:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A26CDC6DD74;
	Fri, 19 Jan 2024 13:27:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12862C6DD73
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jan 2024 13:27:00 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40JB8vPN030023
 for <uboot-stm32@st-md-mailman.stormreply.com>; Fri, 19 Jan 2024 14:27:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=cuhPD5h5shCZMfvqt+wE08d3wSH32kC1rtY05D6GesY=; b=Y0
 YfOYKylsQn5A74ujEPtFiL6U2jk9IGFWNAzVVoN3jJaycnlD3mA+WnDextccOXIX
 8jHbliLEKdm8W7aXYwdFQIsOj8uVhsVdjXZklwzUoFT4rR3O0UkJwvfXMMboyOeJ
 /oeGfjsMGTOgN2TpThsqnViSUfnTFP4pikKbPPGXNr95Ty/yJlqDkLMfNE7U+b2v
 4dk1k9BQV488+IXAwCDQ7xOsKI5JeAUk+zNsbYsV92WCXa3QYLh0rnS5zKNqN57w
 IRbw9BHOQAesXDLUnEaY0fiufNzuhONn35pxhmsUL3vYD9VnHlTmYZeMa3lGjOOq
 RFssg0IyqF+pL+b4lGZg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vkmbhnuc6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jan 2024 14:27:00 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 305A7100081
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jan 2024 14:27:00 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 28BF623D41E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jan 2024 14:27:00 +0100 (CET)
Received: from [10.252.4.250] (10.252.4.250) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Jan
 2024 14:26:59 +0100
Message-ID: <0b2a747b-b77d-4619-a773-06d07059a1cf@foss.st.com>
Date: Fri, 19 Jan 2024 14:26:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: <uboot-stm32@st-md-mailman.stormreply.com>
References: <20240115140557.57448-1-patrick.delaunay@foss.st.com>
 <20240115150451.v2.9.Iad107c8eaf11680ad8debbedc8d48327f31fd866@changeid>
 <4dec5e9a-7a4b-4b1b-8736-8e56970e4bcc@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <4dec5e9a-7a4b-4b1b-8736-8e56970e4bcc@foss.st.com>
X-Originating-IP: [10.252.4.250]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_08,2024-01-19_02,2023-05-22_02
Subject: Re: [Uboot-stm32] [PATCH v2 09/14] stm32mp: stm32prog: add support
 of stm32mp25
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



On 1/15/24 18:41, Patrice CHOTARD wrote:
> 
> 
> On 1/15/24 15:05, Patrick Delaunay wrote:
>> Change OTP number to 364 for STM32MP25 as it is done in bsec driver.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>> (no changes since v1)
>>
>>  arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
>> index ae4bd8842f53..eda98eb61d76 100644
>> --- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
>> +++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
>> @@ -28,7 +28,15 @@
>>  #else
>>  #define OTP_SIZE_SMC		0
>>  #endif
>> -#define OTP_SIZE_TA		776
>> +/* size of the OTP struct in NVMEM PTA */
>> +#define _OTP_SIZE_TA(otp)	(((otp) * 2 + 2) * 4)
>> +#if defined(CONFIG_STM32MP13x) || defined(CONFIG_STM32MP15x)
>> +/* STM32MP1 with BSEC2 */
>> +#define OTP_SIZE_TA		_OTP_SIZE_TA(96)
>> +#else
>> +/* STM32MP2 with BSEC3 */
>> +#define OTP_SIZE_TA		_OTP_SIZE_TA(368)
>> +#endif
>>  #define PMIC_SIZE		8
>>  
>>  enum stm32prog_target {
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
