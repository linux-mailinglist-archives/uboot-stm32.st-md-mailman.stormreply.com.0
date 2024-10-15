Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FB299F845
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Oct 2024 22:48:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14131C78030;
	Tue, 15 Oct 2024 20:48:46 +0000 (UTC)
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05DF6C6C841
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 20:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1729025300;
 bh=l8eyeAWt0DqkBdQyWBOGH9DNgV9DhnoOXMrxOokI/Cg=;
 b=CSKmVTYCj5xfWBtbW06XtzGNAGmHtNpbbruLAjQHyhPL4npscW7gujAgE2hIkISNf3g9Sg9IQ
 qHPrVfzGi5HrujhQsREFy0hzFhn4UIKNCe2a8dMYJ6+8b6+UuRheWBFUOqfmOZK34nx/5Rj0geD
 dw4nLkk5+KNxi9j1kY4HhfXT+f58Iw7SENiB6AEKR4Tz2P/Uy+fHGYYRsH6gkGW7KOt+aOfV5lE
 B+MWuWUY8zkq8LtsL2+pz1UnFqJOgjKKqNh/ybwhbW1U70vH1jsK/JLtSzFTNh4RP1FFQzA89tR
 NpMg3ogwsP6d3ya/PiW0cte7JFmswsLYTEyY1xsEoh3A==
Message-ID: <8cfc2a0f-dfef-4528-95fa-298bfc701ac7@kwiboo.se>
Date: Tue, 15 Oct 2024 22:48:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tom Rini <trini@konsulko.com>, Marek Vasut <marex@denx.de>
References: <20241004230756.371153-1-marex@denx.de>
 <172902143755.5381.3133865412226742988.b4-ty@konsulko.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <172902143755.5381.3133865412226742988.b4-ty@konsulko.com>
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 670ed5137922294f1eb351c6
Cc: Sumit Garg <sumit.garg@linaro.org>, u-boot@dh-electronics.com,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 AKASHI Takahiro <akashi.tkhro@gmail.com>, Sean Anderson <seanga2@gmail.com>,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 Peter Robinson <pbrobinson@gmail.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 1/2] Makefile: Drop SPL_FIT_SOURCE support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 2024-10-15 21:43, Tom Rini wrote:
> On Sat, 05 Oct 2024 01:07:13 +0200, Marek Vasut wrote:
> 
>> The SPL_FIT_SOURCE is long superseded by SPL_FIT_GENERATOR which
>> is long superseded by binman, drop SPL_FIT_SOURCE support as there
>> are no more users.
>>
>>
> 
> Applied to u-boot/master, thanks!
> 

Look like 5b9261fb0b1e ("Makefile: Drop SPL_FIT_GENERATOR support") may
have broken ARCH_ZYNQMP, it still seem to use a mkimage_fit_atf.sh and
CI pipeline now fails:

https://source.denx.de/u-boot/u-boot/-/pipelines/22715

Regards,
Jonas
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
