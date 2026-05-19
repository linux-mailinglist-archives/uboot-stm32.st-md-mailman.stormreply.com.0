Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDrvAGV0DGqihwUAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 May 2026 16:32:05 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B52F58092F
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 May 2026 16:32:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E672C8F294;
	Tue, 19 May 2026 14:32:04 +0000 (UTC)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8B73C58D7C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 May 2026 14:32:02 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gKcZB1KTRz9tqB;
 Tue, 19 May 2026 16:32:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1779201122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hdwmc906PsQV0hMnlT3rzjGujx/nSOcOVhIZdaWSdrs=;
 b=K1Du94IEeMiXy1fgfYhSaKXwGKICXG8+G2jVX899DrsTyCiXSijYApBwZqBX5wFYRiyy5p
 jj/eZdSnyRLnBbCqw+sbvgDovTB3yf48Xy8bNGcieUfif1Erud9Cv1C303WQytLNdRPhwX
 580EYkvewhpxWoEEZgwFWiAGI20Vu39oG6yAfN3ai7l6XFsyEOtubGv+amMcO9C0fp5bOp
 tblGDG+F5c7Nco+DgSz1bAXQWhSUppiPwkYWK60c+QDrSSGMKfCBkZC45sAy0MIPnKracl
 h+KR40rlWFYONqo8AhO5fxLWTo0P3sO5zPZf9FuA/QR0owuH5pLbM/DrdvS/8Q==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=KN4uYc6S;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::2 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <101a1835-657d-424b-aa7c-7aa75bdb436a@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1779201120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hdwmc906PsQV0hMnlT3rzjGujx/nSOcOVhIZdaWSdrs=;
 b=KN4uYc6SunYPZNEy6y/uDVhmDP5MtMQ2OPIdnGnemdr7flDt32aewwWwtYvQ3IjhraZVCf
 rO5i9Pguleyl2YTKK549vy/1l6OvUuK1tjyB8G4zgMW4Vm4DljSHSRidPDQBONT2jxakIs
 jEKVIPdCwNvNV7sIyb859KyUHHS8D3o350oq6QgLRcacJJxycxPB4rW4JuwxCFKNuji+g2
 J9fWftkhnjqFZ9XB7c7fAQNDIAKHPrkFKzMqUcXXOcBd+JZktFRXIeEACimnLfcV/gIycW
 vRwXDNuviPrQkVVGKK36A52agRUwBGq6mqrL2FCq1+eJWLIBhhQo4ZmBU3x9zA==
Date: Tue, 19 May 2026 16:31:52 +0200
MIME-Version: 1.0
To: Yann Gautier <yann.gautier@foss.st.com>, u-boot@lists.denx.de
References: <20260519080737.47928-1-yann.gautier@foss.st.com>
 <20260519080737.47928-3-yann.gautier@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260519080737.47928-3-yann.gautier@foss.st.com>
X-MBO-RS-META: w8z1r44tick9fkf5tjqeoyk1zpxbft1k
X-MBO-RS-ID: e35b7e16bc2f7c73c4c
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Peng Fan <peng.fan@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/3] configs: stm32mp13: activate watchdog
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:yann.gautier@foss.st.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:peng.fan@nxp.com,m:patrick.delaunay@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[mailbox.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:mid,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 9B52F58092F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 10:07 AM, Yann Gautier wrote:
> Activate the watchdog for STM32MP13x.
Please expand the commit messages , this blurb above tells me literally 
nothing. Which watchdog are you enabling ? Why is the current iWDG not 
sufficient ? And so on ...
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
