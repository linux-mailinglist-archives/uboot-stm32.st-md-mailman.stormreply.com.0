Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SM1fOpF2GWqQwwgAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Fri, 29 May 2026 13:20:49 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DAC601879
	for <lists+uboot-stm32@lfdr.de>; Fri, 29 May 2026 13:20:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E2B2C8F292;
	Fri, 29 May 2026 11:12:43 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA20BC87ED1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 May 2026 11:12:41 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gRggX6x67z9tk3;
 Fri, 29 May 2026 13:12:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1780053161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jdu5Ycvznc6GZWXfJDmUVQ0+TF0A/Mo1bdnPrjnPEU0=;
 b=sN91++ffIfN3KKcCiXJ6zqUsvB00kSQdv/MRcnJmOGzeWk9d9sTSvn2TjaIQYWpwAYF8Ca
 CVsLi1MWWyc4x/HvFprWwqINtLNbVk0JGS7xRUmKdoFHR8aB/17FLQOAQuiFyU3Dn2HnCK
 cZPlsi6UGqNyYUkgAYEQk+hahjFj47J8ptlhMGwNQu5GjSngYRtUzcUlhXuEHcEuMuSvDm
 AWH6OANxTvDIktv0OMYdcjF7uBSlMjvJzOheH/Cuhw5Rqj6DtT8V+rKJHrThZGAjMK7eLH
 IpU4LPYCe6dJMpJV1NQXnHU5tK+oBxemrt67ZCluJZssAm3NFOsePyKH7sUE7g==
Message-ID: <66ed0a35-105a-4919-86b2-7be6eeca1e9d@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1780053158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jdu5Ycvznc6GZWXfJDmUVQ0+TF0A/Mo1bdnPrjnPEU0=;
 b=IfheRPNsMSIFcak5TUfqWE9aG/iJ4S5yVJCbDcPv+x6acCmrfbbaezwoL4zXybbUT7R6N1
 TP8GUw+5/GKrb/EQI1wcHKUQafsDyzJK3v+0sXhTjUZzI21McBagQN8eYb7RgvokNtDOdS
 g/RIsjyLQlL4lAP+nRYlyamADxqBrLy1zDj6J6/VcvFrR2MX5bVz35YTmxfbD5bWDL5jNK
 VqXO/S20mnvWYn8+iEdOsMhrDJ3tg1Dic+XTxe4yEgIRUjH7EKSeHjIGvDEaDJ3/4sXzCL
 ofX8gQYMjEU1eGxcOyg48xoyghFjz2Q6Zm7eK4HLtbtp6rnCzlhhYdXxS2pGqw==
Date: Fri, 29 May 2026 13:12:34 +0200
MIME-Version: 1.0
To: Yann Gautier <yann.gautier@foss.st.com>, u-boot@lists.denx.de
References: <20260520160715.175032-1-yann.gautier@foss.st.com>
 <f48f9d8d-4b14-4745-8c96-2c315889f770@mailbox.org>
 <b74d784c-9728-4242-a9d0-e0c805048c7d@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <b74d784c-9728-4242-a9d0-e0c805048c7d@foss.st.com>
X-MBO-RS-META: 3cgh999piq1erwcnzskzo8wwj4kfbtzc
X-MBO-RS-ID: 18a983e606e79cab85d
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, Peng Fan <peng.fan@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Anshul Dalal <anshuld@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 0/3] Enable Arm SMC watchdog for
	STM32MP1
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
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[mailbox.org : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[mailbox.org:s=mail20150812];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:yann.gautier@foss.st.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:christophe.kerello@foss.st.com,m:quentin.schulz@cherry.de,m:peng.fan@nxp.com,m:patrick.delaunay@foss.st.com,m:anshuld@ti.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:lionel.debieve@foss.st.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	GREYLIST(0.00)[pass,body];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[mailbox.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 98DAC601879
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/21/26 9:20 AM, Yann Gautier wrote:
> On 5/20/26 18:38, Marek Vasut wrote:
>> On 5/20/26 6:07 PM, Yann Gautier wrote:
>>> This series adds the supports for Arm SMC watchdog for STM32MP1x
>>> platforms. This enables the required config flags for both STM32MP13
>>> and STM32MP15, and updates the U-Boot overlay DT file for STM32MP15
>>> in SCMI configuration.
>>>
>>> This series also requires a patch from Patrice[1] increasing the
>>> CONFIG_SYS_MALLOC_F_LEN for STM32MP15.
>>>
>>> [1]: https://patchwork.ozlabs.org/project/uboot/patch/20260518- 
>>> master- v1-1-37fd4df56609@foss.st.com/
>>
>> I hate to nitpick at this point, but, it seems the two patches in this 
>> series do effectively the same thing.
> 
> Not really, the watchdog config was already there for STM32MP15, and we 
> now enable and use the Arm SMC watchdog.
> For STM32MP13, no watchdog was configured at all in U-Boot.
> So for me the patches titles make sense as they are.

Sorry, was busy with too many other emails.

1/3 and 2/3 does the same thing, enable CONFIG_WDT_ARM_SMC, the commit 
messages should be aligned. Do you even need CONFIG_WDT=y in 2/3 ?

>> I'd say, align the commit subjects to something like:
>>
>> configs: stm32mp15: Enable Arm SMC watchdog
>>
>> And:
>>
>> configs: stm32mp13: Enable Arm SMC watchdog
>>
>> Even the commit messages can likely be aligned ?
> 
> I'll check if I can improve that.
Please do.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
