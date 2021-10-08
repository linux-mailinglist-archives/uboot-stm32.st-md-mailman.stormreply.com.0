Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5182F4268C3
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Oct 2021 13:29:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBDB5C597B3;
	Fri,  8 Oct 2021 11:29:01 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39487C597B2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 11:28:59 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id EA54883431;
 Fri,  8 Oct 2021 13:28:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1633692539;
 bh=YUoMdP/nQbV5di4qRudyTxM9eljRugGBcqT3v8jRbyA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=MSZrGRYaCqWPEZzmnuKQOAmnoRsqDz8/dS5efwBi0ZPA3kVemhswCh7PBxzlyZvBi
 MXk6h33fYtYfDJsPrY4u4xsUVLS5Jmak25I+nPPsVwd4p4b5Htoe74HLJZZaINX6QE
 cozaNyP5+6WF1bKEfiY/vFsHdA+y4xwKqHxVC3YKanrOfPFzmWNY43e9GDXt6kzPqx
 LGUYxUPbuqzCwS2rt8U4tOec/smmpoD3PVzzOjXykdNyR/76p0b2cPbr6OyAoKUq/O
 xYgi0lR5R0fi+CiUXqIDgvMNGbbNP0KBa8UdLwhe9kMQyb9oFpqQdeHVO3LqJvJG6c
 TbyDadf8Ow0Hg==
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 "Alex G." <mr.nuke.me@gmail.com>, u-boot@lists.denx.de
References: <20210909145536.2979951-1-mr.nuke.me@gmail.com>
 <f517fc64-f8e2-f722-40f0-174bf709c145@foss.st.com>
 <ccf4d20e-907f-02f4-aafc-e6c75f0932a5@gmail.com>
 <27a421f4-15f1-f164-a7d3-fe6091436478@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <89864188-72a4-ecfc-5933-896a46f40b2a@denx.de>
Date: Fri, 8 Oct 2021 13:28:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <27a421f4-15f1-f164-a7d3-fe6091436478@foss.st.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: uboot-stm32@st-md-mailman.stormreply.com, etienne.carriere@linaro.org
Subject: Re: [Uboot-stm32] [PATCH 0/3] stm32mp: Attempt to resolve
 unintended breakage with v2021.10-rc2
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

On 10/8/21 11:18 AM, Patrick DELAUNAY wrote:
> Hi Alex,

Hi,

[...]

>> Without loss of generality, any CONFIG that conflates u-boot options 
>> with SPL options is likely to cause some changes down the line.
>>
> I have a issue today with the generic part of ARM support:
> 
> 1/ the PSCI is mandatory for Linux kernel

PSCI is mandatory only on ARMv8 , NOT on ARMv7.
And the "mandatory" part is forced onto everyone not by Linux kernel, 
but by the architecture specification.

[...]
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
