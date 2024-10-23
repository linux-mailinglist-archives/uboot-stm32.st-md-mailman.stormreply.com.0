Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 928569AC1F6
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2024 10:41:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 552FCC71287;
	Wed, 23 Oct 2024 08:41:44 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EED22C6DD9F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 08:41:37 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4XYMwK3WHlz9t3D;
 Wed, 23 Oct 2024 10:41:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729672897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nETczxx9naPwETSneqAB2+nSLhBVJJhureDjd5PqEQo=;
 b=w7XAKufPhnC+eXiJQOx5TlnZWA3AHsDLqflKHffmEjRVabOqur2Jqw0NtlUrKpqNhXg1/5
 Odau4nMOD13TXd4qHkCZOWbL8c5zt0HVzXHJinLwpKPspfm+Y7P32NYFUqyd99stg3vH7+
 7y7YJHK1RnpL+Q/3sGzkfq288sS7r1NEbIR1RcA009czjZYs51ggY4X+MCdWiDEMhHuPGP
 IRjJar3EfwW7NwZJxZRjsrg3BM61//fHsZChiDO2XXpiqEKzk20GKeOotbnxFoaPAQ8ruz
 xV9jTRv1EMr8nq8H+48tmJFYyF+FQ02QKUY0mVNyJuABVVb/G/sIOMxemiUSBQ==
Message-ID: <699f9d96-a109-40ab-9cd8-ed0c5b4b589f@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729672895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nETczxx9naPwETSneqAB2+nSLhBVJJhureDjd5PqEQo=;
 b=Hx1vzQh3o0flhckvYFKT0d79+LlJUs+HlQa58hG16JnWxen/UuxBkK4qQd/DUKfEjO7sqL
 oO3gYpjczvXC1X6DqHRkdFSAFf+0R0YMMECvqibdcfCfAPKT4P2/lGh/LkrCr7ABkj7jeg
 1xMnBGeRNcfU5ZNTWKnLMljhy3YWqAPVjiRoRASmzj6AWe+RyaSt8grgLeag15N0LsHnGg
 3gRoL3eKC3FFGTsdY6dwSz8zno+zrSgsvk3QYleo4JCg3gRRvZXx1oa3ZvTZ2rNO5QaxE2
 WntskBPSXvMlKdxCOVdWa2nBQLc/l2t6X62uE/XwgVSJxwYpK2HU2I7ngfFOFA==
Date: Wed, 23 Oct 2024 10:41:31 +0200
MIME-Version: 1.0
To: "Abbarapu, Venkatesh" <venkatesh.abbarapu@amd.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
References: <20241022210633.271534-1-marek.vasut+renesas@mailbox.org>
 <SA1PR12MB8697AF99B0A56734FF65AD47984D2@SA1PR12MB8697.namprd12.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <SA1PR12MB8697AF99B0A56734FF65AD47984D2@SA1PR12MB8697.namprd12.prod.outlook.com>
X-MBO-RS-META: rakpnfp38gg36n7nwu7atxb64q4bk6c3
X-MBO-RS-ID: 1870e1da7dd7069787f
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

On 10/23/24 5:18 AM, Abbarapu, Venkatesh wrote:
> Hi Marek,
> There was some issue and fix is sent
> https://lore.kernel.org/u-boot/20241018082644.22495-1-venkatesh.abbarapu@amd.com/T/#u

Is this one fix or three fixes for three different issues ?

This seems to fix READ errors, which is apparently another error 
introduced by this stuff. In my case, plain and simply 'sf probe ; sf 
update' combination with single non-stacked SPI NOR does not work. Was 
such a simple configuration ever tested ?

> Not sure we need to revert whole parallel/stacked support?
Please stop top-posting.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
