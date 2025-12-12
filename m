Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0C7CB93BC
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Dec 2025 17:12:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E317C8F278;
	Fri, 12 Dec 2025 16:12:18 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0604C8F277
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Dec 2025 16:12:17 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dSZGn46WXz9t8x;
 Fri, 12 Dec 2025 17:12:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1765555937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QdS1ZAGfkj/oaJ0y0rvKpks+4DzCwAcCHy6aizvcu8Y=;
 b=thlVswEny2mqIChxvH2Ka76fkAQdW62uKD3lMi5UELwt5iVEd+FXEaFl7+JDWtBb03NJ2g
 a8NKwXtNv2Agb2H4YKP7BQJTdHkQjbeGzpYMOouN8KXLNeSE79Hd8h0VtsnFRgNyL/6zEI
 LsvHL1OdpmQYTGqzQFqdK0HiBBQdlIaFrArj2c1exToirE2SzmC53MoQkilZUdmYNZZWHY
 8CJK8N/I6j8usNHR5619evg1qZqhUoCloFJ7Z8hy8/Um5PGB+W+9Y85Qh9wEo6Ui5cBKT2
 X+6SZgy0rHerOoBj2IVyH+tkMpW2KwGoxGrrf4TvX3ok37OTicekoZLm/XLsTQ==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=Akgyreld;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::2 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <b9fc4f8d-b10d-4308-bbe0-ff871fcdc940@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1765555935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QdS1ZAGfkj/oaJ0y0rvKpks+4DzCwAcCHy6aizvcu8Y=;
 b=AkgyreldVCRlXPhBZ1gA0JOl/q5u9rbYYCUR22021NWI+Bvxwc927/A/Da9EuNmUoYw16l
 XpLg6m3NXxT4WkWu98dgp5ag0v8Guyr4/jIWOILm6rStn9gqkWXP0kTuRLuejVIuT7Z667
 M6oIhvh3Q3VzhjMDhuajQ6jhQ/Gr5krJReHAvAf5TPv88tIaAEgbxPeKcdNwFWjzdQqSJc
 RerppHeQyAlkMN6sSWHD1smfzRblsHcdMayC/PoWhqvbm6o+f4Q/aXVji9bgE4GbwSl8Ei
 HGwkfFwqx7YgFUug6sLa3Xh85WfZ8Yqks9b8TVFLmqzOYVlSaEsugEKpiIkzSA==
Date: Fri, 12 Dec 2025 16:36:48 +0100
MIME-Version: 1.0
From: Marek Vasut <marek.vasut@mailbox.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Peng Fan <peng.fan@nxp.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>
References: <20251211-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v2-0-44e6e7de2beb@foss.st.com>
 <20251211-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v2-2-44e6e7de2beb@foss.st.com>
Content-Language: en-US
In-Reply-To: <20251211-restore_boot_for_stm32mp13_stm32mp25_boards_v2-v2-2-44e6e7de2beb@foss.st.com>
X-MBO-RS-ID: f54fa8c5ef8d8d5a76c
X-MBO-RS-META: jfei55qixhc1sig1rkgyq1qxkzjh3doc
X-Rspamd-Queue-Id: 4dSZGn46WXz9t8x
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

On 12/11/25 4:52 PM, Patrice Chotard wrote:
> During clock's registration, clock's name are used to establish parent -
> child relation. On STM32MP13, most of SCMI clocks are parent
> clocks.
> 
> Since commit fdb1bffe2827 ("clk: scmi: Postpone clock name resolution"),
> all scmi clocks are named by default "scmi-%zu" until they are enabled,
> it breaks clocks registration and boot process for STM32MP13 platforms.
> 
> By resolving SCMI clocks before clocks registration, it solves the issue.
> 
> Fixes: fdb1bffe2827 ("clk: scmi: Postpone clock name resolution")
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

Shouldn't the relationship between RCC and SCMI clock be described in DT 
using "clock" property and phandles / clock cells ? Once that is in 
place, you should be able to resolve the parent clock using that 
relationship described in DT, without the need to explicitly do these 
SCMI calls in RCC driver.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
