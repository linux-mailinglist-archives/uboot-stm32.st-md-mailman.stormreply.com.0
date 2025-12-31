Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5597ACEC493
	for <lists+uboot-stm32@lfdr.de>; Wed, 31 Dec 2025 17:51:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E34EEC57A52;
	Wed, 31 Dec 2025 16:51:24 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2EA82C35E2B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Dec 2025 16:51:23 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dhGF45xbWz9tGG;
 Wed, 31 Dec 2025 17:51:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767199880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sKv7HnPULFDmV8/kmrH9t35HrzICVvGqjwXp+gE5pXY=;
 b=oB2aI9N708dZmW6JoQv5yw9Uch90BAicTeDHtb9U5V5E+d1oMSF/r0sNS3+y5KBb8PpgcJ
 wth2vIpdNMXt4Q0UXm68y4ixWcOFaTyOjUKbr8BwBlcN5qnfHrXIaeoAJAhSDbvKre8pcx
 E4YfvJQs5ITQcFVtDsWk5OfdEofwSZLVwV6L8SMBanZJXBeW6cMNJc2EfI8JcOnP024n8C
 vhrXDydSNiENGKQZmfM9IMs4P8awObYlcA1AU6WKpnEoD6DsUWi3e86KmdkgGu542eExDQ
 rc2n+cqh3HcWKHzuyILCG/JlL3ubWMPJ/cf13+78jVLG5VPpAjlnk5VVJGlaFQ==
Message-ID: <17995e1a-142a-4914-a30f-6f806b7a2e9b@mailbox.org>
Date: Wed, 31 Dec 2025 17:51:18 +0100
MIME-Version: 1.0
To: Patrice CHOTARD <patrice.chotard@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Peng Fan <peng.fan@nxp.com>
References: <20251211-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v2-0-44e6e7de2beb@foss.st.com>
 <20251211-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v2-2-44e6e7de2beb@foss.st.com>
 <b9fc4f8d-b10d-4308-bbe0-ff871fcdc940@mailbox.org>
 <7469d2f7-427d-456e-b731-c1f26452fe0f@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <7469d2f7-427d-456e-b731-c1f26452fe0f@foss.st.com>
X-MBO-RS-ID: 89c3f9650012c43cd04
X-MBO-RS-META: i4m1ajydtuh1hrt3us8q8gru6n4gecqd
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Lukasz Majewski <lukma@denx.de>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 2/3] clk: stm322mp13: Resolve scmi clk
	before using it
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

On 12/15/25 9:44 AM, Patrice CHOTARD wrote:
> 
> 
> On 12/12/25 16:36, Marek Vasut wrote:
>> On 12/11/25 4:52 PM, Patrice Chotard wrote:
>>> During clock's registration, clock's name are used to establish parent -
>>> child relation. On STM32MP13, most of SCMI clocks are parent
>>> clocks.
>>>
>>> Since commit fdb1bffe2827 ("clk: scmi: Postpone clock name resolution"),
>>> all scmi clocks are named by default "scmi-%zu" until they are enabled,
>>> it breaks clocks registration and boot process for STM32MP13 platforms.
>>>
>>> By resolving SCMI clocks before clocks registration, it solves the issue.
>>>
>>> Fixes: fdb1bffe2827 ("clk: scmi: Postpone clock name resolution")
>>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>>
>> Shouldn't the relationship between RCC and SCMI clock be described in DT using "clock" property and phandles / clock cells ? Once that is in place, you should be able to resolve the parent clock using that relationship described in DT, without the need to explicitly do these SCMI calls in RCC driver.
> 
> Hi Marek
> 
> I was ready to upstream one implementation when Peng submitted its proposal.
> 
> Honestly, Peng Fan's proposal was seductive as it was simple and less prone to regression.
> But yes, everything is present in our DT to resolve the parent clock's name.
> 
> I will submit my implementation.
Thank you. Did you manage to submit it yet ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
