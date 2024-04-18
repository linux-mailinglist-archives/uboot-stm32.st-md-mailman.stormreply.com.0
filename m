Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B81768A9A6C
	for <lists+uboot-stm32@lfdr.de>; Thu, 18 Apr 2024 14:53:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62E86C6DD66;
	Thu, 18 Apr 2024 12:53:13 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA6CDC6A61D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Apr 2024 12:53:12 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6A25F8831A;
 Thu, 18 Apr 2024 14:53:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1713444792;
 bh=nBl8alm7NtuafvWzUMK6D08c16Hrs7MndhsVxSqEdz4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=L3JXuYELO/u029NyiHC+hG97GV1Kq9hofaeX/xX0xgN7AsO9zMOS+lXrBhnIVxRbE
 bRm7WGIg0qVBrS6qpV5xWGduhBV/iu2RqFWMWb+cyrLX7PJFtdtsekvPH5sRfbFcVi
 7h4GVq99FNY7oTojVbJB4oNfRItUg19nUoI2DkyuKy1Z3/ag42sxSRcMUf9mwd7ziM
 NfrIn51RPnswxxLCSHxh7wQ7/m0+BAzJvlkl07O2tiC56NbQe/zStZiZmVCOmMpzi1
 nab73W9dcAX0VjzoAofQyb20pjNYULeC075C7r5Q4weEEU9KeM/j1/Q4hDMnu4EsjF
 7OdaeAqqSWbQQ==
Message-ID: <34b12a6f-5159-4ca5-aaa2-45973fea0bb6@denx.de>
Date: Thu, 18 Apr 2024 14:03:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, u-boot@lists.denx.de,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>
References: <20240326120745.27581-1-marex@denx.de>
 <c0756783-64a7-4a01-a7d9-c24c5489615b@denx.de>
 <4d62ace1-1805-42a6-877d-90baa8c462e7@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <4d62ace1-1805-42a6-877d-90baa8c462e7@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 4/18/24 1:36 PM, Patrice CHOTARD wrote:
> 
> 
> On 4/17/24 18:47, Marek Vasut wrote:
>> On 3/26/24 1:07 PM, Marek Vasut wrote:
>>> Split off STM32 glue code from the DWMAC driver into separate
>>> file, similar to what other SoCs already do, to avoid mixing
>>> the ST specifics with generic DWMAC core code.
>>>
>>> Clean the STM32 DWMAC board code which is currently duplicated
>>> in multiple board files, move it into the newly separated glue
>>> code, since the code is not board specific, it is only generic
>>> DT parsing and generic register programming.
>>>
>>> Add STM32MP13xx support based on ST downstream patches on top,
>>> although that part is mostly rewritten from scratch.
>>
>> Can either of you, Patrice/Patrick, pick this series via ST tree and create a MR for Tom (possibly including the other long outstanding patches too) ?
>>
>> Thanks
> 
> Hi Marek
> 
> STM32 pull request will be done tomorrow.

Thank you
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
