Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +O6/NZ4pDWo8twUAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 May 2026 05:25:18 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AA5587354
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 May 2026 05:25:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 917AAC8F294;
	Wed, 20 May 2026 03:25:17 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 154B5C36B3D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 May 2026 03:25:16 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gKxkM47Lxz9v7k;
 Wed, 20 May 2026 05:25:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1779247515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E/tNt6l0fb/5hD2ExtbExbKlL6BMKqJjoA317m7bKvE=;
 b=SWSrJcnmiM6F45V3uxfg8Lg8rMwuT/VqXcbZIV8Bl+ZxGzuAk6oLNWejD5xxiw3JtNFGzs
 OC5LxP3OGfrwwLfVAj6d+CCIv8Axbno2J+8kVEGiKJFB5BSRIupCEgBquuV+gEXkKGEDxS
 vEnlhvj1/C13c6vNCD4zovJaQWgE04czwl5XZb63bhFuQFMYeT+egVygMjYfSxeBZjDBbI
 bliEi/DEVA3WG/9PO6Ptc2o3s0MKnIB0yOuSJNAe/vhQdStDHbyOndYbm5YXZyGZ044GLc
 VgVhDEgZLRs/rEdNoOxsBpTQAXryowEkaTbKPi8aHr/UY8+Ov5zmJNuWUTVc1w==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=KaeDYcCA;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <990e5ee3-75c7-430d-985f-f146ca8d265d@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1779247514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E/tNt6l0fb/5hD2ExtbExbKlL6BMKqJjoA317m7bKvE=;
 b=KaeDYcCAE61cZFgt49liNhHYFjaJIdiEMWK3rdhhoPm38bMABrmswdl7zze90d/DUvWlJr
 yCd2Uv/pul6SyCrS04Y+9F1qk+Ho80K8YKJQXVWKCVd8d7Qt85beObF0Pq4Qf0AWIqQH5a
 HvzmNV/uB0KUqGdsZ+cZsqUPU1q2sl3mbuJbboyUCpbzm10WjJcxcpVmXRZi9eu4d0aXvy
 gUwe/G8xmX4lrtdvVD45knB2UfEJ9V5iK5YNV3UNlIjQ1P4MO4QakzuL95p2qHRuILfB9q
 o6G7pXea+fq9hEO22oEiou+0Fsf/bWOZKMqXemRfRh9G9Y8OOD7YgnXogysQ3g==
Date: Tue, 19 May 2026 18:53:40 +0200
MIME-Version: 1.0
To: Yann Gautier <yann.gautier@foss.st.com>, u-boot@lists.denx.de
References: <20260519163145.221668-1-yann.gautier@foss.st.com>
 <20260519163145.221668-2-yann.gautier@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260519163145.221668-2-yann.gautier@foss.st.com>
X-MBO-RS-META: fmcyfdc4z8fpgobaxgx1z9yq1166h6ew
X-MBO-RS-ID: b2f8ace11641be63620
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Peng Fan <peng.fan@nxp.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anshul Dalal <anshuld@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/3] configs: stm32: enable WDT_ARM_SMC
	driver
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
	FORGED_RECIPIENTS(0.00)[m:yann.gautier@foss.st.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:christophe.kerello@foss.st.com,m:peng.fan@nxp.com,m:patrick.delaunay@foss.st.com,m:anshuld@ti.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:lionel.debieve@foss.st.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	GREYLIST(0.00)[pass,meta];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 74AA5587354
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 6:31 PM, Yann Gautier wrote:

Subject tags should be:

configs: stm32mp15: ...

to avoid confusion with "configs: stm32mp13:" .

> From: Lionel Debieve <lionel.debieve@foss.st.com>
> 
> Enable the arm watchdog over SMC driver.
Commit message could use extension here too.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
