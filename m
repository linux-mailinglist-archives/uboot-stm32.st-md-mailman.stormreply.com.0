Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BB380D4A6
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Dec 2023 18:53:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0F2BC6B458;
	Mon, 11 Dec 2023 17:53:06 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3587DC65E4F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Dec 2023 17:53:06 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-dbc662854adso2007678276.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Dec 2023 09:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702317185; x=1702921985;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=petkZ4p0QHcTWt9NS/GnWE9K1OqBj6pxmd7IMetzKRY=;
 b=EYN4PPuNc7SXzVziP5gQQSoFTuXrtMRKhn2xqP5YEW/4ITr1BPSPX/PLnS7uEEbzNO
 FSwj3nEAlYy8Pi/UYTlIQWHye5P9J9RXmgXmYBp9Ascb4p5GWraBxCieSYVa4ENwtxa7
 rJHAFUBAJFpNMFNNXnsBNOW1UP9/zDdgWPyn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702317185; x=1702921985;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=petkZ4p0QHcTWt9NS/GnWE9K1OqBj6pxmd7IMetzKRY=;
 b=ldzhIIHdsLxGKAB7eJnDjJZyd4pltuClBWuPH3UT7/nY5uiF087YDP6tBhv0Rv1XpG
 nrTyv34TL7Qlx4mUIEwBM57LzHCd1nW67HJLBVHC+koumCTya/wIlOr2/nj4FaAUOjrV
 TxaCg88PgwCBvHxYaA8fqgGg8qIKSzVbJd4/IEJiz4Vw2TEZISu/ZWDrd5kS+UIPq7M+
 eoC/aW6+IC+TLxRBVbLnIcYz7iiA/dxGNLFqoVNN0u3A7yc8hyJDXH+CqoMX0CRdy105
 kwpppvZ+yurDMHERVe2cJ14RzEvqXZje9gecjEBAYKCLx0XUStpR8PJgvZDtk2wap62T
 UwZw==
X-Gm-Message-State: AOJu0YwHq1qz/qtCIINixg/vEDilPdQEZVp028PQxiMxH3gCslNNyQDs
 q/nrUe2LXXM28Zt+Apz2igGxQBLH+9AQecNcrmIIwg==
X-Google-Smtp-Source: AGHT+IE5C6SV8FY1TgUWxLBQnkwywB/6/VPxotRdso8ZB5NnNiYcnbjXXGnuc399jw/mqJCO9pzE0vsrc5K0tQv9AEI=
X-Received: by 2002:a5b:50b:0:b0:dbc:b0f2:94f8 with SMTP id
 o11-20020a5b050b000000b00dbcb0f294f8mr525564ybp.108.1702317184845; Mon, 11
 Dec 2023 09:53:04 -0800 (PST)
MIME-Version: 1.0
References: <20231204002642.895926-1-sjg@chromium.org>
 <20231209190932.GZ2513409@bill-the-cat>
In-Reply-To: <20231209190932.GZ2513409@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 11 Dec 2023 10:52:07 -0700
Message-ID: <CAPnjgZ2qtrJZQ=x32Z9ESsYkhRv+1aseHSpoJo9_VW8_uN+guA@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Alexey Brodkin <alexey.brodkin@synopsys.com>,
 Eddie James <eajames@linux.ibm.com>, Rick Chen <rick@andestech.com>,
 uboot-snps-arc@synopsys.com, Max Filippov <jcmvbkbc@gmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Andy Fleming <afleming@gmail.com>,
 Stefan Roese <sr@denx.de>, Marek Vasut <marex@denx.de>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Angelo Dureghello <angelo@sysam.it>, Sean Anderson <sean.anderson@seco.com>,
 Thomas Chou <thomas@wytron.com.tw>,
 Angelo Dureghello <angelo@kernel-space.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Scott McNutt <smcnutt@psyent.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Wolfgang Denk <wd@denx.de>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Alison Wang <alison.wang@nxp.com>,
 Safae Ouajih <souajih@baylibre.com>, Michal Simek <michal.simek@amd.com>,
 Leo <ycliang@andestech.com>, Nikita Shubin <n.shubin@yadro.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 U-Boot Custodians <u-boot-custodians@lists.denx.de>,
 Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Chanho Park <chanho61.park@samsung.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 00/18] Complete decoupling of bootm logic
	from commands
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

Hi Tom,

On Sat, 9 Dec 2023 at 12:09, Tom Rini <trini@konsulko.com> wrote:
>
> On Sun, Dec 03, 2023 at 05:26:16PM -0700, Simon Glass wrote:
>
> > This series continues refactoring the bootm code to allow it to be used
> > with CONFIG_COMMAND disabled. The OS-handling code is refactored and
> > a new bootm_run() function is created to run through the bootm stages.
> > This completes the work.
> >
> > A booti_go() function is created also, in case it proves useful, but at
> > last for now standard boot does not use this.
> >
> > This is cmdd (part d of CMDLINE refactoring)
> > It depends on dm/bootstda-working
> > which depends on dm/cmdc-working
>
> Since I would ask "what's the size impact of all of this?", I went and
> checked. I rebased your current cmdd-working branch on top of current
> next, and compared. While I'm sure this will change a little given
> feedback so far, generally platforms shrink a little (probably due to
> the bootm args stuff you dropped, but may need to keep). The only big
> growth I saw was branch specific and your "rpi" patch, oh yes, that
> grows rpi_4 given that you change a bunch of stuff there. So that
> doesn't count.
>
> So generally speaking, I'm OK with this series up to cmdd-working, and
> will continue catching up and providing specific feedback.
>

OK, great. I have had a busy week but may be able to catch up a bit on
the plane.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
