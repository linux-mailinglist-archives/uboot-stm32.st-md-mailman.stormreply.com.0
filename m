Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 620A897505A
	for <lists+uboot-stm32@lfdr.de>; Wed, 11 Sep 2024 13:01:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18354C78015;
	Wed, 11 Sep 2024 11:01:41 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C11D6C6C83A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Sep 2024 11:01:33 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 333B489228;
 Wed, 11 Sep 2024 13:01:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1726052493;
 bh=Al3jtDPhLxOvdIYKZNxcpagroFBcDaxM8JV+V4iFiD8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SG7nrscnfbfhj4Rvja0Kc+Jp54Y1xypEQ+qYYoRSKLTrDL/CX4dWRilD8xoUlvR48
 Z+moGOUP000/K1d2QGz0VpME0+BF3x194aYqLUtvdIDeAXcap9uAiv2zMByo5+CnCQ
 8AT/0AZN6K5v5v/HQthS4qKyvTuEbAilUNlKh158CmNwonEuFiae7JPAQqpeZciM8U
 USVM7ih3kmYOeBhp7WX+Lr1NcPC1mw5NRn6r8zy3s48bOKumsHXrLhwWO64z5A1M7y
 HfUcEk48sNgrVKz3uWJmu/h19QHqfNY37NiIqkof8SS6LNmb6Hqdn+hXWmNlcRED7x
 3OXg2LnA4/5Uw==
Message-ID: <cfc1a158-6c35-4288-aed0-fcc78a8db832@denx.de>
Date: Wed, 11 Sep 2024 12:46:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Svyatoslav Ryhel <clamor95@gmail.com>
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
 <45c74c58-98cf-43df-b837-c48b0341c551@denx.de>
 <CAPVz0n2-DCKDcVrAi00kF6yDcE2bN1mtUhzBcw7JDiZoXgzu0w@mail.gmail.com>
 <e5837ce4-0a14-4822-960d-6ab667a9f4b1@denx.de>
 <CAPVz0n323ktF6kb3WHR9JcE+xOzQr9-aWOR47+ZvwQr=ib18rg@mail.gmail.com>
 <f778366b-bdaf-415d-a94e-c995f62e8c71@denx.de>
 <CAPVz0n0ru1rPb9SNw515mkwfs4=nNSOPjZY74JVkqnGbEouSLQ@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAPVz0n0ru1rPb9SNw515mkwfs4=nNSOPjZY74JVkqnGbEouSLQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Tom Rini <trini@konsulko.com>, Caleb Connolly <caleb.connolly@linaro.org>,
 Sumit Garg <sumit.garg@linaro.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
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

On 9/11/24 7:57 AM, Svyatoslav Ryhel wrote:

[...]

>>>> You did mention something regarding I2C/PMIC driver probe timing, but it
>>>> seems the I2C driver and PMIC drivers probe roughly around the same time
>>>> in both pass and fail cases ?
>>>
>>> Yes, here I agree that they both probe and probe passes, but I assume
>>> timing of i2c call is critical and there may be some dependency which
>>> is not ready.
>>
>> My guess would be pinmux or clock, maybe the i2c controller is marked as
>> bootph-* in DT and its pinmux/clock is not? Maybe the i2c on tegra works
>> by sheer coincidence right now? Can you have a look?
> 
> Power i2c line (one that hosts PMIC) is configured extremely early in
> SPL since it is needed for cpu and core voltage setup so even if, as
> you say, tegra works by sheer coincidence, specifically this i2c line
> should work non the less, since it has all its pre-requisites (clock
> and pinmux) configured on early stage.

Is it possible that this configuration is somehow reset or reconfigured 
from DT early on in U-Boot proper ?

Do you have serial console output in board_f.c time in U-Boot proper , 
possibly using DEUBG_UART , to check if there might be some prior 
failing I2C transfer at that board_f.c time ?

> As I have told, I was not able to determine exact reason why this
> happens, it should not and yet it does. This is why I have abandoned
> my attempt to implement same changes you are currently proposing.

If tegra has a problem, it should be fixed on tegra side and not block 
core plumbing. I am not seeing the problem on stm32 or imx systems, so I 
am banking toward tegra-specific issue.

Are you able to debug this ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
