Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 179D99857FA
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Sep 2024 13:30:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0254C78006;
	Wed, 25 Sep 2024 11:30:04 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E1C0C57194
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 11:29:58 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 44F0587E30;
 Wed, 25 Sep 2024 13:29:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1727263792;
 bh=yN+By0kTW5UyUgEkfbbRSYexo8+igSnRUIACG241Aow=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XTGOEP/CtjPKjYCreJqa/JXTipNa4C3IdYfMBpKdYCDme1antInVV6/exDQESEeuC
 3djBQcZhc53BZrlsTQvdwYo/eWWwVyBNmyAvdAPwAWmZOwsVd7l3NQ1eFNygFzDJ9E
 5Zfb2kuLlupn8MAVDsW9dp/irq8qrgSUVgyvwa/Te2rj5cFmbbSpRsO2Jng1Fuzs8U
 QtohBPr/Tx5I+0dgW0dGA2vzssK8ev8IxFBI8BId7M32+CZfmRWOdqNdK22MVJ6IR4
 pkugpTvAoomVNHsISB0Nd3ltb28t+baazeXUJzqNu/enMHI/trW7WlakTLduqq+lvW
 1rt7FF9FSdzZA==
Message-ID: <270aa01b-98f9-4164-9539-396b9b3f96bc@denx.de>
Date: Wed, 25 Sep 2024 13:23:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jonas Karlman <jonas@kwiboo.se>
References: <20240925022314.714285-1-marex@denx.de>
 <20240925022314.714285-3-marex@denx.de>
 <18454c94-9422-4fe3-8996-6fc83834e319@kwiboo.se>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <18454c94-9422-4fe3-8996-6fc83834e319@kwiboo.se>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Quentin Schulz <quentin.schulz@cherry.de>, Sam Day <me@samcday.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, Dragan Simic <dsimic@manjaro.org>,
 Tom Rini <trini@konsulko.com>, "u-boot-qcom@groups.io" <u-boot-qcom@groups.io>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 "u-boot-amlogic@groups.io" <u-boot-amlogic@groups.io>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Ben Wolsieffer <benwolsieffer@gmail.com>, Thierry Reding <treding@nvidia.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Sumit Garg <sumit.garg@linaro.org>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Chris Morgan <macromorgan@hotmail.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 "u-boot@dh-electronics.com" <u-boot@dh-electronics.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH v2 3/5] power: regulator: Exit from
 regulator_set_suspend_value on poorly described regulators
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

On 9/25/24 8:29 AM, Jonas Karlman wrote:
> Hi Marek,

Hi,

> On 2024-09-25 04:21, Marek Vasut wrote:
>> In case the DT regulator node does not contain 'regulator-max-microvolt'
>> property and does not contain 'regulator-state-mem' subnode (like the
>> test.dts regul1_scmi: reg@1 {} regulator node), then regulator_pre_probe()
>> will parse this regulator node and set uc_pdata->suspend_on = true and
>> uc_pdata->suspend_uV = uc_pdata->max_uV, where uc_pdata->max_uV is set
>> to -ENODATA because "regulator-max-microvolt" is missing, and therefore
>> uc_pdata->suspend_uV is also -ENODATA. In case regulator_autoset() is
>> used afterward, it will attempt to call regulator_set_suspend_value()
>> with uV = uc_pdata->suspend_uV = -ENODATA and fail with -EINVAL. Check
>> for this case in regulator_set_suspend_value() and immediately return 0,
>> because there is no way to set meaningful suspend voltage, so do nothing
>> and retain the existing settings of the regulator.
> 
> I sent a different fix for this some time ago, please check it out:
> 
> https://patchwork.ozlabs.org/patch/1964571/
That one will work too, yes.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
