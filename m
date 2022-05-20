Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 243A652E672
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 May 2022 09:44:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7293C03FEB;
	Fri, 20 May 2022 07:44:22 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33863C035BF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 07:44:21 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5974C82107;
 Fri, 20 May 2022 09:44:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1653032660;
 bh=iYH/ldXzEEnbAUndOWEySt+MXGlAStSNK8AvrxOlVLc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IISKOtSiOM0FjY+0LTPRnwbIuLk2W9xvbdPrIOkpPZjdj6bN5ruLr07zR83mFE8+a
 MLXEr5lQezIjWpqYc7/766unob+tNWjhFrIVjOXy/2BtEOtIsJ4que3XPcK355uINU
 5+p6qz58VFagPU6JM8DYJuDrx1kwMxAa/L1DjecYMACbczzK4K+Vz1T0JFdUNvZ+Tr
 SpxINpoflC9hL63F5A5lxkEc8M1aHKNFjDncnsHhIP+VcxgewnDnY3hUeu7DNAY8SP
 e1pObzOK5ru/VUAitkMo7dhLyPxdzaNn23sK1z+UBZ08rYiJDbZyCgCvSXy9t1AJbj
 Dje3BlgvEb3Kg==
Message-ID: <0e54156a-acb3-c885-9c86-ffe59a51be50@denx.de>
Date: Fri, 20 May 2022 09:44:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrice CHOTARD <patrice.chotard@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20220506140624.445542-1-patrick.delaunay@foss.st.com>
 <20220506160540.8.I48a2a2211b9cf24a69030c1499ddeb0a507025d2@changeid>
 <a332541a-2a1f-995e-adb9-3c6f54759be7@foss.st.com>
 <032a9492-c339-d6ca-2b36-312feaba6c14@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <032a9492-c339-d6ca-2b36-312feaba6c14@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 08/16] arm: stm32mp: add support of
 STM32MP13x
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

On 5/20/22 09:24, Patrice CHOTARD wrote:

[...]

>>> @@ -0,0 +1,17 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause */
>>> +/*
>>> + * Copyright (C) 2022, STMicroelectronics - All Rights Reserved
>>> + *
>>> + * Configuration settings for the STMicroelectonics STM32MP15x boards
> 
> s/STMicroelectonics/STMicroelectronics

s@STM32MP15x@STM32MP13x@ too ;-)

[...]

btw. as a general comment, please do use these [...] to reduce the patch 
content you comment on. Searching for that one line in a wall of quoted 
text can be not fun.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
