Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 485649ACE75
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2024 17:18:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EECF3C71289;
	Wed, 23 Oct 2024 15:18:20 +0000 (UTC)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF9FCC71287
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 15:18:13 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4XYXjv3mLgz9t1H;
 Wed, 23 Oct 2024 17:18:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729696691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hTJI0DLbUn0OE24LoDWZAb9IiCmfF8bR38HUIcm47B4=;
 b=f0r8RTb9/i3l0Cj0KOCqg/X60rw1btB0cMqhn8ih/I1RR/+mnj7fbR+sGoYFE4Aqvan7Li
 4lCD8XdQSmKwYp5G+PpHHKdPVVmVSUCSDqSjSbEh92KATMfp+296agm/C9v8j8YJLjwfIM
 rTG4XySUhtLvHFdnC1sa200vbJWV162c19axcQ+NaRdMH3e/qVOpGC8qUYMpO4w19L6IO8
 I8Hplnpnb4oGk4D/lYUAwxBhKTsvDf3DIbZ5tkMWkO9h+vKYkEw0jTnRRKea5vF5KKB2mP
 KK7gq+BhgesKbdH/y/LOmHGbHBM4CZsz75ocPCHTZ6qWu2a9GewIvFNmrycunA==
Message-ID: <d3a6617e-4ca0-4a9c-8434-fd859c4c78d3@mailbox.org>
Date: Wed, 23 Oct 2024 17:18:07 +0200
MIME-Version: 1.0
To: "Abbarapu, Venkatesh" <venkatesh.abbarapu@amd.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
References: <20241022210633.271534-1-marek.vasut+renesas@mailbox.org>
 <SA1PR12MB8697AF99B0A56734FF65AD47984D2@SA1PR12MB8697.namprd12.prod.outlook.com>
 <699f9d96-a109-40ab-9cd8-ed0c5b4b589f@mailbox.org>
 <SA1PR12MB869767A8D003AB114830D46A984D2@SA1PR12MB8697.namprd12.prod.outlook.com>
 <03389ee7-3da9-4160-a193-00fd517ad56e@mailbox.org>
 <SA1PR12MB869722D8E2019193343572AF984D2@SA1PR12MB8697.namprd12.prod.outlook.com>
 <a78899c6-aecf-4eaa-a9c9-8f11758542cd@mailbox.org>
 <SA1PR12MB8697E723395F31AEFCD1C8F1984D2@SA1PR12MB8697.namprd12.prod.outlook.com>
 <SA1PR12MB869790C1B058968E33C891CF984D2@SA1PR12MB8697.namprd12.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <SA1PR12MB869790C1B058968E33C891CF984D2@SA1PR12MB8697.namprd12.prod.outlook.com>
X-MBO-RS-META: r4fuzxnumh4fys4k7xcnc5q5bwg5hmy1
X-MBO-RS-ID: dbbdd7496c6afca702b
Cc: Tom Rini <trini@konsulko.com>, Michael Walle <mwalle@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 Ashok Reddy Soma <ashok.reddy.soma@amd.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, "Simek, Michal" <michal.simek@amd.com>,
 Pratyush Yadav <p.yadav@ti.com>,
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

On 10/23/24 4:37 PM, Abbarapu, Venkatesh wrote:

[...]

>> Tried the test " sf probe && sf update 0x4000000 0 0x160000"
>>
>> Zynq> sf probe && sf update 0x4000000 0 0x160000
>> SF: Detected mx66l1g45g with page size 256 Bytes, erase size 64 KiB, total 128
>> MiB device 0 offset 0x0, size 0x160000
>> 0 bytes written, 1441792 bytes skipped in 0.154s, speed 9586980 B/s
>> Zynq>
>>
>>
> 
> Got the board with spansion flash part, tried below commands
> 
> Zynq> sf probe && sf update 0x4000000 0 0x160000
> SF: Detected s25fl512s with page size 256 Bytes, erase size 256 KiB, total 64 MiB
> device 0 offset 0x0, size 0x160000
> 1441792 bytes written, 0 bytes skipped in 5.186s, speed 284688 B/s
> Zynq>

Which board (or DT) is this and which U-Boot tree commit ?

And I am sorry, I missed the sf update test in your previous replies.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
