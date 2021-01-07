Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DB52ECFF4
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 Jan 2021 13:37:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1C4FC56634;
	Thu,  7 Jan 2021 12:37:12 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD2F8C5662E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Jan 2021 12:37:10 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id s2so7226234oij.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Jan 2021 04:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TP0tCIhCGBOSMb5cBucC3u+1DADXqZYsNiTGA7HZ+m4=;
 b=ayVxtGNhUQ7aSEH39JT/CmR/9dQOLDs5M3n9wPXhxsZAU1tjpqR2W3jIhc8QkxfmT+
 p1YTlBUK2O4sa8Eo2WqJiMSKFO3Xbt1s+xcvFF24rXjE3OnxmFr6B7lMbIQvKL0VIt2X
 DTE+OwASLL8JSP0vxzW6Ta9mMZjvqeGS1FWqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TP0tCIhCGBOSMb5cBucC3u+1DADXqZYsNiTGA7HZ+m4=;
 b=ATDWzSVcIG7MSuw7YAv0PcwxkMKHZVuzOVZXuQE8isj5fUB/hAR7eGncJzBbo65o5y
 zMPvvc0qDOhF9gNfK4SKvfnasff+XDwlJtYqcwe3MXV4k9esrCUPeS/GAo62NyiAv+Xb
 tQ0MdWVf+CNuaWDSG3Gmm+2OobN1TRAkhN+D122H1V/1aDYunWtO0RnRZkA0Kja8LgHa
 CgYHe7eGGOasraT6yB5PQVWy/Ae2nmhqnKRG/Xs/1o7iT4+6d8sIOqX/h5Y++2/niJyH
 NcK+5ZBuyh66+Qu42jKIjFnEL/iCsPvKbzWin7PKM8PrEIdBP19RDbiDCQiPw/bdKivD
 9w9A==
X-Gm-Message-State: AOAM531F7TSK9ZqOZ6L2T6UeX73R01TwICsB0eafTjYGa1/6TsBjvVnb
 SCeWel4dro+lIZ9j0X19UAH4OhqiU9KJ16OvePqy8g==
X-Google-Smtp-Source: ABdhPJxWxvi6rO+orLlAFDBwvamycXhdKGUP4wyDI3f8sSohZl1dVO7GvlTuM1hX9yg5W8mn9teookgRAvf7vHbcC7s=
X-Received: by 2002:aca:c3c3:: with SMTP id t186mr1175768oif.53.1610023029379; 
 Thu, 07 Jan 2021 04:37:09 -0800 (PST)
MIME-Version: 1.0
References: <20210104153315.1.I3168dfa428bf48b85ecca07ef26eed5d2c0a494d@changeid>
In-Reply-To: <20210104153315.1.I3168dfa428bf48b85ecca07ef26eed5d2c0a494d@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 7 Jan 2021 05:36:17 -0700
Message-ID: <CAPnjgZ3Rz8EFFT0QKQkpdXd=qtoh8bNqbzvYmpGvpQqfReAYyg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Stefan Roese <sr@denx.de>, Andrii Anisov <andrii_anisov@epam.com>,
 Reuben Dowle <reubendowle0@gmail.com>,
 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Michael Walle <michael@walle.cc>,
 Joao Marcos Costa <joaomarcos.costa@bootlin.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, Keerthy <j-keerthy@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Uboot-stm32] [PATCH] lib: cosmetic update of CONFIG_LIB_ELF
	description
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

On Mon, 4 Jan 2021 at 07:33, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Change 2 typo error in CONFIG_LIB_ELF description:
> - Supoort => Support
> - fir => for
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
>  lib/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
