Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7790B29DF0
	for <lists+uboot-stm32@lfdr.de>; Mon, 18 Aug 2025 11:32:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB91AC3F938;
	Mon, 18 Aug 2025 09:32:28 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C8A2C3F931
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Aug 2025 09:32:28 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4c56tx0894z9sqQ;
 Mon, 18 Aug 2025 11:32:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1755509545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z7rVtP3W+/Xmu+v2OdG8gzcud+cHMvBkgbd/As7dfPE=;
 b=Qpi8ibDQ2/fP2RtJtyk91/fyb6WmPntCm5wsakgspd6h2bmogo7RBUwJMqE3i8z1onxOsZ
 ULA9Yb7rZ56r6Q+3g0fhg/phLQRpabK1MCP/cTj8dh8/p0s8Gov2umJNLeaftfk18+i4V8
 poKPzHbiJSfUrpYP1BlWA9e2qdc6FoYxySIEICpMXRbhR4/mFZs8A9s8tvVWmnKoOwebDF
 7gDKnk01M8Yv114u2L0NoWvm99ZEf46ZdIMOyOz6Ud4fkEBLz0F3iVXtmRAhlqGmyu2QSy
 P/9xXJzFmrOtQXEadSHABB0zP+g5hyT9cmz4F4bzxRK5K2qrpMOFHiQM6GZLYQ==
Message-ID: <ffd1dbbe-15cc-43df-a6f8-7fe02b431b7f@mailbox.org>
Date: Mon, 18 Aug 2025 11:32:21 +0200
MIME-Version: 1.0
To: Patrice CHOTARD <patrice.chotard@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20250723170913.1.I20e0e3d5851ea2e4a22b20be372800fe059cc2d1@changeid>
 <a8dad650-96b5-47bb-807d-27f38b0ab34f@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <a8dad650-96b5-47bb-807d-27f38b0ab34f@foss.st.com>
X-MBO-RS-META: bsx93w84f938kg48qgmeogxqmrwbpi85
X-MBO-RS-ID: 7cbc1666fcfb73372bf
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Peter Robinson <pbrobinson@gmail.com>, Junhui Liu <junhui.liu@pigmoral.tech>,
 Kongyang Liu <seashell11234455@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] usb: dwc2: fix reset logic in
	dwc2_core_reset
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

On 8/18/25 9:11 AM, Patrice CHOTARD wrote:
> 
> 
> On 7/23/25 17:09, Patrick Delaunay wrote:
>> Use GUSBCFG_FORCEHOSTMODE to detected the HOST forced mode as it is done
>> in the Linux driver drivers/usb/dwc2/core.c:dwc2_core_reset().
>>
>> The host polling must be executed only if the current mode is host,
>> either due to the force HOST mode (which persists after core reset)
>> or the connector id pin.
>>
>> The GUSBCFG_FORCEDEVMODE bits is used to force the device mode (for
>> example used on STM32MP1x platform) and when it is activated the DWC2 reset
>> failed with the trace:
>> "dwc2_core_reset: Waiting for GINTSTS_CURMODE_HOST timeout"
>>
>> Fixes: c5d685b8993c ("usb: dwc2: Unify flush and reset logic with v4.20a support")
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Reviewed-by: Marek Vasut <marek.vasut@mailbox.org>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
