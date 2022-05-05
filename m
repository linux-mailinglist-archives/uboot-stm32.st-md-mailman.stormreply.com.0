Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4599151C5BE
	for <lists+uboot-stm32@lfdr.de>; Thu,  5 May 2022 19:07:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC884C6047D;
	Thu,  5 May 2022 17:07:22 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46F51C5E2CC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 May 2022 17:07:21 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7C26C83B19;
 Thu,  5 May 2022 19:07:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1651770440;
 bh=3jQYB1/Y4AgG+CnTrowYa5SxwbErMBI1XxKNxwfpERU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=h/lyRNw+L31ot+HvxhXMUwxhuzZIi455eH9F9ftw3YKfRJBsYCqRf0ChqvUwzJcSa
 yO4v6Cpe0PXU1Aotg/kDg5VcxQYDzIaTRs/w8SFDH5Z55o+lCvc0rsBfRCTQDyFJRj
 T6hIgLBrb4wZ4OMDOFPgM6feQ897kt+vH3YniGuh9pp8cYtBRS/ruMqrYyLoGUT1WV
 PWcoy1xC7tlBYpDdXH2IKJRO9KN7Qx0VPkoaST5lD7DlWveU5FecxE/NpsS+Q56tJ5
 4J+62l7Kfe3FCdXv3pMtVARtrSdlAXSsFOs/ir/vXQYmZrHAJGD2O6UxPB74bf0Ydc
 wMH/FuG4IU34A==
Message-ID: <7b1da392-e3f6-ab2b-0875-9aa64e383035@denx.de>
Date: Thu, 5 May 2022 19:07:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20220505151756.1.Ia5711b14a17cf1d042bdab9d3f28437d5c53272c@changeid>
 <20220505151756.2.Ic4641ddc829feecc12b775615bd175f3f35c3ea9@changeid>
 <3a7461a5-9796-8424-07d6-688e37bfa36f@denx.de>
 <2b6917f2-6294-d12a-9229-78b247dac3d2@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <2b6917f2-6294-d12a-9229-78b247dac3d2@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] usb: host: ehci-generic: Remove
	DM_REGULATOR flag
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

On 5/5/22 16:58, Patrice CHOTARD wrote:
> HI Marek
> 
> On 5/5/22 15:45, Marek Vasut wrote:
>> On 5/5/22 15:17, Patrice Chotard wrote:
>>> Currently, DM_REGULATOR flag is no more needed to protect no DM core,
>>> remove it.
>>
>> DM_REGULATOR flag is actually Kconfig symbol.
>>
>> Why is it no longer needed ? (answer should be in the commit message)
> 
> Ok, i will update the commit message as following :
> 
> Since commit 16cc5ad0b439 ("power: regulator: add dummy helper")
> regulator dummy helper are always available even if DM_REGULATOR
> is not set.
> DM_REGULATOR flag is no more needed to protect no DM core,
> remove it.
> 
> Is it OK for you ?

Yes please
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
