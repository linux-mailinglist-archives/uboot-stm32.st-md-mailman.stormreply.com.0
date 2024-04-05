Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB6189C76E
	for <lists+uboot-stm32@lfdr.de>; Mon,  8 Apr 2024 16:48:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1DAAC71296;
	Mon,  8 Apr 2024 14:48:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0AE47C6C83C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Apr 2024 14:49:37 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4359aBQK018708; Fri, 5 Apr 2024 16:49:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:references:cc:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=dZHFsJjBEki5p0rm78B0jgPUO8O568NrlwzvKRZ/cmI=; b=KX
 JZkDsWpOxSyLV68Ws0qeVbrGHFHDQfQBXEwO0bNS2Or3qMlBd/FtUtvtnR1amhOT
 cotzyp/98xnDK3BUhTP/euD4pVEdMXI6FBsASnDcYJNCre3WQRg6TJGAq6Yy3Ptb
 YyynOcdCUJjydFgSjh1hSAYY0UlVuhK9w5ES/K1KrocSGkm21OGsEcsWg7kGb2kN
 QSaISWtyqZnxIalBSv3nsDHbtfMhCjLLwHKtmqSi5v2/6pdPJOzeZ3YJX1QEYAKO
 MlUvnOJej0p9C79oeWL2UPburWZVgPLzmWxwJoEuDetJ2mnj/o3ckHRQM2RRwcq3
 rFxgqqN2Bnky4cO7cIdg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3x9emwg06j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Apr 2024 16:49:24 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E9B444002D;
 Fri,  5 Apr 2024 16:49:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5C1AA21A206;
 Fri,  5 Apr 2024 16:48:55 +0200 (CEST)
Received: from [10.252.15.227] (10.252.15.227) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 5 Apr
 2024 16:48:54 +0200
Message-ID: <23462ab6-5340-465f-9d89-7fb7bb171677@foss.st.com>
Date: Fri, 5 Apr 2024 16:48:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240309021831.264018-1-marex@denx.de>
 <20240309021831.264018-6-marex@denx.de>
 <0094c033-ee7e-4851-9663-1ddc337dd569@foss.st.com>
 <DU2PR10MB7787CA6908915F4CA14629A98F2A2@DU2PR10MB7787.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <DU2PR10MB7787CA6908915F4CA14629A98F2A2@DU2PR10MB7787.EURPRD10.PROD.OUTLOOK.COM>
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
Subject: Re: [Uboot-stm32] [PATCH 05/11] net: dwc_eth_qos: Use FIELD_PREP
 for ETH_SEL bitfield
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
>> Use FIELD_PREP to configure content of ETH_SEL bitfield in
>> SYSCFG_PMCSETR register. No functional change.
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
>>   drivers/net/dwc_eth_qos_stm32.c | 33
>> ++++++++++++++++-----------------
>>   1 file changed, 16 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/net/dwc_eth_qos_stm32.c
>> b/drivers/net/dwc_eth_qos_stm32.c index d7ec0c9be36..7545026b158
>> 100644
>> --- a/drivers/net/dwc_eth_qos_stm32.c
>> +++ b/drivers/net/dwc_eth_qos_stm32.c
>> @@ -26,6 +26,7 @@
>>   #include <reset.h>
>>   #include <syscon.h>
>>   #include <wait_bit.h>
>> +#include <linux/bitfield.h>
>>   #include <linux/delay.h>
>>
>>   #include "dwc_eth_qos.h"
>> @@ -40,9 +41,9 @@
>>   #define SYSCFG_PMCSETR_ETH_SELMII    BIT(20)
>>
>>   #define SYSCFG_PMCSETR_ETH_SEL_MASK  GENMASK(23, 21)
>> -#define SYSCFG_PMCSETR_ETH_SEL_GMII_MII      0
>> -#define SYSCFG_PMCSETR_ETH_SEL_RGMII BIT(21)
>> -#define SYSCFG_PMCSETR_ETH_SEL_RMII  BIT(23)
>> +#define SYSCFG_PMCSETR_ETH_SEL_GMII_MII      0x0
>> +#define SYSCFG_PMCSETR_ETH_SEL_RGMII 0x1
>> +#define SYSCFG_PMCSETR_ETH_SEL_RMII  0x4
>>
>>   static ulong eqos_get_tick_clk_rate_stm32(struct udevice *dev)  { @@
>> -142,35 +143,33 @@ static int eqos_probe_syscfg_stm32(struct udevice
>> *dev,
>>
>>        switch (interface_type) {
>>        case PHY_INTERFACE_MODE_MII:
>> -             value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII |
>> -                     SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
>> +             value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
>> +                                SYSCFG_PMCSETR_ETH_SEL_GMII_MII);
>> +             value |= SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
>>                log_debug("PHY_INTERFACE_MODE_MII\n");
>>                break;
>>        case PHY_INTERFACE_MODE_GMII:
>> +             value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
>> +                                SYSCFG_PMCSETR_ETH_SEL_GMII_MII);
>>                if (eth_clk_sel_reg)
>> -                     value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII |
>> -                             SYSCFG_PMCSETR_ETH_CLK_SEL;
>> -             else
>> -                     value = SYSCFG_PMCSETR_ETH_SEL_GMII_MII;
>> +                     value |= SYSCFG_PMCSETR_ETH_CLK_SEL;
>>                log_debug("PHY_INTERFACE_MODE_GMII\n");
>>                break;
>>        case PHY_INTERFACE_MODE_RMII:
>> +             value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
>> +                                SYSCFG_PMCSETR_ETH_SEL_RMII);
>>                if (eth_ref_clk_sel_reg)
>> -                     value = SYSCFG_PMCSETR_ETH_SEL_RMII |
>> -                             SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
>> -             else
>> -                     value = SYSCFG_PMCSETR_ETH_SEL_RMII;
>> +                     value |= SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
>>                log_debug("PHY_INTERFACE_MODE_RMII\n");
>>                break;
>>        case PHY_INTERFACE_MODE_RGMII:
>>        case PHY_INTERFACE_MODE_RGMII_ID:
>>        case PHY_INTERFACE_MODE_RGMII_RXID:
>>        case PHY_INTERFACE_MODE_RGMII_TXID:
>> +             value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
>> +                                SYSCFG_PMCSETR_ETH_SEL_RGMII);
>>                if (eth_clk_sel_reg)
>> -                     value = SYSCFG_PMCSETR_ETH_SEL_RGMII |
>> -                             SYSCFG_PMCSETR_ETH_CLK_SEL;
>> -             else
>> -                     value = SYSCFG_PMCSETR_ETH_SEL_RGMII;
>> +                     value |= SYSCFG_PMCSETR_ETH_CLK_SEL;
>>                log_debug("PHY_INTERFACE_MODE_RGMII\n");
>>                break;
>>        default:
> Reviewed-by: Christophe ROULLIER <christophe.roullier@foss.st.com>
>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
