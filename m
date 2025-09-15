Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2AEB56D23
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Sep 2025 02:07:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4374AC3F956;
	Mon, 15 Sep 2025 00:07:37 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B651DC3F93B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Sep 2025 00:07:35 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cQ52F1SVcz9sq0;
 Mon, 15 Sep 2025 02:07:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1757894853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XtmDfC/6/MJ22QaAsiDGpERgOy8599/6kH1Bb//AYWU=;
 b=HsjScWq8lD9v3spF4xAQ0tV5yIJbWo2PPFngtUQHmOTrxTThFJzGxm0NmoseZ90i7nxnBC
 ENhGBK1UnxEdwtgGmkn7AQbK29SH9GLARUFWOJNxAUlVTvYt+yU/TtTryUUBADucfG444L
 5BU8f9DMKteUpSbBMM/7mQOHZDazowiuAE1TomXaEiKrXZrnxj7bs+o0iCY18a7+MhUFuW
 L/7nT/ncyaV6zl2K/Gu716xzBnX3CJpJrAG5/5vRVBiEBDhTBtivc6I+OvChVnBhDpgLiD
 bTEfDRenR8VZZe1wpcJ2HEqV7ys67pSVWmyfd6LP05f9ROge6zSYLgkagg/6gw==
Message-ID: <7858181b-5558-4249-b9fb-0d17ea5b348a@mailbox.org>
Date: Mon, 15 Sep 2025 02:07:28 +0200
MIME-Version: 1.0
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20250808151154.472860-1-patrice.chotard@foss.st.com>
 <827b1b5e-ac74-4710-8424-5bf0390441f6@mailbox.org>
 <9c805dc1-fc95-4d01-99cf-306264fd4b2b@foss.st.com>
 <905b7b4b-a216-4bdc-868b-5b38efb61317@mailbox.org>
 <d7d281a2-69c4-4bc3-8392-dd772f889a18@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <d7d281a2-69c4-4bc3-8392-dd772f889a18@foss.st.com>
X-MBO-RS-META: on676m8xno4kusj86m4dcs58zstdmgfq
X-MBO-RS-ID: f7a98bb78f8a4cdee0c
Cc: Tom Rini <trini@konsulko.com>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Alexander Dahl <ada@thorsis.com>, Cheick Traore <cheick.traore@foss.st.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Utsav Agarwal <utsav.agarwal@analog.com>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 John Watts <contact@jookia.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Stefan Roese <sr@denx.de>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Subject: Re: [Uboot-stm32] [PATCH 0/5] stm32mp2: Add SPI flashes support
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

On 8/20/25 3:11 PM, Patrice CHOTARD wrote:

Hi,

sorry for the late reply.

> If you refer to my previous e-mail with the stm32mp257f-ev1 boot log,
> with the following upstream components:
> 
> TF-A: v2.13.0-304-g000fe221b8

It seems this is missing PSCI implementation entirely, right ?

> OP-TEE: 4.7.0-26-g847ee2932

This does not implement SCMI, does it ? Does it need SCPFW or something 
as an external dependency ?

> U-Boot: v2025.07
> 
> I am able to boot a STM32MP257f-EV1 board.
Were you also able to boot further into Linux with this setup ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
