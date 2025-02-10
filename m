Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B32BA2EE9B
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Feb 2025 14:45:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2B93C78F88;
	Mon, 10 Feb 2025 13:45:28 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8634AC78025
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2025 13:45:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EC59D10380105; Mon, 10 Feb 2025 14:45:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1739195120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kj2+0i0Cojl7wG299okIVbG6J89Wm+zgWmoE2EO5JT8=;
 b=iH3FX8vUOh2uYQr2whVajZSi9ADzGxvTLB/VDwmBi+I7N2sVxjQSHHGDG1DP9aPR6B1X5l
 fN81JTuSJYqWRah1P9KPKq1v31ttMNhdh+Pq6KEEHotF8UjkZcia5EwezoPQ6eLX9gzIJx
 uUjQX893QKJ1DqLQoaQjB2nTGtw1C/Kc3kO9S5xtCh/I+0U7iNeivtp/U4OjqdHeAp4ywE
 eEwFOKF7D5xK59LY9IljS+D00/veh6c6IvsDrJdg/WX5wlj8xvR2gQ/1Jt/xYdt6i7Cn+V
 FwgZkxEdYFt8YqIv3CguufL7lK4WL/9w29UNTD10i2bnztQcEGlrHna10MSzBA==
Message-ID: <f1d2068c-b393-4b90-b923-aa51b0972dc3@denx.de>
Date: Mon, 10 Feb 2025 14:42:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice CHOTARD <patrice.chotard@foss.st.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, u-boot@lists.denx.de
References: <20241202074644.5380-1-patrice.chotard@foss.st.com>
 <87zfldnlmw.fsf@baylibre.com>
 <c89e94bf-0ed6-4b3f-9f3b-eee9d30a91df@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <c89e94bf-0ed6-4b3f-9f3b-eee9d30a91df@foss.st.com>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Tom Rini <trini@konsulko.com>, Caleb Connolly <caleb.connolly@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Lukasz Majewski <lukma@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2] usb: gadget: f_mass_storage: Add
 schedule() in sleep_thread()
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

On 2/10/25 11:28 AM, Patrice CHOTARD wrote:
> Hi Marek

Hi,

> Any chance to get this patch merged in next U-Boot tag 2025.04-rc2 ?
Gadget stuff is on Mattijs desk, please ping me in a few days if he 
doesn't pick it up, I'll do so then. Sorry for the delay.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
