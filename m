Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A27BF95721E
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Aug 2024 19:27:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5050CC6DD72;
	Mon, 19 Aug 2024 17:27:39 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0580AC6B460
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 17:27:33 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id AB91D88D08;
 Mon, 19 Aug 2024 19:27:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1724088452;
 bh=+gjvXxqPbLtVEG2pUK74CyMOgOiUPVrve6ZPDJxlDQQ=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=Z+o3xypKoAXKrq2rxJ17Docb2lc+I6l72c/06Wm9OCtDcssggZVcsdeKX3MLIQFUf
 pDQfdiWpO+LYQL6qo9OVSFRzRPcc80FpUrLxI8rZEaUvvjxo0RnW8ToXvoJHh6Ddka
 fLg9N1F3QmbfNTnnYFkBoKTUDJNqoc3w3LoD4qtGIPbzfUc2oRZpQL9sN6ZSemnMOo
 +uImPjU4i/z6HbEJOTN8qjkSenvAPlt6GlXU75gf3EngJUsVI39iJKrrY7wY7e1Odb
 kY7p9sjABggV8hqHaEOIpc8NK1j1QpKrYPCT6UhdDOlbneG1hLpLDRpKEO0vCkD+xI
 K0g98fC9ShBPg==
Message-ID: <45c74c58-98cf-43df-b837-c48b0341c551@denx.de>
Date: Mon, 19 Aug 2024 19:09:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marek Vasut <marex@denx.de>
To: Svyatoslav Ryhel <clamor95@gmail.com>, Tom Rini <trini@konsulko.com>
References: <20240626235717.272219-1-marex@denx.de>
 <a73dffe5-87e3-4e96-965f-9d029f2af8ed@denx.de>
 <CAPVz0n0C6TPdBRUEvJmgAUGAKoetuzr1j=0cMXweP2EqMTwn=g@mail.gmail.com>
 <0910419d-e8ab-4bf9-a083-dc2783afaca1@denx.de>
 <4D07A6E5-F156-44C3-A26D-0F2D913CE92D@gmail.com>
 <18d84528-d2e5-41d6-ae1d-109ee30853b2@denx.de>
 <CAPVz0n2Jzfih0Z85TSQbnz-8OrX4D6UN=anKGTJ=hckRt8f3xA@mail.gmail.com>
 <a95f0d60-2883-4c3d-8a53-ee3ef414cc32@denx.de>
 <CAPVz0n3Ji1sKQK+Lnq8rP3ZqwX3o-kXe2btj93UuVBa3T5C=qw@mail.gmail.com>
 <eced1020-2157-44a4-98a9-845e218529d9@denx.de>
Content-Language: en-US
In-Reply-To: <eced1020-2157-44a4-98a9-845e218529d9@denx.de>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Sumit Garg <sumit.garg@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [Uboot-stm32] [PATCH 1/4] power: regulator: Trigger probe of
 regulators which are always-on or boot-on
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

On 8/1/24 2:28 AM, Marek Vasut wrote:
> On 7/29/24 1:55 PM, Svyatoslav Ryhel wrote:
> 
> [...]
> 
>>>>> What is the problem you observe on tegra 3 ?
>>>> i2c line fails since it probes in spl with your patch, but it does not
>>>> relocate and then probes once more after relocation. Probe fails along
>>>> with all devices on same line.
>>>
>>> Could it be that you either have to:
>>> - Add DM_I2C to tegra 3 SPL
>>> - Remove bootph-* from DT to remove the regulator node from SPL
>>> - /delete-property/ regulator-always-on; and /delete-property/
>>> regulator-boot-on; in -u-boot.dtsi to prevent the regulator from being
>>> enabled in SPL ?
>>>
>> Obviously NO, you propose nonsense. Same dts is used for both stages.
> 
> DT source yes, DT blob likely no.
> 
>> And I have to add hack-ish stuff just because you wanna introduce code
>> which causes known regressions.
> 
> I am trying to understand what problem there is on tegra 3, but it is 
> still not clear to me.
> 
> Is the problem somehow related to PMICs (?) being probed in SPL (?) 
> because they have regulators (?) which are marked as regulator-always-on 
> ? If so, then this is correct behavior, and if this is not desired in 
> SPL, then you can remove this property from SPL DT in -u-boot.dtsi using 
> /delete-property/ .
> 
> [...]
> 
>> "We must not probe things as we go. There might be other
>> dependencies not yet bound. It may also take some time. This is not
>> following driver model design, sorry.
>>
>> So please think of a way to do this properly."
> 
> What is this quote about ? Where is this from ?

What is the problem with Tegra 3 and this patchset ?

Can you please explain that so this patchset can move forward ?

Thank you
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
