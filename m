Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8941689C771
	for <lists+uboot-stm32@lfdr.de>; Mon,  8 Apr 2024 16:48:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB4F0C7129E;
	Mon,  8 Apr 2024 14:48:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B28CC6DD6D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Apr 2024 14:55:02 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4359kf1t021124; Fri, 5 Apr 2024 16:54:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:references:cc:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=IMwlZZT5Rt/ZDz8x3k2kcLnXQVKhi7HurYLd8iLceDM=; b=v5
 tKUmdyoVsAlXwbaSJ0q1Cvcz7QnzGacMKd40Wqwxmqh/QF/pfy63rCkG6W2N77uD
 9UnAIZjnmqDUQx3EzyMNzef0dJaXZnAyO1bBfUcahpYdNoeSvgq2faeP8xPoMrKi
 Stmw6gF9at5tAzYRCSiYebDlJTG0oSj/hQmKnGJg6X5DgRidxrIB0e5xX7GFUCHK
 Xpy/ltnFqCw3RTZ927lSdZPTNlwJ0iLSOkUo+cLzWMyqdtIbb7Xy1OBXoCLsoy1s
 NyxK8NMUWChpHqYkW0Ozb4GmRJmvNIAaUBvcRU+BZXo40phUDJYzqJ6kmoM/9JLx
 4b48ZO/uon/jskTRkqLA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3x9emng8w3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Apr 2024 16:54:48 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 97EE44002D;
 Fri,  5 Apr 2024 16:54:45 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F2CDB2194C2;
 Fri,  5 Apr 2024 16:54:19 +0200 (CEST)
Received: from [10.252.15.227] (10.252.15.227) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 5 Apr
 2024 16:54:18 +0200
Message-ID: <54b1caf6-d807-42c7-a502-19a078cb7f19@foss.st.com>
Date: Fri, 5 Apr 2024 16:54:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240309021831.264018-1-marex@denx.de>
 <20240309021831.264018-10-marex@denx.de>
 <d10d067d-ef53-490e-8383-b95f85234b6f@foss.st.com>
 <DU2PR10MB7787E4967183F1C3D45D16DF8F2A2@DU2PR10MB7787.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <DU2PR10MB7787E4967183F1C3D45D16DF8F2A2@DU2PR10MB7787.EURPRD10.PROD.OUTLOOK.COM>
X-Originating-IP: [10.252.15.227]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_16,2024-04-05_01,2023-05-22_02
X-Mailman-Approved-At: Mon, 08 Apr 2024 14:48:39 +0000
Cc: u-boot@dh-electronics.com, Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Ramon Fried <rfried.dev@gmail.com>,
 Patrick DELAUNAY - foss <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 09/11] net: dwc_eth_qos: Request clk-ck
 earlier in probe on STM32
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

> On 3/9/24 03:11, Marek Vasut wrote:
>> From: Patrick Delaunay <patrick.delaunay@foss.st.com>
>>
>> Request the clk-ck earlier in probe in preparation for obtaining the
>> clock rate from these clk-ck in eqos_probe_syscfg_stm32() in the
>> follow up patch.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>> Cc: Christophe Roullier <christophe.roullier@st.com>
>> Cc: Joe Hershberger <joe.hershberger@ni.com>
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: Ramon Fried <rfried.dev@gmail.com>
>> Cc: u-boot@dh-electronics.com
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>   drivers/net/dwc_eth_qos_stm32.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/net/dwc_eth_qos_stm32.c
>> b/drivers/net/dwc_eth_qos_stm32.c index 33477925ff1..4db18130765
>> 100644
>> --- a/drivers/net/dwc_eth_qos_stm32.c
>> +++ b/drivers/net/dwc_eth_qos_stm32.c
>> @@ -201,6 +201,11 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
>>                return -EINVAL;
>>        }
>>
>> +     /* Get ETH_CLK clocks (optional) */
>> +     ret = clk_get_by_name(dev, "eth-ck", &eqos->clk_ck);
>> +     if (ret)
>> +             dev_dbg(dev, "No phy clock provided %d", ret);
>> +
>>        ret = eqos_probe_syscfg_stm32(dev, interface);
>>        if (ret)
>>                return -EINVAL;
>> @@ -223,11 +228,6 @@ static int eqos_probe_resources_stm32(struct udevice *dev)
>>                goto err_probe;
>>        }
>>
>> -     /*  Get ETH_CLK clocks (optional) */
>> -     ret = clk_get_by_name(dev, "eth-ck", &eqos->clk_ck);
>> -     if (ret)
>> -             dev_warn(dev, "No phy clock provided %d\n", ret);
>> -
>>        dev_dbg(dev, "%s: OK\n", __func__);
>>
>>        return 0;

Reviewed-by: Christophe ROULLIER <christophe.roullier@foss.st.com>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
