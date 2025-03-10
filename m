Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6734A590A9
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Mar 2025 11:03:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 822BEC78F99;
	Mon, 10 Mar 2025 10:03:41 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08294C7802E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 10:03:40 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A931Jl016745;
 Mon, 10 Mar 2025 11:03:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 rl5pMY4t73ZybmEEnG8/g6OphpKuy6RQpP/fPaU2wx0=; b=OH5jYsbRnrHXTIZW
 aoOk8TcTihdKrQjsFE/uK7jAz4bxtoGLdustmojW9wLjQNtSWzz8xtvs1Nh1ThZg
 GKuF84qydxBHSmvEJRwFeSrlWf0Wiwx7WXfvaIyz4BjJEk4XXQBXgDLPiViK5/Ot
 bDAYGW4Py2NiotxzUjTzdtJKaZX+/fDqd1kXLEJCxMnfja5A0zlEONgrEGE8PBuL
 rUxx9RvBYOvBW5CSPPVEF3pwH8FNID0osxNii8CYnPLBVpxNoyeG2l0Rvw8zqsDu
 ipF7C9gUU4gheMGUqAA6JKj7xanGHfQXl4xriE15r2rvnijw3/XjJUs8IbsD6KeN
 lml7Vw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4591qru0xk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Mar 2025 11:03:38 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D6DAF400A8;
 Mon, 10 Mar 2025 11:02:31 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 013E758F955;
 Mon, 10 Mar 2025 11:00:59 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 11:00:58 +0100
Message-ID: <2ad51ae3-53d7-42f6-bb3a-800ba6c6b672@foss.st.com>
Date: Mon, 10 Mar 2025 11:00:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Cheick Traore <cheick.traore@foss.st.com>, <u-boot@lists.denx.de>
References: <20250306105620.624760-1-cheick.traore@foss.st.com>
 <20250306115558.1.I060a56226e03cddfd4a6d6b98bc86c91435710cc@changeid>
 <6ef98461-7ffb-4257-bc5f-bc0c543a773c@foss.st.com>
Content-Language: en-US
In-Reply-To: <6ef98461-7ffb-4257-bc5f-bc0c543a773c@foss.st.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_04,2025-03-07_03,2024-11-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 1/5] dm: pwm: Check if duty_ns is lower
	than period_ns
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



On 3/6/25 15:13, Patrice CHOTARD wrote:
> 
> 
> On 3/6/25 11:56, Cheick Traore wrote:
>> It was possible to provide a duty_ns greater than period_ns to
>> "pwm config" command. The framework must check the values before
>> providing them to drivers.
>>
>> Signed-off-by: Cheick Traore <cheick.traore@foss.st.com>
>> ---
>>
>>  drivers/pwm/pwm-uclass.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/pwm/pwm-uclass.c b/drivers/pwm/pwm-uclass.c
>> index 6543db1d623..b4491f7dcd4 100644
>> --- a/drivers/pwm/pwm-uclass.c
>> +++ b/drivers/pwm/pwm-uclass.c
>> @@ -27,6 +27,9 @@ int pwm_set_config(struct udevice *dev, uint channel, uint period_ns,
>>  	if (!ops->set_config)
>>  		return -ENOSYS;
>>  
>> +	if (duty_ns > period_ns)
>> +		return -EINVAL;
>> +
>>  	return ops->set_config(dev, channel, period_ns, duty_ns);
>>  }
>>  
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
