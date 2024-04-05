Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7774C89C76D
	for <lists+uboot-stm32@lfdr.de>; Mon,  8 Apr 2024 16:48:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8D70C71298;
	Mon,  8 Apr 2024 14:48:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3859DC6C83C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Apr 2024 14:51:07 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 435EhSGV021122; Fri, 5 Apr 2024 16:50:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:references:cc:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=svKHz35YTytAV9cxzpnIuBFmI7mTc59mc8paEmiSiTY=; b=pj
 v+l3igaDdJpLe06SFfuEjHFEHQxiy7i22HAJVYjGUr7HkFu8Me3LepzMGI+g6Pxh
 p7dWKa5xP0dZNilXcp0yQYxcjTtgQk9FoY5eqoQAxzt6ge4TN3bmn09eJyMOcERd
 C5ZCKZ3Fehx+nHGRFnW9qZ0S6jeNxT/QU2jTyL57J13hc473oE3R7pPL1K5bL5JD
 Y41QO3wg8bL767xUrKk/fndQ7e371SDxzgKfHz63fwO44xYqxEo3gbsrWxcn8ABu
 B8gSEiLDZiCfR+hFiJakpcNhb2egIq1zmgDFxCgtMn5GqETn7nm1OW7vPgceKFTy
 f7grfBvZEfBwRoLLVaPQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3x9emng8f2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Apr 2024 16:50:54 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DC4364002D;
 Fri,  5 Apr 2024 16:50:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4A2CA2165FF;
 Fri,  5 Apr 2024 16:50:24 +0200 (CEST)
Received: from [10.252.15.227] (10.252.15.227) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 5 Apr
 2024 16:50:23 +0200
Message-ID: <e12a5ba9-77f7-42d0-a27e-7a7efbb474c5@foss.st.com>
Date: Fri, 5 Apr 2024 16:50:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20240309021831.264018-1-marex@denx.de>
 <20240309021831.264018-7-marex@denx.de>
 <a8b9ef7d-dd02-440c-a908-a9a3dc197329@foss.st.com>
 <DU2PR10MB7787B2068B63105DD92745108F2A2@DU2PR10MB7787.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <DU2PR10MB7787B2068B63105DD92745108F2A2@DU2PR10MB7787.EURPRD10.PROD.OUTLOOK.COM>
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
Subject: Re: [Uboot-stm32] [PATCH 06/11] net: dwc_eth_qos: Move log_debug
 statements on top of case block
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
>> Move the log_debug() calls on top of the bit manipulation code.
>> No functional change.
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
>>   drivers/net/dwc_eth_qos_stm32.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/net/dwc_eth_qos_stm32.c
>> b/drivers/net/dwc_eth_qos_stm32.c index 7545026b158..38037c47954
>> 100644
>> --- a/drivers/net/dwc_eth_qos_stm32.c
>> +++ b/drivers/net/dwc_eth_qos_stm32.c
>> @@ -143,34 +143,34 @@ static int eqos_probe_syscfg_stm32(struct
>> udevice *dev,
>>
>>        switch (interface_type) {
>>        case PHY_INTERFACE_MODE_MII:
>> +             log_debug("PHY_INTERFACE_MODE_MII\n");
>>                value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
>>                                   SYSCFG_PMCSETR_ETH_SEL_GMII_MII);
>>                value |= SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
>> -             log_debug("PHY_INTERFACE_MODE_MII\n");
>>                break;
>>        case PHY_INTERFACE_MODE_GMII:
>> +             log_debug("PHY_INTERFACE_MODE_GMII\n");
>>                value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
>>                                   SYSCFG_PMCSETR_ETH_SEL_GMII_MII);
>>                if (eth_clk_sel_reg)
>>                        value |= SYSCFG_PMCSETR_ETH_CLK_SEL;
>> -             log_debug("PHY_INTERFACE_MODE_GMII\n");
>>                break;
>>        case PHY_INTERFACE_MODE_RMII:
>> +             log_debug("PHY_INTERFACE_MODE_RMII\n");
>>                value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
>>                                   SYSCFG_PMCSETR_ETH_SEL_RMII);
>>                if (eth_ref_clk_sel_reg)
>>                        value |= SYSCFG_PMCSETR_ETH_REF_CLK_SEL;
>> -             log_debug("PHY_INTERFACE_MODE_RMII\n");
>>                break;
>>        case PHY_INTERFACE_MODE_RGMII:
>>        case PHY_INTERFACE_MODE_RGMII_ID:
>>        case PHY_INTERFACE_MODE_RGMII_RXID:
>>        case PHY_INTERFACE_MODE_RGMII_TXID:
>> +             log_debug("PHY_INTERFACE_MODE_RGMII\n");
>>                value = FIELD_PREP(SYSCFG_PMCSETR_ETH_SEL_MASK,
>>                                   SYSCFG_PMCSETR_ETH_SEL_RGMII);
>>                if (eth_clk_sel_reg)
>>                        value |= SYSCFG_PMCSETR_ETH_CLK_SEL;
>> -             log_debug("PHY_INTERFACE_MODE_RGMII\n");
>>                break;
>>        default:
>>                log_debug("Do not manage %d interface\n",
> Reviewed-by: Christophe ROULLIER <christophe.roullier@foss.st.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
