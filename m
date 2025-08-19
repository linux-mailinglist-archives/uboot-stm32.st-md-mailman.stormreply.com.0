Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF682B2BF6D
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 Aug 2025 12:54:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A21ADC3F949;
	Tue, 19 Aug 2025 10:54:24 +0000 (UTC)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75A65C3F945
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 10:54:23 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4c5mg11TF4z9shq;
 Tue, 19 Aug 2025 12:54:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1755600861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l1OxigwBtGBan9cEgK9RDUy6D/LPXwLIVu1xmTgQKOY=;
 b=HKQttCPpIaCn0CMUNwu5M4EA0WGa3QcT3XVj8mPFD7VZFauZitIqFBUqncVRrKERBpyNk+
 iAIY2FLtWp9drcfaDA5YnWLHV4ok49ujHsArKYE1sXnszLagt3olsfQuAfXPO5uPUEyT2p
 8ZUrHZHksavAs9Bfz5A67lmTfFz8GtywUTWw8kQvlQnnjTClTUWyaeX6yrNacQKUatBRii
 NpxrjY4BOR03so/wPhrGSkBMK9KY8a8s7FdA7tR6UbaMxmTgYnF/57C/2dJqFzhI7qKG15
 s4LqsNNNLUSxk6zYCbAiSFslPMSGl7ts81/uAgHUcA1Y3qrfdOjwxzvwEg/hQQ==
Message-ID: <81059c20-971d-43ce-ac98-421329efe938@mailbox.org>
Date: Tue, 19 Aug 2025 12:54:18 +0200
MIME-Version: 1.0
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20250814120938.1358059-1-patrice.chotard@foss.st.com>
 <a10f97cf-72d8-4f82-870f-cb845e5cb72e@mailbox.org>
 <626aac73-10f5-4514-a6ea-0b67a7b2d45b@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <626aac73-10f5-4514-a6ea-0b67a7b2d45b@foss.st.com>
X-MBO-RS-META: tcmfwefw5cinw77st1z1wzj3dqat8nh7
X-MBO-RS-ID: e27c6d14c06c2477d7e
Cc: Tom Rini <trini@konsulko.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2] configs: stm32mp25: Enable
	OF_UPSTREAM_BUILD_VENDOR
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

On 8/14/25 5:23 PM, Patrice CHOTARD wrote:
> 
> 
> On 8/14/25 15:37, Marek Vasut wrote:
>> On 8/14/25 2:09 PM, Patrice Chotard wrote:
>>> Initially, only one STM32MP25 based board was available, the
>>> stm32mp257f-ev1 board which was set by default in stm32mp25_defconfig.
>>>
>>> Since commit 79f3e77133bd ("Subtree merge tag 'v6.16-dts' of dts repo [1] into dts/upstream")
>>> we inherited of a second MP25 based board which is the stm32mp257f-dk board.
>>>
>>> Enable OF_UPSTREAM_BUILD_VENDOR and set OF_UPSTREAM_VENDOR to allow all
>>> STMicroelectronics DT compilation.
>> If I build stm32mp25_defconfig , I can run the result on both EV1 and DK now ?
>>
> 
> With this patch yes
> 
>> It seems only the EV1 DT is built into the binary, so why compile all DTs ?
> 
> By default yes, only EV1 DT is built. that's why OF_UPSTREAM_BUILD_VENDOR is needed to
> allow all other st/*.dtb to be built.
> 
>>
>> $ grep TREE configs/stm32mp25_defconfig
>> CONFIG_DEFAULT_DEVICE_TREE="st/stm32mp257f-ev1"
>>
> 
> Currently if you try to build U-Boot for stm32mp257f-dk board using the following commands:
> 
> make stm32mp25_defconfig
> make DEVICE_TREE=st/stm32mp257f-dk

Please introduce defconfig for each board instead of this hackage .

Look at this example on how to use #include in defconfig files, it even 
supports multiple levels of config structure for deduplication purposes:

$  git grep include configs/imx*dh*
configs/imx6_dhcom_drc02_defconfig:#include <configs/dh_imx6.config>
configs/imx6_dhcom_pdk2_defconfig:#include <configs/dh_imx6.config>
configs/imx6_dhcom_picoitx_defconfig:#include <configs/dh_imx6.config>
configs/imx8mp_dhcom_drc02_defconfig:#include <configs/imx8mp_dhsom.config>
configs/imx8mp_dhcom_pdk2_defconfig:#include <configs/imx8mp_dhsom.config>
configs/imx8mp_dhcom_pdk3_defconfig:#include <configs/imx8mp_dhsom.config>
configs/imx8mp_dhcom_picoitx_defconfig:#include 
<configs/imx8mp_dhsom.config>
configs/imx8mp_dhsom.config:#include <configs/imx_dhsom.config>
configs/imx_dhsom.config:#include <configs/dhsom.config>

-- 
Best regards,
Marek Vasut
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
