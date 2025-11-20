Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E33C76373
	for <lists+uboot-stm32@lfdr.de>; Thu, 20 Nov 2025 21:38:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1203C58D7B;
	Thu, 20 Nov 2025 20:38:38 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43CF4C58D79
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Nov 2025 20:38:38 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dC9DC6D9wz9tNF;
 Thu, 20 Nov 2025 21:38:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1763671115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pnuWa/y4fyB08cL/bLUxYRcb/+YqIMaiPT9la5fyAhg=;
 b=rtZGC4RO0FWcDNbOWaSPxZNGBCvtZoq7LK7PFaHzoGF1NH0WSdsuxsb1cb97PIDaw7ul+l
 jDDxj7KloTHUgLNWRGvLMPCDrHsZ7lxuoaGLakXmdcXQ6Ddu6RnWQQHvIa3GOvI50ZCUcO
 X3012I+Ws4dJMndzcBsneIruE9Q13n5T+bg1Fv6SjqkXL6T2F9/IUdxUYnP/WkmrqDXmy4
 Bfg5aoswJ8dU/BYlKRRAYYo1sPTAcB6IwVtuMaoFnqKmiD0hOyCRZID3HeVIVHqvrVWEVU
 XgA9E04Av1tFvGYTxavz2bQA5ZDCdiNlF+wLD7O+lpnasobwAOqZDvtNqmO6rQ==
Message-ID: <d90e6eca-2b3d-4274-8738-b2eb49f1e722@mailbox.org>
Date: Thu, 20 Nov 2025 21:38:29 +0100
MIME-Version: 1.0
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20251114154259.4035206-1-patrice.chotard@foss.st.com>
 <20251114154259.4035206-3-patrice.chotard@foss.st.com>
 <4a71038b-ce5b-4119-9493-4e33642a8528@mailbox.org>
 <71047e69-164e-4c65-9eb7-587de4f147ff@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <71047e69-164e-4c65-9eb7-587de4f147ff@foss.st.com>
X-MBO-RS-META: qik4h1fq7tqifh4z71c6eh6urhsrbck6
X-MBO-RS-ID: ac1924b393938235c66
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Valentin Caron <valentin.caron@foss.st.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Vinh Nguyen <vinh.nguyen.xz@renesas.com>, Alice Guo <alice.guo@nxp.com>,
 Kamlesh Gurudasani <kamlesh@ti.com>,
 Casey Connolly <casey.connolly@linaro.org>, Lukasz Majewski <lukma@denx.de>,
 Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 "u-boot@dh-electronics.com" <u-boot@dh-electronics.com>,
 Michal Simek <michal.simek@amd.com>, Yao Zi <ziyao@disroot.org>
Subject: Re: [Uboot-stm32] [PATCH 2/6] clk: scmi: Force call of
 scmi_clk_get_attribute() during probe
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

On 11/17/25 5:36 PM, Patrice CHOTARD wrote:

Hello Patrice,

> On 11/15/25 00:08, Marek Vasut wrote:
>> On 11/14/25 4:41 PM, Patrice Chotard wrote:
>>> Since commit fdb1bffe2827 ("clk: scmi: Postpone clock name resolution"),
>>> all clocks which are parent clocks are name "scmi-%zu" which
>>> leads to error during their children clocks registration.
>>>
>>> In order to not cancel boot time optimization done in
>>> commit 3547e315c188 ("clk: scmi: Defer issue of SCMI_CLOCK_ATTRIBUTES"),
>>> choice has been done to re-introduce scmi_clk_get_attribute() call
>>> during scmi_clk_probe() under new CLK_SCMI_FORCE_ATTRIBUTE flag.
>>>
>>> This restores boot on stm32mp13 and stm32mp2 family boards.
>>>
>>> Fixes: fdb1bffe2827 ("clk: scmi: Postpone clock name resolution")
>> SCMI spec says that clock IDs have to be monotonic and incrementing, without gaps . This driver registers all SCMI clock for you exactly this way. What exactly is the problem on STM32 ? Are you maybe missing some reparenting somewhere else ? Maybe the clock parent resolution should happen when the clock are first used, just like attributes are now resolved when the clock are first used ?
> 
> Hi Marek
> 
> Initially, on STM32 we first registered SCMI clocks with their real names and then we registered all RCC clocks
> in stm32_rcc_init(). For most of these latter clocks, their parent are SCMI clocks.
> 
> After commit fdb1bffe2827 ("clk: scmi: Postpone clock name resolution"), the name of these SCMI "parent" clocks
> becames "scmi-%zu" which makes clk_register() failed as we still try to register RCC clocks using their parent's "real names".
> 
> For example: for STM32MP13, clock "ck_hse" becames "scmi-0", so all clocks which are "ck_hse"'s child can't be registered.

I don't think any clock driver can depend on SCMI clock shortnames for 
clock look up, because the SCMI clock shortnames are an optional hint.

Instead, if some clock registered in this RCC driver have SCMI parent 
clock, those SCMI parent clock have to be referred to by SCMI clock 
udevice and matching clock identifier (in this case, I assume that would 
be SCMI clock ID).

The relationship between this RCC clock and SCMI parent clock can likely 
be described in DT using 'clocks = <&scmi_clk N>' , which you already 
have in stm32mp131.dtsi:

  788                         clock-names = "hse", "hsi", "csi", "lse", 
"lsi";
  789                         clocks = <&scmi_clk CK_SCMI_HSE>,
  790                                  <&scmi_clk CK_SCMI_HSI>,
  791                                  <&scmi_clk CK_SCMI_CSI>,
  792                                  <&scmi_clk CK_SCMI_LSE>,
  793                                  <&scmi_clk CK_SCMI_LSI>;

Can you use that for the parent lookup and simply ignore the shortnames?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
