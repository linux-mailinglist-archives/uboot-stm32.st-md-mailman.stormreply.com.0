Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0E379A715
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Sep 2023 11:57:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9E9BC6B46F;
	Mon, 11 Sep 2023 09:57:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5F49C6B46E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Sep 2023 09:57:29 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38B9SuqE029022; Mon, 11 Sep 2023 11:57:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=QhbOHpzAyibvgdaN7SMZXLNFdDp41JdiQ3I2iFtx48M=; b=X+
 zhpHDo3yCDkTd1dvwXoomO/tSK+tE9/uqGa1HArdE8I1Ege54SX0Dbu1TCgkdGIB
 pnnrmY11GkoVsPbIETT2N+V9c2x5MKe+Nhi3WvvE974J95+Y54kikZzkxkzDeIz3
 Nk3oBdq7fAc6ltsB2HKFfMS3EdjBVJ2ojfV3hALAG/hAr+9V3AZ+Uba/Er1Ihpo7
 Tmz7bIv3jZR4wv1vyi1vAfwkLmXBpf4pBGn14LoVjDRAiclkL2oUnGyi16bj8CCE
 HK3tbCfpcrM3hwQ6907ku+XHBSMMCB6Sa5fNtwaH6P7BPmdvKI4Qdrm+og9H+zoE
 vK8o1+FTlwK4nm512gsg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t0e4fqmhq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Sep 2023 11:57:28 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A3EC610005A;
 Mon, 11 Sep 2023 11:57:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9B73723B3C6;
 Mon, 11 Sep 2023 11:57:27 +0200 (CEST)
Received: from [10.201.20.32] (10.201.20.32) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 11:57:27 +0200
Message-ID: <00166d4f-163b-0d15-0d67-4dd0a274258b@foss.st.com>
Date: Mon, 11 Sep 2023 11:57:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Heinrich Schuchardt <xypron.glpk@gmx.de>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>, <u-boot@lists.denx.de>,
 <uboot-stm32@st-md-mailman.stormreply.com>
References: <20230907162200.205602-1-gatien.chevallier@foss.st.com>
 <ZP7PeFpJzneU2h9k@nx64de-df6d00>
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <ZP7PeFpJzneU2h9k@nx64de-df6d00>
X-Originating-IP: [10.201.20.32]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_06,2023-09-05_01,2023-05-22_02
Subject: Re: [Uboot-stm32] [PATCH 1/7] rng: stm32: rename STM32 RNG driver
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

On 9/11/23 10:27, Grzegorz Szymaszek wrote:
> Hi,
> 
> On Thu, Sep 07, 2023 at 06:21:54PM +0200, Gatien Chevallier wrote:
>> diff --git a/drivers/rng/Kconfig b/drivers/rng/Kconfig
>> -%<-
>> -config RNG_STM32MP1
>> -	bool "Enable random number generator for STM32MP1"
>> +config RNG_STM32
>> +	bool "Enable random number generator for STM32"
>>   	depends on ARCH_STM32MP
> 
> Shouldn't the "depends on" be updated as well?
> ("depends on ARCH_STM32 || ARCH_STM32MP", like in STM32_RESET.)
> 
Hi Grzegorz,

I agree, this could be used for MCUs so I'll add ARCH_STM32.

Heinrich, Patrick, can I keep your tag while adding this?

Best regards,
Gatien
> 
> All the best
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
