Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 044CC78715A
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Aug 2023 16:21:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF653C6B44F;
	Thu, 24 Aug 2023 14:21:53 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DE69C65E4C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 12:26:49 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37OCQMXD121452;
 Thu, 24 Aug 2023 07:26:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1692879982;
 bh=VxWMTYdF4yUxZ9H1HdXvGy1JTkGt6s32Y9FEtgIKXQ8=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=gLpBuJsy1Q2iz1DZ0uxl4OnlA79f0jnkg2VUFizeusvdW/rg3GsfzxMoWyEodtGSf
 gxhneEao7OzGx+ovahBGp8s8dT7kATUAKaCC0x9uSlIzJdIRrJWol5gGIUsZvUQUdW
 MsUN9DSviT23vKmzZCIRJJjuwGkfmHDn9cfuR7Rs=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37OCQMOq049576
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 24 Aug 2023 07:26:22 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 24
 Aug 2023 07:26:21 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 24 Aug 2023 07:26:21 -0500
Received: from [10.24.68.114] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37OCQG1p122195;
 Thu, 24 Aug 2023 07:26:16 -0500
Message-ID: <66f15744-0b0b-743f-8ad3-8448d78812f6@ti.com>
Date: Thu, 24 Aug 2023 17:56:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Simon Glass <sjg@chromium.org>, U-Boot Mailing List <u-boot@lists.denx.de>
References: <20230824030304.1555547-1-sjg@chromium.org>
Content-Language: en-US
From: Neha Malcom Francis <n-francis@ti.com>
In-Reply-To: <20230824030304.1555547-1-sjg@chromium.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Thu, 24 Aug 2023 14:21:52 +0000
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Peng Fan <peng.fan@nxp.com>, Philippe Reynes <philippe.reynes@softathome.com>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
 Jonas Karlman <jonas@kwiboo.se>, Nishanth Menon <nm@ti.com>,
 Vikas Manocha <vikas.manocha@st.com>, Michael Walle <michael@walle.cc>,
 Kamil Lulko <kamil.lulko@gmail.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@dh-electronics.com,
 Ivan Mikhaylov <fr0st61te@gmail.com>, Dillon Min <dillon.minfei@gmail.com>,
 "Raghavendra, Vignesh" <vigneshr@ti.com>
Subject: Re: [Uboot-stm32] [PATCH 0/6] Attempt to enforce standard
 extensions for build output
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

Hi Simon

+ Vignesh, Nishanth to comment on this as well

On 24/08/23 08:32, Simon Glass wrote:
> In this early stage of using binman to produce output files, we are mostly
> seeing people using common extensions such as '.bin' and '.rom'

[...]

> The fact that the .pem files are at the top level means that they are
> output images, which surely is not intended. They should be buried in the
> image description, at a lower level, as part of something else.
> 
> So please take a loke at the above and see if the binman descriptions can
> be reworked slightly to follow these new rules.
> 

I think this can work... but few concerns.

1. Our output binaries also include <image>.bin_unsigned, would extensions that 
aren't "standard" be added to the list if they are truly output binaries? If 
not, changing names for them may be a long stretch (pinging Vignesh and Nishanth 
to comment here).

2. Can it be an option to not enforce this, to support users that may make use 
of the intermediate binaries?

Also if we do move forward with this, we will need to sync to make sure that the 
changes to the affected boards come through as well.

-- 
Thanking You
Neha Malcom Francis
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
