Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CA39E4D39
	for <lists+uboot-stm32@lfdr.de>; Thu,  5 Dec 2024 06:18:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63B65C71292;
	Thu,  5 Dec 2024 05:18:12 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82563C5E2D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Dec 2024 05:18:05 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Y3jMZ4zX5z9sc4;
 Thu,  5 Dec 2024 06:18:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1733375882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bY7vdKxyhZsW1+hN2ll1c0YxSBMcNNid5VeD+ZgHO94=;
 b=cEfJhbv0kBtjDQNLc5fyLw9Fjw2V+yxEwQiolux8fFX7aqmzmjDPexbYdKlU2IZXLKrQj/
 NE1zN/gUsF1Y4j+BehehZ2Ooj6ARyPf4fyW+cZIcWuUo/lRzLdSHtVqbMROf1bHPRtpEIs
 lD8QP7wC9wlVtcjWw3n9NYTVOmGed1yOiGjkYEshS1K+h2Wl7mvTxHk8L7DkHNkVsWP8WE
 ubNr4HyyCg5otd7Unn8gUZcc0ZqvqcRNZUi/5KoRosGGIZjOliPpLQsr2f+I9c2vDWlL4A
 hk+91AjYG4wUcTwpnjUTraDw4Gn+aXsKezx9mpA5DV3wvlCcqwawlHTJA98Huw==
Message-ID: <da31b3ec-29cb-4f91-818e-90ed7ba8e8ab@mailbox.org>
Date: Thu, 5 Dec 2024 06:17:58 +0100
MIME-Version: 1.0
To: "Abbarapu, Venkatesh" <venkatesh.abbarapu@amd.com>,
 Jon Humphreys <j-humphreys@ti.com>, "Simek, Michal" <michal.simek@amd.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Tom Rini <trini@konsulko.com>
References: <20241022210633.271534-1-marek.vasut+renesas@mailbox.org>
 <b9cb3ec8-b6f2-4f38-8cda-d3d10278f503@amd.com>
 <e9929e0c-aa43-428f-8bf7-7b4cdef0e9c3@mailbox.org>
 <86v7x05fyd.fsf@udb0321960.dhcp.ti.com>
 <edcec18f-75a0-44d8-907a-f042779ca6ee@mailbox.org>
 <86ses458k3.fsf@udb0321960.dhcp.ti.com>
 <f7bb335d-681a-4b60-92f6-b605cc6f477f@mailbox.org>
 <86pln759j9.fsf@udb0321960.dhcp.ti.com>
 <33e99705-77e3-4acf-95f7-fad65f60ae62@mailbox.org>
 <86ldxp6ehf.fsf@udb0321960.dhcp.ti.com>
 <865xny69y1.fsf@udb0321960.dhcp.ti.com>
 <SA1PR12MB86974AC7EFCCBD7AE99FDD3E98302@SA1PR12MB8697.namprd12.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <SA1PR12MB86974AC7EFCCBD7AE99FDD3E98302@SA1PR12MB8697.namprd12.prod.outlook.com>
X-MBO-RS-ID: 7bd97f1924683fe9a1c
X-MBO-RS-META: iiawdtspeog3sjwdo98iy6bficg3n717
Cc: Michael Walle <mwalle@kernel.org>, Andre Przywara <andre.przywara@arm.com>,
 Simon Glass <sjg@chromium.org>, Ashok Reddy Soma <ashok.reddy.soma@amd.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, Pratyush Yadav <p.yadav@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [Uboot-stm32] [PATCH 1/6] Revert "spi: zynq_qspi: Add parallel
 memories support in QSPI driver"
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

On 12/5/24 5:27 AM, Abbarapu, Venkatesh wrote:
[...]

>>>> So there is still something broken in that specific commit that I
>>>> missed when removing the defects ? Sigh ... can you try to narrow it down ?
>>>
>>> Hi Marek, I tried to narrow the changes in commit
>>> 5d40b3d384dc536ec26ce9b76b20b0b84749d2d1 a bit by first applying all
>>> of the changes in the .h files, and then for spi-nor-core.c, only
>>> applying changes per function. The only function change that causes
>>> errors was spi_nor_read(). With the changes in spi_nor_read() in
>>> commit
>>> 5d40b3d384dc536ec26ce9b76b20b0b84749d2d1 applied to the prior commit
>>> fbe16bc2801, did I get:
>>>
>>> => sf probe && sf update ${loadaddr} 0x400000 0x10
>>> SF: Detected s28hs512t with page size 256 Bytes, erase size 256 KiB,
>>> total 64 MiB device 0 offset 0x400000, size 0x10 SPI flash failed in
>>> read step
>>>
>>
>> Hi all.  What is the status of addressing the failures introduced by this patchset?  I
>> tried building from u-boot next and still see the failure.
>>
>> Marek, was the isolation of changes I performed above helpful in understanding the
>> failure?
>>
> 
> Can you try by applying this change https://lore.kernel.org/u-boot/20241118090544.21956-1-venkatesh.abbarapu@amd.com/
Can you please CC me on SPI NOR patches related to this stacked/parallel 
breakage ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
