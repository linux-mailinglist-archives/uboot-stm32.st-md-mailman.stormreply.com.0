Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21002A2EE9C
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Feb 2025 14:45:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC69EC78F8F;
	Mon, 10 Feb 2025 13:45:30 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B11AC78F8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2025 13:45:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1C8E81038010A; Mon, 10 Feb 2025 14:45:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1739195127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sWGbjvx+OO75I6IEP5m3eFjyF8Oca9QDjjw8cS57aec=;
 b=eSjmbaV7SEbVf2mbAKNrXPLc8VE/vSsR8sEY9vofAf8KaSNhhb7d8MtPhqzVmDL6pAAm0L
 V0jkFJroTEmYsu4htu0rBVFN2XQh5S9l/J9pKCUwZSRGKzBHa1xjIMYcQ3x6UD17bRiv06
 WSQ6675gsg5UTWfFAsYt/2VJkifvYI+WUZPQdq0Wwr0tMHhF9txTwXwMA4VOJz4aOyfi25
 as24YW7Hb23yysNS0pvANXlHrtpEqA9TTyPQezq1QLoVW+Pzy5SxHDztubmu21BxohZDik
 hw/EgTktjYpopLbocibYwU6mCbLe+aK32nyWxzfrn7qf11bdty/ducm2MUkcHQ==
Message-ID: <c8790ad9-0e81-4780-8da8-bbc06377c360@denx.de>
Date: Mon, 10 Feb 2025 14:42:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20250130163547.512990-1-patrice.chotard@foss.st.com>
 <4492fe8a-1b60-44da-93b7-383eae3fa269@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <4492fe8a-1b60-44da-93b7-383eae3fa269@foss.st.com>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Tom Rini <trini@konsulko.com>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Jan Kiszka <jan.kiszka@siemens.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sjoerd Simons <sjoerd@collabora.com>, Mathieu Othacehe <othacehe@gnu.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 Robert Marko <robert.marko@sartura.hr>,
 Sam Protsenko <semen.protsenko@linaro.org>, Simon Glass <sjg@chromium.org>,
 Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: Re: [Uboot-stm32] [PATCH v5 0/9] Restore USB and add UMS support
	for STiH407-B2260
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
> 
> Hi Marek

Hi,

> Any chance to get this series merged in next U-Boot tag 2025.04-rc2 ?
Gadget stuff is on Mattijs desk, please ping me in a few days if he 
doesn't pick it up, I'll do so then. Sorry for the delay.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
