Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E67D14D521
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 03:18:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5877DC36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 02:18:06 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4444C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2020 02:18:03 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id l18so1189090lfc.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2020 18:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AYk0BtETBwaNW8bUM7ZUWcR/i1reBxhsvd+K4ehzQLs=;
 b=G2b3Sfb6o0pDAPj79YdLNXI4mkI4EjkpOAySmrW6YxTUZhAjerzSHagl4PCMgqSq2D
 rJw7MbqOr0fXKW7MI2+Scp2pLkjubR1N1uY86zJQJU4wNDDVe8YxwxTUibhkWvQOu4IS
 QEoRMVFQThnNh4PNRs+ztItAfHMiZ1I5HK9ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AYk0BtETBwaNW8bUM7ZUWcR/i1reBxhsvd+K4ehzQLs=;
 b=FtveLkhHkSbWedp8SAZJp8V5AdfduWoi0eUHQPiJnkpEP+p4Io2xo62hd1CEZIH8PG
 cSWq4ZZbTnUQdiHwwpNRmKx9vH1TouXGW8CQuI7yIfySDTyYhHX2vemhLKxl3S4jq11E
 jwBpilxrJkh52oYUfhoaAktRj7NtX6usUknVfq6SVTXcWgM2XTuJdeg0wOxjLKrWpQdE
 CuHmgGaP3MkPcNq//e0a21AEAKoaauvevrQ2furrzAPE9k6r/+8MPqvVwhFC5e3dm7V7
 FGXnvwYoeNz/Znk5/YGOwUzjEmnsbSEbsE1awKcm/QUWY0g/OcjCDSVDZtFpaC0amxaM
 hCzg==
X-Gm-Message-State: APjAAAXhyNRMFlWZqlreM43Cc0MtMX+Jfn4dBcNwBUX8sUXcsvJ6ezeZ
 WrVRcVzdhpu2rjjGXANnEE19pww404QaESZxZw6NSQ==
X-Google-Smtp-Source: APXvYqwJr1edqXNhwM/kkae8OBT/H6SkpWm8wpCH6mgHT/m0rHjeHrvE3+YOFzQQI6E8bBcUnCCbQoGcolB4MN4R/Hk=
X-Received: by 2002:a19:4a:: with SMTP id 71mr1253222lfa.50.1580350682878;
 Wed, 29 Jan 2020 18:18:02 -0800 (PST)
MIME-Version: 1.0
References: <20200124123346.32210-1-patrick.delaunay@st.com>
In-Reply-To: <20200124123346.32210-1-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 29 Jan 2020 19:17:42 -0700
Message-ID: <CAPnjgZ3=FfN=f8NFQ=5mw+L8DNsENpNqswk5XxZSpdfTx0WPDA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Anup Patel <Anup.Patel@wdc.com>, Leo Ruan <tingquan.ruan@cn.bosch.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Frank Wunderlich <frank-w@public-files.de>, Lukasz Majewski <lukma@denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>, Ramon Fried <rfried.dev@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/5] cmd: env: add option for quiet output
	on env info
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

On Fri, 24 Jan 2020 at 05:34, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> The "env info" can be use for test with -d and -p parameter,
> in scripting case the output of the command is not needed.
>
> This patch allows to deactivate this output with a new option "-q".
>
> For example, we can save the environment if default
> environment is used and persistent storage is managed with:
>   if env info -p -d -q; then env save; fi
>
> Without the quiet option, I have the unnecessary traces
> First boot:
>       Default environment is used
>       Environment can be persisted
>       Saving Environment to EXT4... File System is consistent
>
> Next boot:
>       Environment was loaded from persistent storage
>       Environment can be persisted
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  cmd/Kconfig  |  1 +
>  cmd/nvedit.c | 26 +++++++++++++++++++-------
>  2 files changed, 20 insertions(+), 7 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

We could have a test for this command
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
