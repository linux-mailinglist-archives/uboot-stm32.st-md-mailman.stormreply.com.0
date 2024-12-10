Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CDD9EAA72
	for <lists+uboot-stm32@lfdr.de>; Tue, 10 Dec 2024 09:20:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA467C78006;
	Tue, 10 Dec 2024 08:20:15 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88AC7C6DD6D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Dec 2024 08:20:09 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Y6s9M0xJdz9tC4;
 Tue, 10 Dec 2024 09:20:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1733818807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ZqQZZ/h3UhLBqu+kSlBj1C8JbxWzTXdP7VsidvLFZQ=;
 b=exAuVXyaYeNPmQoQ0llqIIXM9pDYeSCpF2cEQZVXqb9WqF4/aG2pE6fcB0z0+jrYanYhpf
 /3Q+mHf7hFGWgV/3BEekSNFm5FsSXm48+MJPAjaKurgCqjLTc9chnsxsmrBS1Q+WYDNbNH
 2VYhy+aCUr2JJR7pJHoKUO7p8joICtcJuqMemAjV1n5uPJs8Yx+ixYCrULVlVRHcnBRflE
 yqzS4ACg+2DLfGvrwXfn3Fzab5szGhwAVKPaRdsHkasFUmY9dMlLDwABxjPpSfjG+BP6Fz
 KfJp0xOKP5rQYMUgInQeAgCxgl0kESggrG8t+dUz8KtYFaNFfJsMJP6ZNuj9ig==
Message-ID: <ba1bc243-bd1b-4580-ba1b-4f96058f661a@mailbox.org>
Date: Tue, 10 Dec 2024 09:19:43 +0100
MIME-Version: 1.0
To: "Abbarapu, Venkatesh" <venkatesh.abbarapu@amd.com>,
 Tom Rini <trini@konsulko.com>, Tudor Ambarus <tudor.ambarus@linaro.org>
References: <edcec18f-75a0-44d8-907a-f042779ca6ee@mailbox.org>
 <86ses458k3.fsf@udb0321960.dhcp.ti.com>
 <f7bb335d-681a-4b60-92f6-b605cc6f477f@mailbox.org>
 <86pln759j9.fsf@udb0321960.dhcp.ti.com>
 <33e99705-77e3-4acf-95f7-fad65f60ae62@mailbox.org>
 <86ldxp6ehf.fsf@udb0321960.dhcp.ti.com>
 <865xny69y1.fsf@udb0321960.dhcp.ti.com>
 <SA1PR12MB86974AC7EFCCBD7AE99FDD3E98302@SA1PR12MB8697.namprd12.prod.outlook.com>
 <8634j15t1y.fsf@udb0321960.dhcp.ti.com>
 <SA1PR12MB869743652A0B3EC3335A9F9F98312@SA1PR12MB8697.namprd12.prod.outlook.com>
 <20241206163931.GS2457179@bill-the-cat>
 <SA1PR12MB86977B7233CE821D113F369C983D2@SA1PR12MB8697.namprd12.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <SA1PR12MB86977B7233CE821D113F369C983D2@SA1PR12MB8697.namprd12.prod.outlook.com>
X-MBO-RS-META: 9hjo76obed3pfq55z7wgxe7irxpd7yo1
X-MBO-RS-ID: cc771d210a4d2171edc
Cc: Jon Humphreys <j-humphreys@ti.com>, Michael Walle <mwalle@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, "Simek, Michal" <michal.simek@amd.com>,
 Ashok Reddy Soma <ashok.reddy.soma@amd.com>, Pratyush Yadav <p.yadav@ti.com>,
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

On 12/10/24 4:20 AM, Abbarapu, Venkatesh wrote:

>>> Hi Humphreys,
>>> Thank you for confirming that the patch worked and resolved the issue.
>>
>> OK, but going back to the patch in question, Tudor has requested changes. When
>> can we expect a v2 that addresses those, so that Jon and Marek can also confirm
>> their platforms work? Thanks.
> 
> Tudor, Do you want me to implement separate spi_nor_erase()/spi_nor_read()/spi_nor_write() for the parallel/stacked configurations?
> Marek, any suggestions regarding this implementation?

What do you refer to ? Is there a discussion I missed ?

-- 
Best regards,
Marek Vasut
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
