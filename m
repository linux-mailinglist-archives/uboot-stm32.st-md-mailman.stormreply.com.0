Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E48987B16
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Sep 2024 00:17:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A59AC6DD72;
	Thu, 26 Sep 2024 22:17:03 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55E4AC6B47E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2024 22:16:56 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 28D2788F08;
 Fri, 27 Sep 2024 00:16:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1727389015;
 bh=ChzMy5WYqc3uW8w8j0l/YJ76ufI3mEG1AJyTnWAHWvQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DiXsIH+G6ZySjfUCfP5aKPpfnXl8I+vYWVWriBGcB3t9w31yebE3rXbXxbca9CkgY
 fbucKsnL1LcldN3CfoMX0eWUNl6VePMlr/EGjolRDcqbLZG/sC+lkOUzdFa6GHmgDg
 qz7roYNQmT4NjhE68/kRHiCZsysXPbVT5OuPaxW5VY6FZ79KVX12uxtE/H2mkO7Hbh
 lSFNUjcZBwNJJC6spPPk5tdLYrUNXWLYmava2gf9lNqH9SudwnRAvsez4Q5WDAFtqw
 l9eEjCyR04aBA+D669ArIuyD6Vvx27IxFlb7rLK0HBcnOQGKsc6Wl9fSeoRrwAWvAR
 DDKhYGTEFPNSQ==
Message-ID: <b769e5c6-7e19-4ce6-9c3d-9a262a1bad8e@denx.de>
Date: Fri, 27 Sep 2024 00:16:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jonas Karlman <jonas@kwiboo.se>, Tom Rini <trini@konsulko.com>
References: <20240925022314.714285-1-marex@denx.de>
 <b8eb1c20-afdb-497e-9788-498550520d61@kwiboo.se>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <b8eb1c20-afdb-497e-9788-498550520d61@kwiboo.se>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Quentin Schulz <quentin.schulz@cherry.de>, Sam Day <me@samcday.com>,
 Kever Yang <kever.yang@rock-chips.com>, u-boot@lists.denx.de,
 Max Krummenacher <max.krummenacher@toradex.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Dragan Simic <dsimic@manjaro.org>,
 u-boot-qcom@groups.io, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 u-boot-amlogic@groups.io, Jaehoon Chung <jh80.chung@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Kostya Porotchkin <kostap@marvell.com>,
 Ben Wolsieffer <benwolsieffer@gmail.com>, Thierry Reding <treding@nvidia.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Sumit Garg <sumit.garg@linaro.org>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Chris Morgan <macromorgan@hotmail.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, u-boot@dh-electronics.com,
 Simon Glass <sjg@chromium.org>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/5] power: regulator: Trigger probe of
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

On 9/26/24 5:05 PM, Jonas Karlman wrote:
> Hi Marek,

Hi,

> On 2024-09-25 04:21, Marek Vasut wrote:
>> In case a regulator DT node contains regulator-always-on or regulator-boot-on
>> property, make sure the regulator gets correctly configured by U-Boot on start
>> up. Unconditionally probe such regulator drivers. This is a preparatory patch
>> for introduction of .regulator_post_probe() which would trigger the regulator
>> configuration.
>>
>> Parsing of regulator-always-on and regulator-boot-on DT property has been
>> moved to regulator_post_bind() as the information is required early, the
>> rest of the DT parsing has been kept in regulator_pre_probe() to avoid
>> slowing down the boot process.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> [snip]
> 
>>   
>> -	debug("'%s' of dev: '%s', has nonunique value: '%s\n",
>> -	      property, dev->name, uc_pdata->name);
>> +	/*
>> +	 * In case the regulator has regulator-always-on or
>> +	 * regulator-boot-on DT property, trigger probe() to
>> +	 * configure its default state during startup.
>> +	 */
>> +	if (uc_pdata->always_on && uc_pdata->boot_on)
> 
> This check for always_on _and_ boot_on does not fully match the commit
> message, comment or the old behavior of regulators_enable_boot_on()
> where any always_on _or_ boot_on would trigger autoset().
This should be ORR, thanks for spotting this, fixed in V3.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
