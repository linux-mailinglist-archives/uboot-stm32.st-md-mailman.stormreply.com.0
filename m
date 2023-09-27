Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3213D7AFBFB
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Sep 2023 09:26:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7A51C6B462;
	Wed, 27 Sep 2023 07:26:18 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E449C6A60C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Sep 2023 07:26:17 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38R6upxO027538; Wed, 27 Sep 2023 09:26:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:from:to:cc:references
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=z5Ht8JvDCWYbEKYPZDGir4bL8hVrWioa+spsZxE9AtY=; b=z/
 t5fx4T4LSIPgWFiRZZmTpyZLDYZ1qgfutL+cliKZZ6zeGnH7g4oRX1DoXcBW5pO2
 TbcEUI0wxCM1AjRFioZaRVYD5C0QptsylyWmP0TjvciFh4SI+ZuCupjUZdJJGCB4
 F+JyBsXZUyQB4hrEsZoPywZ3jvPZLq0uopvcz61NwseBL31/FlEu8XxqkycKkdfW
 x9I0S0ntYM7ash6l+z46Du4oFiNbYmpJviMLE2Ym3qm6LTSBk2C2KgYrZwV6NFVr
 NvMVo82fLNs7AyqN3+r18kGeYopsRTgJDf1DfZ0z/C+C9vDrY8DFCN2Pu+O7D56p
 a8JClOBCongqxYEWB+Qg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3taayhp9vw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Sep 2023 09:26:13 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 22F1010005A;
 Wed, 27 Sep 2023 09:26:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1C2E0214D04;
 Wed, 27 Sep 2023 09:26:13 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 27 Sep
 2023 09:26:12 +0200
Message-ID: <60681d8b-ce62-f71e-4175-321437e0b25a@foss.st.com>
Date: Wed, 27 Sep 2023 09:26:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, <u-boot@lists.denx.de>
References: <20230919152759.327420-1-gatien.chevallier@foss.st.com>
 <20230919152759.327420-3-gatien.chevallier@foss.st.com>
 <e37f641b-42a8-36eb-e701-b33c1167610f@foss.st.com>
In-Reply-To: <e37f641b-42a8-36eb-e701-b33c1167610f@foss.st.com>
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_03,2023-09-26_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Sughosh Ganu <sughosh.ganu@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v3 2/7] configs: default activate
 CONFIG_RNG_STM32 for STM32MP13x platforms
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



On 9/27/23 08:53, Patrice CHOTARD wrote:
> 
> 
> On 9/19/23 17:27, Gatien Chevallier wrote:
>> Default embed this configuration. If OP-TEE PTA RNG is exposed, it means
>> that the RNG is managed by the secure world. Therefore, the RNG node
>> should be disabled in the device tree as an access would be denied
>> by the hardware firewall.
>>
>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>> Changes in V2:
>> 	- Added Patrick's tag
>>
>>  configs/stm32mp13_defconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
>> index 82b62744f6..4a899c85de 100644
>> --- a/configs/stm32mp13_defconfig
>> +++ b/configs/stm32mp13_defconfig
>> @@ -65,6 +65,7 @@ CONFIG_DM_REGULATOR_GPIO=y
>>  CONFIG_DM_REGULATOR_SCMI=y
>>  CONFIG_RESET_SCMI=y
>>  CONFIG_DM_RNG=y
>> +CONFIG_RNG_STM32=y
>>  CONFIG_DM_RTC=y
>>  CONFIG_RTC_STM32=y
>>  CONFIG_SERIAL_RX_BUFFER=y
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
Apply on stm32/next

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
