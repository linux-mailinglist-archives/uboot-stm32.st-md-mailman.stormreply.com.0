Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFBC58E07B
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Aug 2022 21:51:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7ABACC03FDB;
	Tue,  9 Aug 2022 19:51:25 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7B7FC03FCB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Aug 2022 19:51:23 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-329dc6cd13aso52873927b3.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Aug 2022 12:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=96QxloQPnqL1DvpptKziFgLv3Hy24X2R0WZBZODS3IE=;
 b=oX+F+pwHUPKxeiHBdkt4VltINMx6eGkkms5N9gyjtZ6/j7x1EWcmWqFYlmUrjpCwds
 9/gnh7yBVL122659WPd8XVQlNMsOjwywF93NakXM/wmoLNdR4igmbue+lrfZx9vX5gAF
 ayR6+TrqB6TW4DTwnV2bImS0XMRwX7ES59iE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=96QxloQPnqL1DvpptKziFgLv3Hy24X2R0WZBZODS3IE=;
 b=8QP68GD7EzQEGqL2CQX4AeLOU61duvgHN1IU28S2fPwNaE19eLiBCB3Br6rPC8Y/wI
 /9gqfBGld82ODdStYV8vNfI71roFceDVev50iGGVrN5ifpspurg2h+ABphHKZhv36nPg
 CoxjsoqicbJttOuhPQRy8ALpd5Uq25udNH6vJOI97hRD/i38R6aBpDSOR1Dd+kXhs/tX
 AIPtAum+mtxO6IN/oqdcZcddbZ+4pXjBG21SpHLX3fIZ24dnSm/LLJKgoXs4ryeSniBf
 8UIgDUTPme8IFuOfAU4I02Kv/fom/DAQaaErcbwJadJmIqoIjZ5aGXIp7CZNwladHQVM
 7iAA==
X-Gm-Message-State: ACgBeo3sVjfIMHOMRIHjdyMW4gPcMyDIpDAVq93WXWzmJN41bcA0GzeJ
 0BGspxSr1dB6nyT0zarMujuOFUaA8CBDgH8b7iKLXQ==
X-Google-Smtp-Source: AA6agR7T7Cyc7jyuJP7ImLEYy99z4B3J+FHvV5NiakAdRIMYpPtMTCCPSEcjXPirgY1JWsxwyjT/JG0GU9rWUgD3wYo=
X-Received: by 2002:a81:7bd6:0:b0:328:297a:f31f with SMTP id
 w205-20020a817bd6000000b00328297af31fmr25057086ywc.469.1660074682565; Tue, 09
 Aug 2022 12:51:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220809071415.366133-1-patrice.chotard@foss.st.com>
 <20220809071415.366133-5-patrice.chotard@foss.st.com>
In-Reply-To: <20220809071415.366133-5-patrice.chotard@foss.st.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 9 Aug 2022 13:51:09 -0600
Message-ID: <CAPnjgZ2_JrVFuUFnpWhFgJ9O5Cj0cdgp=eV+M2mfBj7YGS0HmA@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Samuel Holland <samuel@sholland.org>, Andrew Jeffery <andrew@aj.id.au>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 4/4] gpio: sandbox: Add GPIOD_IS_AF for
 gpio configured in alternate function
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On Tue, 9 Aug 2022 at 01:14, Patrice Chotard
<patrice.chotard@foss.st.com> wrote:
>
> This allows to test if a pin's label if displayed using gpio_get_status()
> when this pin is configured in alternate function.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
> (no changes since v1)
>
>  drivers/gpio/sandbox.c                  |  5 +++++
>  include/asm-generic/gpio.h              |  1 +
>  include/dt-bindings/gpio/sandbox-gpio.h |  3 +++
>  test/dm/gpio.c                          | 30 +++++++++++++++++++++++++
>  4 files changed, 39 insertions(+)
>

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
