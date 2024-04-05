Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2385689C76C
	for <lists+uboot-stm32@lfdr.de>; Mon,  8 Apr 2024 16:48:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBAC5C71294;
	Mon,  8 Apr 2024 14:48:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A28CC6C83C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Apr 2024 14:48:22 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 435EZblk030619; Fri, 5 Apr 2024 16:48:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:references:cc:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=hS+uQK9q1OAYIweP6Jd3cxvYkxVOmoFydptLbNXI1KM=; b=pX
 srwIGvue+y2mQL93m/2fHZgfVb2y5FYB5hoCZMrjYI0Jsppvzw/Guq6+42rCkuO6
 f/E1zFh8URmu+Cg4mi/valnI95aVTRp8ahuHHHINBzHVymsxydUXY/Zf40qryHS5
 DcZjtqcaje33nkmVVMEDBSGivW99qSgqKDsmLLr+Xd0gGrAVH7mK3/YuywVXAg0P
 2CblR/nYDJ9NlclqvPzVOPxOdSZmu4LVHu8igxYc9/ugagk0bht9/w8JcEDORT9l
 lXDLLGAafuKDWH1OS6RcmF3IYA0hblSv61xBSWmRcYYSks0r6q+0PAuFx3yEqYe+
 EitbtWkvWY0M/c0uOqpg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3x9emv88nf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Apr 2024 16:48:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A920C4002D;
 Fri,  5 Apr 2024 16:48:02 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 648A92194FC;
 Fri,  5 Apr 2024 16:47:38 +0200 (CEST)
Received: from [10.252.15.227] (10.252.15.227) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 5 Apr
 2024 16:47:37 +0200
Message-ID: <e81f015a-3d0e-4023-b675-bd1b99b77a64@foss.st.com>
Date: Fri, 5 Apr 2024 16:47:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240309021831.264018-1-marex@denx.de>
 <20240309021831.264018-5-marex@denx.de>
 <ddb2922c-f619-41b1-abf6-10551fd600d1@foss.st.com>
 <DU2PR10MB7787EDC5D9DB66CC1EB889118F2A2@DU2PR10MB7787.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <DU2PR10MB7787EDC5D9DB66CC1EB889118F2A2@DU2PR10MB7787.EURPRD10.PROD.OUTLOOK.COM>
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
Subject: Re: [Uboot-stm32] [PATCH 04/11] net: dwc_eth_qos: Scrub ifdeffery
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
>> Replace ifdef CONFIG_CLK with if (CONFIG_IS_ENABLED(CLK)) to improve
>> code build coverage. Some of the functions printed debug("%s: OK\n",
>> __func__); on exit with and without CLK enabled, some did not, make it
>> consistent and print nothing if CLK is disabled.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Christophe Roullier <christophe.roullier@st.com>
>> Cc: Joe Hershberger <joe.hershberger@ni.com>
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: Ramon Fried <rfried.dev@gmail.com>
>> Cc: u-boot@dh-electronics.com
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>   drivers/net/dwc_eth_qos_stm32.c | 25 ++++++++++++-------------
>>   1 file changed, 12 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/net/dwc_eth_qos_stm32.c
>> b/drivers/net/dwc_eth_qos_stm32.c index 7520a136ed0..d7ec0c9be36
>> 100644
>> --- a/drivers/net/dwc_eth_qos_stm32.c
>> +++ b/drivers/net/dwc_eth_qos_stm32.c
>> @@ -46,21 +46,22 @@
>>
>>   static ulong eqos_get_tick_clk_rate_stm32(struct udevice *dev)  {
>> -#ifdef CONFIG_CLK
>> -     struct eqos_priv *eqos = dev_get_priv(dev);
>> +     struct eqos_priv __maybe_unused *eqos = dev_get_priv(dev);
>> +
>> +     if (!CONFIG_IS_ENABLED(CLK))
>> +             return 0;
>>
>>        return clk_get_rate(&eqos->clk_master_bus);
>> -#else
>> -     return 0;
>> -#endif
>>   }
>>
>>   static int eqos_start_clks_stm32(struct udevice *dev)  { -#ifdef
>> CONFIG_CLK
>> -     struct eqos_priv *eqos = dev_get_priv(dev);
>> +     struct eqos_priv __maybe_unused *eqos = dev_get_priv(dev);
>>        int ret;
>>
>> +     if (!CONFIG_IS_ENABLED(CLK))
>> +             return 0;
>> +
>>        debug("%s(dev=%p):\n", __func__, dev);
>>
>>        ret = clk_enable(&eqos->clk_master_bus);
>> @@ -89,12 +90,10 @@ static int eqos_start_clks_stm32(struct udevice *dev)
>>                }
>>                eqos->clk_ck_enabled = true;
>>        }
>> -#endif
>>
>>        debug("%s: OK\n", __func__);
>>        return 0;
>>
>> -#ifdef CONFIG_CLK
>>   err_disable_clk_tx:
>>        clk_disable(&eqos->clk_tx);
>>   err_disable_clk_rx:
>> @@ -104,20 +103,20 @@ err_disable_clk_master_bus:
>>   err:
>>        debug("%s: FAILED: %d\n", __func__, ret);
>>        return ret;
>> -#endif
>>   }
>>
>>   static int eqos_stop_clks_stm32(struct udevice *dev)  { -#ifdef
>> CONFIG_CLK
>> -     struct eqos_priv *eqos = dev_get_priv(dev);
>> +     struct eqos_priv __maybe_unused *eqos = dev_get_priv(dev);
>> +
>> +     if (!CONFIG_IS_ENABLED(CLK))
>> +             return 0;
>>
>>        debug("%s(dev=%p):\n", __func__, dev);
>>
>>        clk_disable(&eqos->clk_tx);
>>        clk_disable(&eqos->clk_rx);
>>        clk_disable(&eqos->clk_master_bus);
>> -#endif
>>
>>        debug("%s: OK\n", __func__);
>>        return 0;
>
> Reviewed-by: Christophe ROULLIER <christophe.roullier@foss.st.com>
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
