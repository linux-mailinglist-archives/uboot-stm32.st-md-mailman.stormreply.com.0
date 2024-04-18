Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4BA8A98B1
	for <lists+uboot-stm32@lfdr.de>; Thu, 18 Apr 2024 13:37:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EDEEC6C859;
	Thu, 18 Apr 2024 11:37:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8B30C6C858
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Apr 2024 11:37:07 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43I8PVqn003547; Thu, 18 Apr 2024 13:36:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=T9Xy++EDkrpGlumYwWKrlCKcflA9eP98m/tWk1nZ12w=; b=jA
 lmOhJ4EEW25wJ+FmOk/tI0XBhh8Aa2pR2FHHNFoQ4VdGJ6rkSrbLkS+EU40REs35
 mqTs0ukMatlN+0+4wEhlL+mZ5cG4vvgIzzISVIjOmt5yZSdRaCVjyyF6ZmNK5S9f
 /u5Zx0MmQTTCsRXwJzR9F6+o1hkuLjd3U77gswu6WGVo1aXLxaqtXNZq4Q58Kc+N
 X/YYcn1oxIRRP9xBZoKBYfaSoylRhBQAc/NX/HxRuby/bzitmtdjXnAS2hid/Sb4
 wsFeg8X1BKkqJ4AiI3LxHkr8P80JsqdJTrTORLJ2BwZzaUstXmEAiiVyfsE7cDOa
 D305UVJMtV29OgGf3yUA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xff64ptpn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Apr 2024 13:36:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 866DB40044;
 Thu, 18 Apr 2024 13:36:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D6A2B20C91F;
 Thu, 18 Apr 2024 13:36:17 +0200 (CEST)
Received: from [10.48.86.98] (10.48.86.98) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 18 Apr
 2024 13:36:17 +0200
Message-ID: <4d62ace1-1805-42a6-877d-90baa8c462e7@foss.st.com>
Date: Thu, 18 Apr 2024 13:36:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>, Tom Rini <trini@konsulko.com>
References: <20240326120745.27581-1-marex@denx.de>
 <c0756783-64a7-4a01-a7d9-c24c5489615b@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <c0756783-64a7-4a01-a7d9-c24c5489615b@denx.de>
X-Originating-IP: [10.48.86.98]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-18_10,2024-04-17_01,2023-05-22_02
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Joe Hershberger <joe.hershberger@ni.com>, Ramon Fried <rfried.dev@gmail.com>,
 Christophe Roullier <christophe.roullier@st.com>, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH v2 00/11] net: dwc_eth_qos: Clean up STM32
 glue code and add STM32MP13xx support
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



On 4/17/24 18:47, Marek Vasut wrote:
> On 3/26/24 1:07 PM, Marek Vasut wrote:
>> Split off STM32 glue code from the DWMAC driver into separate
>> file, similar to what other SoCs already do, to avoid mixing
>> the ST specifics with generic DWMAC core code.
>>
>> Clean the STM32 DWMAC board code which is currently duplicated
>> in multiple board files, move it into the newly separated glue
>> code, since the code is not board specific, it is only generic
>> DT parsing and generic register programming.
>>
>> Add STM32MP13xx support based on ST downstream patches on top,
>> although that part is mostly rewritten from scratch.
> 
> Can either of you, Patrice/Patrick, pick this series via ST tree and create a MR for Tom (possibly including the other long outstanding patches too) ?
> 
> Thanks

Hi Marek

STM32 pull request will be done tomorrow.

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
