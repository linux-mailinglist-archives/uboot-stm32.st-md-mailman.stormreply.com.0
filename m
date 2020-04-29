Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9340A1BE5D3
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Apr 2020 20:05:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B516C36B0C
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Apr 2020 18:05:13 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0D62C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 18:05:11 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id b13so2513630oti.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 11:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VrRzgPlo61K2jZuNyczvEqai0yOGwTVBepSiOZukGzY=;
 b=YlLTgZlrJ8O3u7AxdBoKmC1Dznyi3tn36vPcwwdni/rxeEjkA5PtA13gchQvjSKseG
 AZPme8I1XPMgMvssc+CzT96/Vs1xgme0GX3KD4yvbPcvaxSZYe2ZU91HWJSQsbUJ6/tr
 sXsSsb9x6LUwu6eIdQqyQ2Ct5DG6H8FtKfxbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VrRzgPlo61K2jZuNyczvEqai0yOGwTVBepSiOZukGzY=;
 b=SZWv5nmmJ7paH4aG6hPYI7/F3w8Bn7KH3B6/ebL19CqxGZUZ5qaxC7QMIEEvBgPjkZ
 u9Dbk9FxIT9/z+WdRtN+YXI+b0M9YuuK9no+YwJVfuAsLR9BeFDyvi/ZHLLKrVHwbbKT
 ITRzWMD5QUxB6uxR2otNluXUb9B3xJ6Yq5JBAGE+N3jWpAeY/w+lL9DSnNjCXpZ14So0
 r0ADznZRFDmJvMAZIHsjEZuq4aLpLOCVRrhlk2jKQZbwYB62GAYq7FtC/UU4PVQwqfVF
 +B2dG5S5hZjJY/F4k+KoQ/R2gyysr9Ok6h28t/x0cMkSYO72j9dfsksqU3soRC52iqFe
 JapQ==
X-Gm-Message-State: AGi0PuZqUrRaNTsbk5ltT3OWkDtXOPwN+56hfoTuj3z9w6i3vjAp7rL6
 n2x/pzg3/D23LDBXfgqi3NY51QSeG9rMM8MkYPX+EA==
X-Google-Smtp-Source: APiQypIyH5ul+gURupR64N/lF5/5aU36+a1DnbAgkKA8XoVFmeznTz1LsFcQcMmT92ryG8wv3ltl+OqpIiE/HXXwavA=
X-Received: by 2002:a9d:490d:: with SMTP id e13mr27428710otf.356.1588183510214; 
 Wed, 29 Apr 2020 11:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200429122031.31279-1-patrice.chotard@st.com>
 <20200429122031.31279-4-patrice.chotard@st.com>
In-Reply-To: <20200429122031.31279-4-patrice.chotard@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 29 Apr 2020 12:04:53 -0600
Message-ID: <CAPnjgZ1WE1MkjsnA4P8Ap0jHw0jnnmAqcUJozUGChUXxqsJPrw@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@st.com>
Cc: AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Alex Marginean <alexandru.marginean@nxp.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Bin Meng <bmeng.cn@gmail.com>,
 Dario Binacchi <dariobin@libero.it>
Subject: Re: [Uboot-stm32] [PATCH v2 3/5] sandbox: dts: Add compatible
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

On Wed, 29 Apr 2020 at 06:20, Patrice Chotard <patrice.chotard@st.com> wrote:
>
> Usage of lists_bind_fdt() in bind command imposes to add
> a compatible string for bind-test node.
> The other impact, is that bind-test node is binded at sandbox
> start, so no need to bind it in test_bind_unbind_with_node() test
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
>
> Changes in v2: None
>
>  arch/sandbox/dts/test.dts  | 1 +
>  test/py/tests/test_bind.py | 3 ---
>  2 files changed, 1 insertion(+), 3 deletions(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
