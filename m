Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B14B1EBBD
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Aug 2025 17:24:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E199BC3F953;
	Fri,  8 Aug 2025 15:24:57 +0000 (UTC)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D01C8C3F952
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Aug 2025 15:24:56 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bz7BJ00MSz9sjF;
 Fri,  8 Aug 2025 17:24:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1754666696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gmk42PmiqaYuU28xvXAoRfgbqLcn/eaXEmic69dLSeg=;
 b=v/RHvlFg/M90cfcWm6uiMIqQNm0Aa5BuSl0h9stny/nEiRRtxk1c1TCdxCaAS/9i5T0i+C
 0SEFhJcqh4pr00cbQ567mX2CsDJLaGPmo2QZN5Yo/T0GuzYZKo6AZPdBkiFZwNnaVo+6HY
 pprzXuPOQ+TMS0CM+nlVvAtlWo471zG+pU+gF7khUKYmkj5X0EMSGO8m0c8Nx7i3srXK0y
 I0Hmr0Hb1akcbGm73ZoAaouEVe1/kGP9tM7QA4aIVOPzi09ihFx3Dcd5TWUYRIYSetB4IG
 U15eNaYh+E7YlNL/41quYVdAvURY3Bna5IrDgImUvbs9zgZ+aU+I30j11JNYwg==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=oU+j0hc0;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::2 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <827b1b5e-ac74-4710-8424-5bf0390441f6@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1754666694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gmk42PmiqaYuU28xvXAoRfgbqLcn/eaXEmic69dLSeg=;
 b=oU+j0hc0XHjrnzXWZI6eRZwIi80JE+stXu1Hrcn9Ts+iWI9vCq2MCEs8ZRWWjcJ/z8wY0u
 6keb9ibiNcxAeiGLA1TSVAdnriXbTYfE6zYbCFjqeSgLTyAAUmvQpqK/un5ImY0x6IYz4K
 4QSxLw3qv8iSKYDGxHv/DNgql/LiXfq4DbCORdRniok8JzQicg+1fzxb7yo0JyOxeVad/Y
 V0mq/IL/EtKPGcYETXQJqRqE/mv3wfZllU6idEHiIy9efNE1TfKDOZ7wUUHDUB9KBPW1zb
 WPZsmbCRWljn4z06am3zeGFdRa5OpLWeylPCdg3EV4CGldYTkQYzN53sKafRJA==
Date: Fri, 8 Aug 2025 17:24:47 +0200
MIME-Version: 1.0
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20250808151154.472860-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250808151154.472860-1-patrice.chotard@foss.st.com>
X-MBO-RS-META: x5ri4dxxcbzxg67kywxh7c4dm3eq59tx
X-MBO-RS-ID: 073dbef761e08948977
X-Rspamd-Queue-Id: 4bz7BJ00MSz9sjF
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>,
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

On 8/8/25 5:11 PM, Patrice Chotard wrote:
> This series introduces 2 new drivers:
>    _ STM32 Octo Memory Manager driver
>    _ STM32 OSPI driver
> 
> It adds resource check helpers which are used by OMM driver.
> It adds and enables OMM and OSPI driver support for stm32mp257f-ev1 board
Can I test this with mainline TFA and mainline OpTee-OS ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
