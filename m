Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8D1279D68
	for <lists+uboot-stm32@lfdr.de>; Sun, 27 Sep 2020 04:00:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9D0CC36B25;
	Sun, 27 Sep 2020 02:00:29 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90200C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Sep 2020 02:00:27 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y15so3130460wmi.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Sep 2020 19:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:from:in-reply-to:references:date:message-id
 :subject:to:cc;
 bh=/lzFRJ3kA+WywCoxPbntzOj+RC2zQvLKl2CEfNVCXl8=;
 b=gbhtLcKXaXtndIlfkM0SyWsKfFQVzvXHbAN+NJYfZOeLR20zGNJj1xvgUxkvwjYSjU
 +2uK7PqgUyyKH4Ag7Y47MS7Nizm45g7m3eUYj2/FJCj5G28wW7g9NkV2xK8RExcoic4k
 nEWW4e2UGjRMZQBKgAoBcf8X30USELFZDkZxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:in-reply-to:references
 :date:message-id:subject:to:cc;
 bh=/lzFRJ3kA+WywCoxPbntzOj+RC2zQvLKl2CEfNVCXl8=;
 b=OaLuYrS1V1BbD+3Lux0EvSIH+F+skZmDqSMxBeDTupD2YC8yEYah8uE3v2yNC7BLJr
 6Zex6jiLqcc11WCmSdCJa7Ltu2rTae9R68x2H33TxJlIza92yjbr7AIaUG4EQGei71B1
 KBZdViije/urmYf4MPC9hn/iG8DQAPlmBB2Q9nj2d+PuN1ep5f4Ypy5lbGD/8SnjRUmS
 QY9uGovg86G2HHO+lDYtspYKR/+6zKhrm31faRo6wzekZECKRMDwEgNKSECtuNubkGZK
 ri7+c8QAw1g31BJwfyo3hoWY4NiYN3yYjUBvIrdvn4onQXSKlGyXiDxX5KZFUVh2WXRv
 Ae0g==
X-Gm-Message-State: AOAM533iMBvMPthKN5X/LV3/oJBPXNzY96U1yuGXP/z8EfC6p9xiqlCE
 A11qLbemdLjn3R9ZpCtlVgp4qDCkGO5CVDv0ETP9ig==
X-Google-Smtp-Source: ABdhPJy5qUS3bZHUwgaqKz6hv8UbQozrD5N5kMNwNMzfxirNicRlpwmuCwzyXOmVlo5X/+D3Sl5JSGNnQJaHzMfOu1A=
X-Received: by 2002:a1c:7405:: with SMTP id p5mr4797036wmc.35.1601172026961;
 Sat, 26 Sep 2020 19:00:26 -0700 (PDT)
Received: from 480794996271 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 26 Sep 2020 18:59:37 -0700
MIME-Version: 1.0
From: Simon Glass <sjg@chromium.org>
In-Reply-To: <CAPnjgZ0tuXkNYzUUe7g1AAZ4VOWUyo425yrvx45nnyBsv8=3tg@mail.gmail.com>
References: <CAPnjgZ0tuXkNYzUUe7g1AAZ4VOWUyo425yrvx45nnyBsv8=3tg@mail.gmail.com>
 <20200910104956.v4.1.I2dff760694d84d8bb1f8dc4ec03a5572681e4e8d@changeid>
Date: Sat, 26 Sep 2020 18:59:37 -0700
X-Google-Sender-Auth: cfYMc70JQKkOqvkFsxwuWRMqJCk
Message-ID: <CAPnjgZ1nRgAUvKXseq+pjGY1RJesQzvOEkEOAyPETxWA9mMDRw@mail.gmail.com>
To: Simon Glass <sjg@chromium.org>
Cc: Etienne Carriere <etienne.carriere@st.com>,
 Atish Patra <atish.patra@wdc.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Bin Meng <bin.meng@windriver.com>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>, Rick Chen <rick@andestech.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v4 1/3] fdtdec: optionally add property
 no-map to created reserved memory node
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

On Thu, 10 Sep 2020 at 02:50, Patrice Chotard <patrice.chotard@st.com> wrote:
>
> From: Etienne Carriere <etienne.carriere@st.com>
>
> Add boolean input argument @no_map to helper function
> fdtdec_add_reserved_memory() to add or not "no-map" property
> for an added reserved memory node.
>
> Property no-map is used by the Linux kernel to not not map memory
> in its static memory mapping. It is needed for example for the|
> consistency of system non-cached memory and to prevent speculative
> accesses to some firewalled memory.
>
> No functional change. A later change will update to OPTEE library to
> add no-map property to OP-TEE reserved memory nodes.
>
> Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
>
> Changes in v4:
>    - Reword commit message
>
> Changes in v2:
>    - fix dm fdtdec test and arch/riscv/lib/fdt_fixup.c with
>    fdtdec_add_reserved_memory() new parameter
>
>  arch/riscv/lib/fdt_fixup.c |  2 +-
>  include/fdtdec.h           |  5 +++--
>  lib/fdtdec.c               | 10 ++++++++--
>  lib/optee/optee.c          |  2 +-
>  test/dm/fdtdec.c           |  6 +++---
>  5 files changed, 16 insertions(+), 9 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot-dm/next, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
