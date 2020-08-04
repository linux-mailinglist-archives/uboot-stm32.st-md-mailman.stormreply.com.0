Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2226823B28E
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 Aug 2020 04:01:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF983C36B3A
	for <lists+uboot-stm32@lfdr.de>; Tue,  4 Aug 2020 02:01:25 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 958F1C36B38
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Aug 2020 02:01:23 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id x24so5331528otp.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Aug 2020 19:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a2L7z3ZpnwvzqxnjaApiT/1qobfWRIx3XNPjttVaz0g=;
 b=QjmelwL/i3siyTiW/jTDGJrUVwFhq9SILTs9fjN/SJ1qMJoe3e4RUAKJix4CU9QJxn
 srlTp63bnF38PyMaMA3gBtrMlZ7ldq5Rn50PS4pMlX6C0ei5G43w94fSiRI24RwA1d/w
 4jUzTVNNAYow/RHljYashzSWbiWfmCe+/3XL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a2L7z3ZpnwvzqxnjaApiT/1qobfWRIx3XNPjttVaz0g=;
 b=F/xD1ckmRp866nKnh1wj5IwJUo1wyDvGx3JScTs0ilzaJH1xgcuHuMnF7OeEZeUdU7
 o7bJspXZAmxZSX34Ao5EZkrSHyurs8CHC/DajOOpNYtmTyHgIT+sR2BzTo1JM/Uvtk8T
 bnXzJGffaqj5oG+iY0oHAUDTnreVnXqbVKW8kg4wlNkNpwJnS1TZuiUkwviESgcCvomv
 0T9fIXc8TqqjM/Tk9KW8Na8aXKnEiOD0L+7IlHIJipkaOM86lAoQIItSqLGAEmJO16Dn
 aX3Vix9QX06918WPMeg6zKb3RJpseX+boCE2+kOLp/dPzk3tSTiOFlK4fLlHUw1PH9JR
 xQoA==
X-Gm-Message-State: AOAM533S+3w4DbC55sTwHrahzERBGzT/3xI8Blz9XEobeZij58tAInXa
 x8mni/a6VzJL7aW3TGhTjF1/maGSSbcBC6cEBs7xsA==
X-Google-Smtp-Source: ABdhPJzTIxlDyqqCMDzJUXuOg1MllOC6SZ604QeF12i3hFiXyqSASB2CHZdD2AxYnDJ1Ku9VQeYzW+VsffmzCGjg/iM=
X-Received: by 2002:a9d:a03:: with SMTP id 3mr15312084otg.87.1596506482065;
 Mon, 03 Aug 2020 19:01:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200728071335.5840-1-patrice.chotard@st.com>
 <20200728071335.5840-4-patrice.chotard@st.com>
In-Reply-To: <20200728071335.5840-4-patrice.chotard@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 3 Aug 2020 20:00:30 -0600
Message-ID: <CAPnjgZ1C5uWuLL7V75Vfbn=Kx2avhRN9hJgrUnNQxSBdZHcY3Q@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@st.com>
Cc: Heiko Schocher <hs@denx.de>, AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Walter Lozano <walter.lozano@collabora.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>, Sean Anderson <seanga2@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Wolfgang Wallner <wolfgang.wallner@br-automation.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v5 3/5] sandbox: dts: Add compatible
	string for bind-test node
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

On Tue, 28 Jul 2020 at 01:13, Patrice Chotard <patrice.chotard@st.com> wrote:
>
> Usage of lists_bind_fdt() in bind command imposes to add
> a compatible string for bind-test node.
>
> Others impacts are:
>   - bind-test node is binded at sandbox start, so no need to bind it
>     in test_bind_unbind_with_node() test.
>   - As explained just above, after sandbox start, now a phy exist.
>     In test/dm/phy.c, it was verified that a third phy didn't exist,
>     now we must verified that a fourth phy doesn't exist.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
>
> ---
>
> Changes in v5:
>   - rebase on last master
>   - fix phy test regression
>
>  arch/sandbox/dts/test.dts  | 1 +
>  test/dm/phy.c              | 2 +-
>  test/py/tests/test_bind.py | 3 ---
>  3 files changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
