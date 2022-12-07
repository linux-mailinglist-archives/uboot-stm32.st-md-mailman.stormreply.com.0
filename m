Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF4D645DFD
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Dec 2022 16:51:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5734C6411C;
	Wed,  7 Dec 2022 15:51:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A106EC01E99
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Dec 2022 15:51:42 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B7DIvNt030765; Wed, 7 Dec 2022 16:51:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=RrrP1VuJn3BxR3tyAwNhzI3dXu9S81wMLsl+MHK0Bvw=;
 b=bHIbyjTYrV4pnbgH7zEcdPG5JMSrbyJGpMlVReowgfBntYKzwmqZjl+U0d/r62VHAbzX
 pckuQ6oH9MJldudoumU9jrAJ5dKW4gfFqfwiY13N06tKO7zFUbzuClvD5AAaiBaUio7m
 JR0oWFU/8u5uFl+TWcsBYImicUCmI3c+IfaEjc2c/wlCAihoGUjoVnj2XhYYo9zVE1Px
 D4osyoEG62ESILfHZuXIE2JUNHSIVI25OFZGlm2tXU+G3EIAJFKWiRVxUzafzicSw3sH
 uFrP9Iesr/lLau34ovFcE5KZ+KWYpy7fhGmfAdajNUIEYDN9yMn+i0uCqB985YaCIsbh 9Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3m7xp78txm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 16:51:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7820A10002A;
 Wed,  7 Dec 2022 16:51:36 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 710EE23BDFB;
 Wed,  7 Dec 2022 16:51:36 +0100 (CET)
Received: from [10.201.20.130] (10.201.20.130) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 7 Dec
 2022 16:51:35 +0100
Message-ID: <6cad5f3a-3eb9-2fd4-f4ab-6df5d911e554@foss.st.com>
Date: Wed, 7 Dec 2022 16:51:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>, <u-boot@lists.denx.de>
References: <20221124103605.298002-1-gabriel.fernandez@foss.st.com>
 <20221124103605.298002-3-gabriel.fernandez@foss.st.com>
 <b1570bd3-fb4c-1eec-3bc4-0128a314159a@foss.st.com>
In-Reply-To: <b1570bd3-fb4c-1eec-3bc4-0128a314159a@foss.st.com>
X-Originating-IP: [10.201.20.130]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_08,2022-12-07_01,2022-06-22_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v4 2/3] clk: stm32mp13: introduce
	STM32MP13 RCC driver
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



On 12/7/22 16:46, Patrice CHOTARD wrote:
> 
> 
> On 11/24/22 11:36, Gabriel Fernandez wrote:
>> STM32MP13 RCC driver uses Common Clock Framework and also a
>> 'clk-stm32-core' API. Then STM32MPx RCC driver will contain only data
>> configuration (gates, mux, dividers and the way to check security)
>> or some specific clocks.
>> This API will be used by all new other generations of ST Socs.
>>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Reviewed-by: Sean Anderson <seanga2@gmail.com>
>> Tested-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>>
>> ---
>>
>> (no changes since v3)
>>
>> Changes in v3:
>> - fix cosmetic
>> - add comments in commit message
>> - explanation of stm32 clock gating
>>
>> Changes in v2:
>> - deference check_security() call back
>> - use of ccf_clk_(enable/disable/get_rate/set_rate) ops
>> - fix gate refcounting
>> - documented structures in clock-core API
>> - remove useless spinlocks
>> - cosmetic changes
>> - remove useless defines
>>
>>  drivers/clk/stm32/Kconfig          |  15 +
>>  drivers/clk/stm32/Makefile         |   2 +
>>  drivers/clk/stm32/clk-stm32-core.c | 268 +++++++++
>>  drivers/clk/stm32/clk-stm32-core.h | 276 ++++++++++
>>  drivers/clk/stm32/clk-stm32mp13.c  | 841 +++++++++++++++++++++++++++++
>>  drivers/clk/stm32/stm32mp13_rcc.h  | 288 ++++++++++
>>  6 files changed, 1690 insertions(+)
>>  create mode 100644 drivers/clk/stm32/clk-stm32-core.c
>>  create mode 100644 drivers/clk/stm32/clk-stm32-core.h
>>  create mode 100644 drivers/clk/stm32/clk-stm32mp13.c
>>  create mode 100644 drivers/clk/stm32/stm32mp13_rcc.h
>>
> 
> [...]
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Thanks 
> Patrice
Applied to u-boot-stm/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
