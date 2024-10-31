Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 851949B7BE2
	for <lists+uboot-stm32@lfdr.de>; Thu, 31 Oct 2024 14:41:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4659EC78035;
	Thu, 31 Oct 2024 13:41:21 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94C21C78034
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2024 13:41:13 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4XfQBK0PyDz9spH;
 Thu, 31 Oct 2024 14:41:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1730382073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DQP/2d4DbxegMQsNXvhyDTBHO2qBpqq8A+TI/3bq6lw=;
 b=qqVb4mKFm+wQqBAuE+MsfjY0tsL4j2uuVcjm0gh+4qOMdfaQMipQiP+zjNu2glOTYlz76l
 Yjpc0XHbvRRWUVB8OOmvEqKMSyV91iQKWggh7qtIS10FcSuCpcT6PaALJUzPbyXANEFlO0
 MMBVILd+MXfLE1HK/ouV4DIZKjCuPqGB7NBLiR4tl7pdosT8+aBYKm0r0OPcH3J4wUBJQQ
 acgS/7wabd/JxxUmfp4u/tZvQWOtkvs+T3f5bx9FfuA23uit0WWtFM32h7eerwEewJ0sKz
 j7sIM2h4pzwD1jWErQ+84/nFQzY/x0kG4ah0hruyT1ygM3pBQWU7ke2aejm4/w==
Message-ID: <44b1aa55-eaac-40fc-8924-b157314f39a1@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1730382070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DQP/2d4DbxegMQsNXvhyDTBHO2qBpqq8A+TI/3bq6lw=;
 b=HHP6mb/xUWFeJ52Ni3d9o2kOT4gR8G/EZ2Cepdz40fnn/79QPxbBrRWMjjCAwYkMcJNeOn
 Lqt7KWWbS0p8pa9DA7lu0ef6nnruNkLZuMt/Sa3AvRkrmHsIgApg/8hCInrsGS5JtyLxcz
 rPDaxcnN3wZUOOEXMYld9j92A8BgvsJzwO5YPc4OJmwHDwI0AhaKb3skGwu2Bzcf2+YByP
 Yrq6U29jJ1PkS/h1HOKy6c2g5yu26fZr2OVjW5vK163v8jIwZp9x6UjkJU9sNbRLlYBEZ+
 aXlWPgply8LnDm3fvjbKR64N7lspFW/MUgCjnEiQOypGHz7Ont3ceyslvaHWYg==
Date: Thu, 31 Oct 2024 14:41:06 +0100
MIME-Version: 1.0
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Michal Simek <michal.simek@amd.com>, Jagan Teki <jagan@amarulasolutions.com>
References: <20241026201741.171073-1-marek.vasut+renesas@mailbox.org>
 <CAMty3ZB3ngMezv9S2XrNjXL69q+z9x-=qnQGga51FgTfA4fanQ@mail.gmail.com>
 <19fc4486-f8fe-4286-8941-76ff2a81b7d9@linaro.org>
 <CAMty3ZAJrKvUAxWg9CfKtyrjw+WnHOgwkfAJb+N-7d3NyXUrxA@mail.gmail.com>
 <f797cb27-84ca-41c3-83a5-b9044f2d5e5c@linaro.org>
 <3835b139-ae37-423e-8a24-a958ece69c0d@amd.com>
 <f5e21529-00ce-4eb1-b606-e300cd4d6e74@linaro.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <f5e21529-00ce-4eb1-b606-e300cd4d6e74@linaro.org>
X-MBO-RS-ID: af0d677400956e5f00e
X-MBO-RS-META: nu55drjxm1tm16x5nyxefg31au9f55pt
X-Rspamd-Queue-Id: 4XfQBK0PyDz9spH
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Michael Walle <mwalle@kernel.org>, Andre Przywara <andre.przywara@arm.com>,
 Simon Glass <sjg@chromium.org>, Ashok Reddy Soma <ashok.reddy.soma@amd.com>,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, Pratyush Yadav <p.yadav@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [Uboot-stm32] [PATCH 1/9] mtd: spi-nor: Remove recently added
 nor->addr_width == 3 test
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

On 10/31/24 7:56 AM, Tudor Ambarus wrote:
> Hi, Michal,

Hi,

> On 10/30/24 3:20 PM, Michal Simek wrote:
>> Jagan is aware that we are using this configuration for quite a long
>> time and we are still here and not leaving.
> 
> Okay, great. Would be good if you/your team can allocate time and
> review/test patches that are improving/fixing the stacked/parallel bits.
> Help in reviewing other SPI NOR bits is appreciated as well.
It seems that over the years , there are no other users of this 
"stacked/parallel" functionality but Xilinx ?

Also, how does that work if one SPI NOR suffers a command failure while 
the other SPI NOR succeeds to execute the command ? Is that somehow 
handled, or is there an assumption that both SPI NORs behave the same 
way and can never fail independently (which seems like a dangerous 
assumption to make) ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
