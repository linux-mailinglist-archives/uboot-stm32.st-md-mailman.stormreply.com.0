Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2444A8B0B15
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Apr 2024 15:37:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5DECC7128C;
	Wed, 24 Apr 2024 13:37:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B8C3C7128B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Apr 2024 13:37:26 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43OCE9Nj004066;
 Wed, 24 Apr 2024 15:37:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=kIyAcFRXq8ug/cyFLxav8q0LyDP334VdLuUEZiCkf4Q=; b=Bt
 ohNmEEPRojhGn8DAQ6SKJZTiJ0951iy5Ujq6/3XfRyhOR36ckb71Q03D4zewQ9ew
 c84Nmxuw06tM2CqGVFLHbQn5iAeQ+UDS6uuIV8FnDyWAOY2tknjlIQcAoIv6RIc0
 MUIJfyw/FEccEfkDlMs4i7udTEntC6iJw2s5eVhWp8EPzrW07BNp88TILC8xnLRj
 ae+vCbzb5Ra3w9l3maQCxLlTtnPVPbRt2sXn10AF7aLBgS+tKpOh6427cDnl8sNI
 6eG/OQblne4t2jx2k3tPzqcRe6kTpII30yuAxncf01EP4EivE0/5k6MYD+8apspt
 E4ASgnfZxEgGkbLl7MYA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xm4ee07w8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Apr 2024 15:37:16 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F12934002D;
 Wed, 24 Apr 2024 15:37:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E46682207BD;
 Wed, 24 Apr 2024 15:36:48 +0200 (CEST)
Received: from [10.48.86.98] (10.48.86.98) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 24 Apr
 2024 15:36:48 +0200
Message-ID: <ed05aee3-f24b-4b16-b59b-4b9f6597db44@foss.st.com>
Date: Wed, 24 Apr 2024 15:36:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>, Tom Rini
 <trini@konsulko.com>
References: <20240319024534.103299-1-marex@denx.de>
 <b8089d71-42f1-4cb7-9b5e-e3cd99e9ffa5@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <b8089d71-42f1-4cb7-9b5e-e3cd99e9ffa5@denx.de>
X-Originating-IP: [10.48.86.98]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-24_11,2024-04-24_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH 1/2] ARM: dts: stm32: add PWR regulators
 support on stm32mp131
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



On 4/21/24 22:27, Marek Vasut wrote:
> On 3/19/24 3:45 AM, Marek Vasut wrote:
>> This patch adds STM32 PWR regulators DT support on stm32mp131.
>> This requires TFA to clear RCC_SECCFGR, is disabled by default
>> and can only be enabled on board DT level.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> It seems these patches have been missed from the recent PR ?
> 
> Is there any feedback on those patches ?


Hi Marek

Yes, these patches was voluntary suspended on our side due to internal discussion.
On my side these patches are ok. They will be part on next STM32 pull request.

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
