Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A8DB262EA
	for <lists+uboot-stm32@lfdr.de>; Thu, 14 Aug 2025 12:39:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0709C36B3F;
	Thu, 14 Aug 2025 10:39:01 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D40EAC36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Aug 2025 10:39:00 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4c2hYc1wsPz9sqf;
 Thu, 14 Aug 2025 12:39:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1755167940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nsNlsHpVNvmEmj4c7d4O3ZQez3/FMCjGBXsM2bTIvTg=;
 b=l7k1MHYV2mYx5h/E4gOxl/bVQ+NsaHjryqlC0xQuaR/jIMmP61HQHXtikzfocZF36jieBR
 WyW1r2WX2vmv+jSxq/0EG4/0hZ2BzD/OZEsVNfyq+XGRfUiMWGH8MZKGb1eoWIcvidpw7m
 /nJESC+KwB+VcjeMYS3xHnq3NhRKKvFzQCrE7/eKIKiI1qQUFMf6PFlcXOrZPJ4mFhcX1B
 o9Zy17dY5PEllv+01oIQdolvpqPEJb28pzTWgokk4MExzfb0yiKbTLLkLJ12+RcaXDbwu/
 4JXZ/EkE8Fe6V7CdlJmk/A0onuXAKR7IspzcUMZc+Ca2gawWvfhOEKgaCOiW8Q==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=VjgPQbqv;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::202 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <c2816793-b8dd-497e-b967-3c5f70d87323@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1755167938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nsNlsHpVNvmEmj4c7d4O3ZQez3/FMCjGBXsM2bTIvTg=;
 b=VjgPQbqvhhAvjPVQrBOCn6+oilMe1tX4gFpb1To+q5yrlJjUeHbppuFJX2qoAQIZ+YC82F
 Wu0TvOJzcqZ5ujzE4fYSn/oM1t3QK/9PTmVJI4fpMrn50jpwblNid5ofZwpYU3YiED9flX
 +00MvIQwvTRZ0ATobt2pGlGXCAgs5wzk8R1p4BcaRZl45vBuFSND1BCyR/L8BghZMSOTV8
 SEnm/wfC46UiWbhFaNAK0kzW0k9J8X7UvBNPEMB8vXrZEa0Ei28gfeytqOv6jGVKkk9mNG
 1ENK4gwsM0BLp8rswrdmKDdrNFmvCj6anOZYLzjnSVIO8ww6azJ9kVBY4TFG6Q==
Date: Thu, 14 Aug 2025 12:38:55 +0200
MIME-Version: 1.0
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20250814094116.1351454-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250814094116.1351454-1-patrice.chotard@foss.st.com>
X-MBO-RS-META: bwfedyk8s5rzyc58znr5148ofmoam953
X-MBO-RS-ID: 8cae7696c1f5d341a05
X-Rspamd-Queue-Id: 4c2hYc1wsPz9sqf
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32mp25: Enable
	OF_UPSTREAM_BUILD_VENDOR
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

On 8/14/25 11:41 AM, Patrice Chotard wrote:
> Enable OF_UPSTREAM_BUILD_VENDOR and set OF_UPSTREAM_VENDOR.
Because ... why ?

What kind of sloppy commit message is this, you surely do know how to 
write a better one .
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
